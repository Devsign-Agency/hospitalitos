import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:html/parser.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../../core/app_export.dart';
import '../../../shared/shared.dart';
import '../../../themes/themes.dart';
import '../widgets/widgets.dart';

// import 'package:css_text/css_text.dart';
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

  Map<String, dynamic> settingTextInitialValues = {
    'fontSize': 5.0,
    'margin': 1.0,
    'lineHeight': 1.0,
    'color': Colors.black
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

  List<Map<dynamic, dynamic>> markerList = [];
  List<Map<dynamic, dynamic>> markerListBook = [];
  Map<dynamic, dynamic> marker = {};
  double offsetScroll = 0;
  ScrollController scrollController =
      ScrollController(initialScrollOffset: 0.0);

  int bottomNavigationBarCurrentIndex = 0;

  PageController pageController = PageController();
  FToast? fToast;

  TtsStates ttsState = TtsStates.stopped;

  get isPlaying => ttsState == TtsStates.playing;
  get isStopped => ttsState == TtsStates.stopped;
  get isPaused => ttsState == TtsStates.paused;
  get isContinued => ttsState == TtsStates.continued;

  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isWeb => kIsWeb;
  int i = 0;

  @override
  void initState() {
    super.initState();
    initTts();

    fToast = FToast();
    fToast?.init(context);
  }

  initTts() {
    flutterTts = FlutterTts();

    scrollController.addListener(() {
      offsetScroll = scrollController.position.pixels;
    });

    flutterTts.setStartHandler(() {
      setState(() {
        print('Playing');
        ttsState = TtsStates.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        print('Complete');
        ttsState = TtsStates.stopped;
        positionLastWord = 0;
        end = 0;
        closePlayText();
      });
    });

    flutterTts.setCancelHandler(() {
      setState(() {
        print('Cancel');
        ttsState = TtsStates.stopped;
      });
    });

    if (isWeb || isIOS) {
      flutterTts.setPauseHandler(() {
        setState(() {
          print('Paused');
          ttsState = TtsStates.paused;
        });
      });

      flutterTts.setContinueHandler(() {
        setState(() {
          print('Continued');
          ttsState = TtsStates.continued;
        });
      });
    }

    flutterTts.setErrorHandler((msg) {
      setState(() {
        print('error: $msg');
        ttsState = TtsStates.stopped;
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
    ttsState = TtsStates.playing;
    if (_newVoiceText != null) {
      await flutterTts.awaitSpeakCompletion(true);
      var result = await flutterTts.speak(_newVoiceText!);
      print('RESULT $result');
      if (result == 1) setState(() => ttsState = TtsStates.playing);
    }
  }

  Future _pause() async {
    positionLastWord = end;

    var result = await flutterTts.pause();
    if (result == 1) setState(() => ttsState = TtsStates.paused);
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
    Clipboard.setData(ClipboardData(text: ''));
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

  void setScrollController(double offset) async {
    scrollController.removeListener(() {});
    scrollController = ScrollController(initialScrollOffset: offset);
    if (scrollController.hasClients) {
      await scrollController.animateTo(offset,
          duration: Duration(milliseconds: 1000), curve: Curves.bounceIn);
    }

    scrollController.addListener(() {
      offsetScroll = scrollController.position.pixels;
    });
    setState(() {});
  }

  void _handleTapPageViewMarkerList(double offset) {
    bottomNavigationBarCurrentIndex = 0;

    pageController.animateToPage(0,
        duration: Duration(milliseconds: 500), curve: Curves.linear);

    // scrollController.removeListener(() {});
    setScrollController(offset);
    setState(() {});
  }

  void _handleChangeBottomNavigationBar(int index, MarkerService markerService,
      String bookTitle, dynamic chapter) async {
    bottomNavigationBarCurrentIndex = index;
    // List<Map<dynamic, dynamic>> jsonDecode =
    //     json.decode(Preferences.markerList);

    // int i = jsonDecode.firstWhere((element) => element['title'] == bookTitle);
    if (index == 1) {
      markerService.getMarkerList(bookTitle, chapter);
    }

    if (index == 3) {
      List<dynamic> htmlList = [];

      String htmlContent = chapter!.HtmlContent!;
      htmlList.add(htmlContent);
      var doc3 = parse(htmlList.join());
      share(parse(doc3.body!.text).documentElement!.text);
    }

    if (index != 3) {
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.linear);
    }

    setState(() {});
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

  void handleSelectedContent(SelectedContent? selectedContent) {
    if (selectedContent != null) {
      ClipboardData data = ClipboardData(text: selectedContent.plainText);
      Clipboard.setData(data);
    }
  }

  Future<void> share(String value) async {
    await Share.share(value);
  }

  showCustomToast(String message) {
    Widget toast = Container(
      width: double.infinity,
      height: 48,
      padding: getPadding(left: 16, right: 16, top: 14, bottom: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: ColorConstant.black900ff,
      ),
      child: Text(
        message,
        style: AppStyle.txtRobotoRegular14Gray10002,
      ),
    );

    fToast?.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 3),
    );
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

    MarkerService markerService =
        Provider.of<MarkerService>(context, listen: true);

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
                      initialValues: settingTextInitialValues,
                      onChange: (dynamic event) {
                        print(event);
                        textBook.fontSize = event['fontSize'];
                        textBook.lineHeight = event['lineHeight'];
                        textBook.margin = event['margin'];
                        textBook.color = event['color'];
                        setState(() {});
                      },
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
          openPlayText();
        },
      ),
      ContextMenuButtonItem(
          label: 'Compartir',
          onPressed: () async {
            ClipboardData? selectedContent =
                await Clipboard.getData(Clipboard.kTextPlain);

            if (selectedContent != null) share(selectedContent.text!);
          }),
      ContextMenuButtonItem(
          label: 'Añadir a marcador',
          onPressed: () async {
            ClipboardData? selectedContent =
                await Clipboard.getData(Clipboard.kTextPlain);

            if (selectedContent != null) {
              DateTime now = DateTime.now();
              int year = now.year;
              int month = now.month;
              int day = now.day;
              String date = '$day/$month/$year';

              marker = {
                'id': DateTime.now().toString(),
                'text': selectedContent.text,
                'offset': offsetScroll,
                'date': date,
              };

              markerService.addNewMarker(bookTitle, chapter, marker);
            }
            showCustomToast('Marcador guardado con éxito');
          }),
    ];

    return Scaffold(
      appBar: CustomAppBar(
          leading: goBackButton(context, book, isDarkMode),
          title: bookTitle,
          actions: actions,
          hasPopupMenu: true,
          popupMenuButton: popupMenuButton(menuOptions, isDarkMode)),
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          // Page view book viewer
          Stack(
            children: [
              SingleChildScrollView(
                controller: scrollController,
                child: CustomSelectionArea(
                  onSelectionChanged: handleSelectedContent,
                  menuButtonItems: menuButtonItems,
                  child: Padding(
                    padding: getPadding(
                        left: textBook.margin, right: textBook.margin),
                    child: Html(
                      style: {
                        'body': Style(
                            fontSize: textBook.fontSize,
                            color: textBook.color,
                            lineHeight: textBook.lineHeight,
                            fontFamily: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .fontFamily)
                      },
                      data: chapter?.HtmlContent,
                    ),
                  ),
                ),
              ),
              if (onAudioSound)
                PopupAudioPlayer(
                    onAudioSound: false,
                    voiceText: '',
                    bookTitle: bookTitle,
                    bookAuthor: bookAuthor,
                    end: end,
                    max: _newVoiceText!.length,
                    ttsState: ttsState,
                    speak: _speak,
                    pause: _pause)
            ],
          ),

          // Page view chapter's markers
          PageViewBookmarks(
            markerList: markerService.getMarkerList(bookTitle, chapter),
            onTapped: _handleTapPageViewMarkerList,
            onDeleteMarker: (marker) {
              markerService.deleteMarker(bookTitle, chapter, marker);
              showCustomToast('Marcador eliminado con éxito');
            },
          ),

          // Page view book's index
          PageViewIndex(book: book!, chapter: chapter!)
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: bottomNavigationBarCurrentIndex,
          onChangeIndex: (index) => _handleChangeBottomNavigationBar(
              index, markerService, bookTitle, chapter),
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

  PopupMenuButton<int> popupMenuButton(
          List<PopupMenuItemModel> menuOptions, bool isDarkMode) =>
      PopupMenuButton<int>(
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
}

class PopupAudioPlayer extends StatefulWidget {
  final String bookTitle;
  final String bookAuthor;
  final int end;
  final int max;
  final TtsStates ttsState;
  final Function speak;
  final Function pause;
  final String voiceText;
  final bool onAudioSound;

  const PopupAudioPlayer(
      {super.key,
      required this.bookTitle,
      required this.bookAuthor,
      required this.end,
      required this.max,
      required this.ttsState,
      required this.speak,
      required this.pause,
      required this.voiceText,
      required this.onAudioSound});

  @override
  State<PopupAudioPlayer> createState() => PopupAudioPlayerState();
}

class PopupAudioPlayerState extends State<PopupAudioPlayer> {
  late FlutterTts flutterTts;
  dynamic languages;
  String? language;
  double volume = 0.5;
  double pitch = 1;
  double rate = 0.5;
  int end = 0;
  int positionLastWord = 0;
  TtsStates ttsState = TtsStates.stopped;
  get isPlaying => ttsState == TtsStates.playing;
  get isStopped => ttsState == TtsStates.stopped;
  get isPaused => ttsState == TtsStates.paused;
  get isContinued => ttsState == TtsStates.continued;

  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isWeb => kIsWeb;

  @override
  void initState() {
    super.initState();

    print('INIT AUDIO PLAYER WIDGET');

    initTts();
  }

  @override
  didChangeDependencies() {
    print('DID change dependencies');
    super.didChangeDependencies();
    sspeak();
  }

  void initTts() {
    flutterTts = FlutterTts();

    flutterTts.setStartHandler(() {
      setState(() {
        print('Playing');
        ttsState = TtsStates.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        print('Complete');
        ttsState = TtsStates.stopped;
        // positionLastWord = 0;
        // end = 0;

        // if (playingVerses) {
        //   playVerses();
        // } else {
        //   closePlayText();
        // }
      });
    });

    flutterTts.setCancelHandler(() {
      setState(() {
        print('Cancel');
        ttsState = TtsStates.stopped;
      });
    });

    if (isWeb || isIOS) {
      flutterTts.setPauseHandler(() {
        setState(() {
          print('Paused');
          ttsState = TtsStates.paused;
        });
      });

      flutterTts.setContinueHandler(() {
        setState(() {
          print('Continued');
          ttsState = TtsStates.continued;
        });
      });
    }

    flutterTts.setErrorHandler((msg) {
      setState(() {
        print('error: $msg');
        ttsState = TtsStates.stopped;
      });
    });

    flutterTts.setProgressHandler(
        (String text, int startOffset, int endOffset, String word) {
      setState(() {
        // int index = widget.voiceText!.indexOf(word);
        // end = index + word.length;
        end = endOffset + positionLastWord;
      });
    });
  }

  Future sspeak() async {
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);
    ttsState = TtsStates.playing;
    if (widget.voiceText != null) {
      await flutterTts.awaitSpeakCompletion(true);
      var result = await flutterTts.speak(widget.voiceText);
      if (result == 1) setState(() => ttsState = TtsStates.playing);
    }
  }

  Future _pause() async {
    // positionLastWord = end;

    var result = await flutterTts.pause();
    if (result == 1) setState(() => ttsState = TtsStates.paused);
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkMode = themeProvider.currentTheme == DarkTheme.theme;

    return DraggableScrollableSheet(
      initialChildSize: .16,
      minChildSize: .16,
      maxChildSize: .16,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          padding: getPadding(left: 16, right: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isDarkMode ? ColorConstant.gray80040 : ColorConstant.neutral,
          ),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              controller: scrollController,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _AudioPlayerTitleAndAuthor(
                        bookTitle: widget.bookTitle,
                        bookAuthor: widget.bookAuthor,
                        end: end,
                        max: widget.voiceText.length),
                    _AudioPlayerButton(
                      ttsState: ttsState,
                      speak: sspeak,
                      pause: _pause,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class _AudioPlayerTitleAndAuthor extends StatelessWidget {
  final String bookTitle;
  final String bookAuthor;
  final int end;
  final int max;

  const _AudioPlayerTitleAndAuthor(
      {super.key,
      required this.bookTitle,
      required this.bookAuthor,
      required this.end,
      required this.max});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkMode = themeProvider.currentTheme == DarkTheme.theme;
    Color colorBar =
        isDarkMode ? ColorConstant.purple50 : ColorConstant.indigo900;
    Color backgroundColorBar =
        isDarkMode ? ColorConstant.gray100 : ColorConstant.indigo90033;
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            bookTitle,
            style: isDarkMode
                ? AppStyle.txtNunitoSansSemiBold20WhiteA700
                : AppStyle.txtNunitoSansSemiBold20Black900,
          ),
          Text(
            bookAuthor,
            style: isDarkMode
                ? AppStyle.txtNunitoSansSemiBold13WhiteA700
                : AppStyle.txtNunitoSansSemiBold13Indigo900,
          ),
          _progressBar(end, colorBar, backgroundColorBar),
        ],
      ),
    );
  }

  Widget _progressBar(int end, Color valueColor, Color backgroundColor) {
    var a = end / max;
    print(a);
    print('end: $end/ $max');
    print('max: $max');
    return Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 5.0, right: 10),
        child: LinearProgressIndicator(
          backgroundColor: backgroundColor,
          color: ColorConstant.indigo900,
          valueColor: AlwaysStoppedAnimation<Color>(valueColor),
          value: a.isNaN || a.isInfinite ? 0.0 : end / max,
        ));
  }
}

