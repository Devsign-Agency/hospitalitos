import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/features/book/pages/index.page.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'package:provider/provider.dart';
import '../../../core/app_export.dart';
import '../../../shared/shared.dart';
import '../../../themes/themes.dart';
import '../widgets/widgets.dart';

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

  TextBook(
      {required this.fontFamily, required this.color, required this.fontSize});
}

class _ChapterPageState extends State<ChapterPage> {
  late EpubController _epubController;
  late EpubBook de;
  bool onAudioSound = false;
  late FlutterTts flutterTts;
  dynamic languages;
  String? language;
  double volume = 1;
  double pitch = 1;
  double rate = 2;
  bool isCurrentLanguageInstalled = false;
  int end = 0;
  int positionLastWord = 0;
  OverlayEntry? _overlayEntry;
  TextBook textBook = TextBook(
      fontFamily: 'fontFamily',
      color: ColorConstant.indigo900,
      fontSize: FontSize.medium);

  String? _newVoiceText;

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
  }

  void _handleChangeStatusAudio() async {
    onAudioSound = !onAudioSound;

    ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);

    _onChange(data!.text!);
  }

  // void _getClipboard() async {
  //     setState(() {
  //       _textValue = data.text;
  //     });
  //   }

  void _onChange(String text) {
    setState(() {
      _newVoiceText = text;
    });
  }

  void _handleChangeBottomNavigationBar(int index) {
    print('Handle change bottom navigation bar');
  }

  setVolumen(double newFontSize) async {
    setState(() {
      final int value = (newFontSize).toInt();
      print('VALUE: $value');
      textBook.fontSize = fontSizes[value];
      print('New fontSize $newFontSize');
      // volume = newVolume;

      // _speak();
      // flutterTts.setVolume(volume);
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
      print('New rate $newRate');
      rate = newRate;
    });
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

    final List<Map<String, dynamic>> menuOptions = [
      {
        'id': 0,
        'name': 'Modo Noche',
        'onTap': (context) {
          ThemeProvider themeProvider =
              Provider.of<ThemeProvider>(context, listen: false);
          themeProvider.currentTheme == DarkTheme.theme
              ? themeProvider.setLightMode()
              : themeProvider.setDarkMode();
        }
      },
      {
        'id': 1,
        'name': 'Ajustar texto',
        'onTap': (context) {
          showModalBottomSheet(
              // backgroundColor: ColorConstant.gray50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              context: context,
              builder: (context) => PanelSettingTextBook(
                  onSetVolumen: setVolumen,
                  onSetPitch: setPitch,
                  onSetRate: setRate,
                  volume: volume,
                  rate: rate));
        }
      },
      {'id': 2, 'name': 'Compartir', 'onTap': () {}},
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
        'action': () => _handleChangeStatusAudio()
      },
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
                      child: Text(item['name'],
                          style: isDarkMode
                              ? AppStyle.txtNunitoSansRegular18WhiteA700
                              : AppStyle.txtNunitoSansRegular18Black900),
                    ),
                    onTap: () => item['onTap'](context),
                  ))
            ]);

    return Scaffold(
      appBar: CustomAppBar(
          customTitle: Row(
            children: [
              CustomIconButton(
                height: getSize(48),
                width: getSize(48),
                variant: IconButtonVariant.NoFill,
                onTap: () {
                  Navigator.pushNamed(context, IndexPage.route,
                      arguments: EpubArguments(
                          book: book, chapter: book!.Chapters![0]));
                },
                child: CustomImageView(
                  svgPath: ImageConstant.imgArrowleftGray900,
                ),
              ),
              Text(bookTitle,
                  style: isDarkMode
                      ? AppStyle.txtNunitoSansSemiBold26WhiteA700
                      : AppStyle.txtNunitoSansSemiBold26)
            ],
          ),
          actions: actions,
          hasPopupMenu: true,
          hasCustomTitle: true,
          popupMenuButton: popupMenuButton),
      body: Stack(children: [
        SingleChildScrollView(
          child: SelectionArea(
            contextMenuBuilder: (context, selectable) {
              return Container();
            },
            onSelectionChanged: (SelectedContent? content) {
              if (content != null) {
                Clipboard.setData(ClipboardData(text: content.plainText));
              }
            },
            child: Html(
              style: {'body': Style(fontSize: textBook.fontSize)},
              data: chapter?.HtmlContent,
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
      ]),
      bottomNavigationBar: CustomBottomNavigationBar(
          onChangeIndex: _handleChangeBottomNavigationBar),
    );
  }
}
