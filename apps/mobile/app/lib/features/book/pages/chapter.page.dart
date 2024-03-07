import 'dart:io';
import 'package:csslib/visitor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../../core/app_export.dart';
import '../../../shared/shared.dart';
import '../../../themes/themes.dart';
import '../widgets/widgets.dart';
// import 'package:css_text/css_text.dart';
import 'package:simple_html_css/simple_html_css.dart';

class ChapterPage extends StatefulWidget {
  static const String route = 'book/chapter';

  const ChapterPage({Key? key}) : super(key: key);

  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

enum TtsStates { playing, stopped, paused, continued }

List<FontSize> fontSizes = [
  FontSize.small,
  FontSize.medium,
  FontSize.larger,
  FontSize.xLarge
];

class TextBook {
  String fontFamily;
  FontSize fontSize;
  Color color;
  double size;
  double? margin;
  LineHeight? lineHeight;

  TextBook(
      {required this.fontFamily,
      required this.color,
      required this.fontSize,
      this.margin,
      required this.lineHeight,
      required this.size});
}

class _ChapterPageState extends State<ChapterPage> {
  late EpubController _epubController;
  late EpubBook de;
  bool onAudioSound = false;
  late FlutterTts flutterTts;
  dynamic languages;
  String? language;
  double volume = 0.5;
  double pitch = 1;
  double rate = 0.5;
  double fontSize = 5.0;
  double margin = 1.0;

  Map<dynamic, dynamic> settingTextInitialValues = {
    'fontSize': 5.0,
    'margin': 1.0,
    'lineHeight': 1.0,
    'circleButtonType': CircleButtonType.black
  };

  bool isCurrentLanguageInstalled = false;
  int end = 0;
  int positionLastWord = 0;

  TextBook textBook = TextBook(
      fontFamily: 'fontFamily',
      color: ColorConstant.black900,
      size: 32.0,
      margin: 14.0,
      lineHeight: LineHeight.number(1.2),
      fontSize: FontSize.medium);

  String? _newVoiceText;
  CircleButtonModel selectedCircleButton =
      CircleButtonModel(CircleButtonType.black, Colors.black);

  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;
  get isPaused => ttsState == TtsState.paused;
  get isContinued => ttsState == TtsState.continued;

  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isWeb => kIsWeb;

  @override
  void initState() {
    super.initState();
    initTts();
  }