class _AudioPlayerButton extends StatelessWidget {
  final TtsStates ttsState;
  final Function speak;
  final Function pause;

  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isWeb => kIsWeb;

  const _AudioPlayerButton(
      {super.key,
      required this.ttsState,
      required this.speak,
      required this.pause});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkMode = themeProvider.currentTheme == DarkTheme.theme;

    return _btnSection(isDarkMode);
  }

  Widget _btnSection(bool isDarkMode) {
    IconButtonVariant variant = isDarkMode
        ? IconButtonVariant.OutlinePurple50
        : IconButtonVariant.FillIndigo;
    Color colorIcon =
        isDarkMode ? ColorConstant.indigo900 : ColorConstant.whiteA700;

    if (isAndroid) {
      if (ttsState != TtsStates.playing) {
        return _buildButtonColumn(
            colorIcon, ImageConstant.imgArrowMedia, '', speak, variant);
      } else {
        return _buildButtonColumn(
            colorIcon, ImageConstant.imgArrowdown, '', pause, variant);
      }
    } else {
      return Container();
    }
  }

  CustomIconButton _buildButtonColumn(Color colorIcon, String icon,
      String label, Function func, IconButtonVariant variant) {
    return CustomIconButton(
      margin: getMargin(left: 8),
      height: getSize(58),
      width: getSize(58),
      variant: variant,
      onTap: () => func(),
      child: CustomImageView(svgPath: icon, color: colorIcon),
    );
  }
}