  initTts() {
    flutterTts = FlutterTts();

    flutterTts.setStartHandler(() {
      setState(() {
        print('Playing');
        ttsState = TtsState.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        print('Complete');
        ttsState = TtsState.stopped;
        positionLastWord = 0;
        end = 0;
        closePlayText();
      });
    });

    flutterTts.setCancelHandler(() {
      setState(() {
        print('Cancel');
        ttsState = TtsState.stopped;
      });
    });

    if (isWeb || isIOS) {
      flutterTts.setPauseHandler(() {
        setState(() {
          print('Paused');
          ttsState = TtsState.paused;
        });
      });

      flutterTts.setContinueHandler(() {
        setState(() {
          print('Continued');
          ttsState = TtsState.continued;
        });
      });
    }

    flutterTts.setErrorHandler((msg) {
      setState(() {
        print('error: $msg');
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setProgressHandler(
        (String text, int startOffset, int endOffset, String word) {
      print('text: $text');
      print('startOffset: $startOffset');
      print('endOffset: $endOffset');
      print('word: $word');
      setState(() {
        // int index = _newVoiceText!.indexOf(word);

        // end = index + word.length;

        end = endOffset + positionLastWord;
      });
    });
  }

  Future _speak() async {
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);
    ttsState = TtsState.playing;
    if (_newVoiceText != null) {
      await flutterTts.awaitSpeakCompletion(true);
      var result = await flutterTts.speak(_newVoiceText!);
      print('RESULT $result');
      if (result == 1) setState(() => ttsState = TtsState.playing);
    }
  }

  Future _pause() async {
    positionLastWord = end;

    var result = await flutterTts.pause();
    if (result == 1) setState(() => ttsState = TtsState.paused);
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
    Clipboard.setData(ClipboardData(text: ''));
  }

  void _handleChangeStatusAudio() async {
    ClipboardData? data;
    onAudioSound = !onAudioSound;

    if (onAudioSound) {
      data = await Clipboard.getData(Clipboard.kTextPlain);
    } else {
      Clipboard.setData(ClipboardData(text: ''));
    }

    data != null ? _onChange(data.text!) : _onChange('');
  }

  void closePlayText() {
    onAudioSound = false;

    setState(() {});
  }

  void openPlayText() async {
    onAudioSound = true;
    ClipboardData? data;
    data = await Clipboard.getData(Clipboard.kTextPlain);

    data != null ? _onChange(data.text!) : _onChange('');

    _speak();
  }

  void _onChange(String text) {
    setState(() {
      _newVoiceText = text;
    });
  }

  void _handleChangeBottomNavigationBar(int index) {
    print('Handle change bottom navigation bar');
  }

  setFontSize(double newFontSize) async {
    Map<dynamic, FontSize> fontsizes = {
      '1.0': FontSize.xSmall,
      '2.0': FontSize.xxSmall,
      '3.0': FontSize.smaller,
      '4.0': FontSize.small,
      '5.0': FontSize.medium,
      '6.0': FontSize.large,
      '7.0': FontSize.larger,
      '8.0': FontSize.xLarge,
      '9.0': FontSize.xxLarge,
    };

    setState(() {
      settingTextInitialValues['fontSize'] = newFontSize;
      print(settingTextInitialValues['fontSize']);
      textBook.fontSize = fontsizes[newFontSize.toString()]!;
    });
    // _pause();
    // _speak();
  }

  setPitch(double newPitch) {
    setState(() {
      pitch = newPitch;
    });
  }

  setRate(double newRate) async {
    setState(() {
      rate = newRate;
    });
  }

  setColor(CircleButtonModel newCircleButton) {
    setState(() {
      textBook.color = newCircleButton.color;
      selectedCircleButton =
          CircleButtonModel(newCircleButton.name, newCircleButton.color);
    });
  }

  setMargin(double value) {
    Map<dynamic, double> marginValues = {
      '1.0': 14.0,
      '2.0': 18.0,
      '3.0': 24.0,
      '4.0': 28.0,
      '5.0': 32.0,
    };

    setState(() {
      settingTextInitialValues['margin'] = value;
      textBook.margin = marginValues[value.toString()]!;
    });
  }

  setLineHeight(double value) {
    Map<dynamic, LineHeight> lineHeightValues = {
      '1.0': LineHeight.number(1.2),
      '2.0': LineHeight.number(1.4),
      '3.0': LineHeight.number(1.6),
      '4.0': LineHeight.number(1.8),
      '5.0': LineHeight.number(2.0),
    };

    setState(() {
      settingTextInitialValues['lineHeight'] = value;
      textBook.lineHeight = lineHeightValues[value.toString()]!;
    });
  }

  void handleSelectedContent(SelectedContent? selectedContent) {
    if (selectedContent != null) {
      ClipboardData data = ClipboardData(text: selectedContent.plainText);
      Clipboard.setData(data);
    }
  }

  Future<void> share(String value) async {
    await Share.share(value);
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as EpubArguments;
    final book = arguments.book;
    final chapter = arguments.chapter;
    final String bookTitle = book?.Title ?? '';
    final String bookAuthor = book?.Author ?? '';

    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkMode = themeProvider.currentTheme == DarkTheme.theme;

    final List<BottomNavigationMenu> bottomMenuList = [
      BottomNavigationMenu(icon: ImageConstant.imgEditGray800),
      BottomNavigationMenu(icon: ImageConstant.imgBookmarkGray800),
      BottomNavigationMenu(icon: ImageConstant.imgBookmark),
      BottomNavigationMenu(icon: ImageConstant.imgShareGray50),
    ];

    final List<PopupMenuItemModel> menuOptions = [
      PopupMenuItemModel(
          id: 0,
          title: 'Modo Noche',
          onTappedItem: (context) {
            ThemeProvider themeProvider =
                Provider.of<ThemeProvider>(context, listen: false);
            themeProvider.currentTheme == DarkTheme.theme
                ? themeProvider.setLightMode()
                : themeProvider.setDarkMode();
          }),
      PopupMenuItemModel(
          id: 1,
          title: 'Ajustar texto',
          onTappedItem: (context) {
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                context: context,
                builder: (context) => PanelSettingTextBook(
                      onSetFontSize: setFontSize,
                      onSetMargin: setMargin,
                      onSetLineHeight: setLineHeight,
                      onSetPitch: setPitch,
                      onSetRate: setRate,
                      fontSize: settingTextInitialValues['fontSize'],
                      margin: settingTextInitialValues['margin'],
                      lineHeight: settingTextInitialValues['lineHeight'],
                      selectedCircleButton: selectedCircleButton,
                      onSetColor: setColor,
                    ));
          }),
      PopupMenuItemModel(
          id: 2,
          title: 'Compartir',
          onTappedItem: (context) {
            List<dynamic> htmlList = [];

            String htmlContent = chapter!.HtmlContent!;
            htmlList.add(htmlContent);
            var doc3 = parse(htmlList.join());
            share(parse(doc3.body!.text).documentElement!.text);
          })
    ];

    final actions = [
      {
        'icon': ImageConstant.imgMusicIndigo900,
        'color': isDarkMode
            ? (onAudioSound ? ColorConstant.indigo900 : ColorConstant.whiteA700)
            : ColorConstant.gray800,
        'variant': !onAudioSound
            ? IconButtonVariant.NoFill
            : IconButtonVariant.OutlinePurple50,
        'action': () {}
      },
    ];

    final List<ContextMenuButtonItem> menuButtonItems = [
      ContextMenuButtonItem(
        label: 'Escuchar',
        onPressed: () async {
          print('escuchar');
          openPlayText();
        },
      ),
      ContextMenuButtonItem(
          label: 'Compartir',
          onPressed: () async {
            ClipboardData? selectedContent =
                await Clipboard.getData(Clipboard.kTextPlain);

            if (selectedContent != null) share(selectedContent.text!);
          })
    ];

    final PopupMenuButton<int> popupMenuButton = PopupMenuButton<int>(
        constraints: BoxConstraints(
          minWidth: 200,
        ),
        offset: Offset(20, 60),
        itemBuilder: (context) => [
              ...menuOptions.map((item) => PopupMenuItem(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(item.title,
                          style: isDarkMode
                              ? AppStyle.txtNunitoSansRegular18WhiteA700
                              : AppStyle.txtNunitoSansRegular18Black900),
                    ),
                    onTap: () => item.onTappedItem(context),
                  ))
            ]);

    return Scaffold(
      appBar: CustomAppBar(
          leading: goBackButton(context, book, isDarkMode),
          title: bookTitle,
          actions: actions,
          hasPopupMenu: true,
          popupMenuButton: popupMenuButton),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: CustomSelectionArea(
              onSelectionChanged: handleSelectedContent,
              menuButtonItems: menuButtonItems,
              child: Padding(
                // padding: getPadding(left: 14, right: 14),
                padding:
                    getPadding(left: textBook.margin, right: textBook.margin),

                child: Html(
                  style: {
                    'body': Style(
                        fontSize: textBook.fontSize,
                        color: textBook.color,
                        lineHeight: textBook.lineHeight,
                        fontFamily:
                            Theme.of(context).textTheme.titleLarge!.fontFamily)
                  },
                  data: chapter?.HtmlContent,
                ),
              ),
            ),
          ),
          if (onAudioSound)
            PopupAudioPlayer(
                bookTitle: bookTitle,
                bookAuthor: bookAuthor,
                end: end,
                max: _newVoiceText!.length,
                ttsState: ttsState,
                speak: _speak,
                pause: _pause)
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
          onChangeIndex: _handleChangeBottomNavigationBar,
          bottomMenuList: bottomMenuList),
    );
  }

  CustomIconButton goBackButton(
          BuildContext context, EpubBook? book, bool isDarkMode) =>
      CustomIconButton(
        height: getSize(48),
        width: getSize(48),
        variant: IconButtonVariant.NoFill,
        onTap: () {
          Navigator.pop(context);
        },
        child: CustomImageView(
          svgPath: ImageConstant.imgArrowleftGray900,
          color: isDarkMode ? ColorConstant.whiteA700 : ColorConstant.gray900,
        ),
      );
}
