import 'dart:io';

import 'package:epub_view/epub_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:html/parser.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/app_export.dart';
import '../../../../shared/shared.dart';
import '../../../../themes/themes.dart';
import '../../../../widgets/widgets.dart';
import '../../../book/widgets/widgets.dart';

class BookViewerScreen extends StatefulWidget {
  // final Map<String, dynamic> verses;

  static const String route = 'book_viewer';
  const BookViewerScreen({super.key});

  @override
  State<BookViewerScreen> createState() => _BookViewerScreenState();
}

// class _BookViewerScreenState extends State<BookViewerScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text('Book Viewer : ${widget.verses.length}'));
//   }
// }

class _BookViewerScreenState extends State<BookViewerScreen> {
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
    'circleButtonType': CircleButtonType.black
  };

  bool isCurrentLanguageInstalled = false;
  int end = 0;
  int positionLastWord = 0;
  String selectedVerse = '';

  // TextBook textBook = TextBook(
  //     fontFamily: 'fontFamily',
  //     color: ColorConstant.black900,
  //     size: 32.0,
  //     margin: 14.0,
  //     lineHeight: LineHeight.number(1.2),
  //     fontSize: FontSize.medium);

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

  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;
  get isPaused => ttsState == TtsState.paused;
  get isContinued => ttsState == TtsState.continued;

  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isWeb => kIsWeb;
  int i = 0;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    initTts();

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   Scrollable.ensureVisible(GlobalObjectKey(currentIndex).currentContext!);
    // });
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
    final verses =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkMode = themeProvider.currentTheme == DarkTheme.theme;

    MarkerService markerService =
        Provider.of<MarkerService>(context, listen: true);

    BibleService bibleService =
        Provider.of<BibleService>(context, listen: false);

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
                        // textBook.fontSize = event['fontSize'];
                        // textBook.lineHeight = event['lineHeight'];
                        // textBook.margin = event['margin'];
                        // textBook.color = event['color'];
                        setState(() {});
                      },
                    ));
          }),
      PopupMenuItemModel(
          id: 2,
          title: 'Compartir',
          onTappedItem: (context) {
            // String htmlContent = chapter!.HtmlContent!;
            // htmlList.add(htmlContent);
            // var doc3 = parse(htmlList.join());
            // share(parse(doc3.body!.text).documentElement!.text);
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

              // markerService.addNewMarker(bookTitle, chapter, marker);
            }
            showCustomToast('Marcador guardado con éxito');
          }),
    ];

    List<Widget> versesList = [];

    int i = 1;
    currentIndex = bibleService.verseNumber;

    Color borderColor =
        isDarkMode ? ColorConstant.purple50 : ColorConstant.indigo900;
    verses.forEach((key, value) {
      int startVerse = bibleService.startVerse;
      int endVerse = bibleService.endVerse;

      if (endVerse == -1) {
        endVerse = startVerse;
      }

      if (int.parse(key) >= startVerse && (int.parse(key) <= endVerse)) {
        versesList.add(Container(
            width: double.infinity,
            key: GlobalObjectKey(i),
            padding: getPadding(left: 16, right: 16),
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(
                        color: currentIndex == i
                            ? borderColor
                            : ColorConstant.transparent,
                        width: currentIndex == i ? 6.0 : 0.0))),
            child: Column(
              children: [
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('$i ',
                      style: isDarkMode
                          ? AppStyle.txtNunitoSansRegular14WhiteA700
                          : AppStyle.txtNunitoSansRegular14Black900),
                  Expanded(
                    child: Text(
                      '$value',
                      style: isDarkMode
                          ? AppStyle.txtNunitoSansRegular18WhiteA700.copyWith(
                              backgroundColor: selectedVerse == key
                                  ? ColorConstant.yellow100
                                  : ColorConstant.transparent)
                          : AppStyle.txtNunitoSansRegular18Black900.copyWith(
                              // decoration: TextDecoration.underline,
                              backgroundColor: selectedVerse == key
                                  ? ColorConstant.yellow100
                                  : ColorConstant.transparent),
                    ),
                  ),
                ]),
                SizedBox(
                  height: 20,
                )
              ],
            )));
      }

      i++;
    });

    String title =
        '${bibleService.selectedBook.name} ${bibleService.selectedChapter.chapter},';

    String rangeVerse = bibleService.startVerse == bibleService.endVerse ||
            (bibleService.endVerse == -1)
        ? '${bibleService.startVerse.toInt()}'
        : '${bibleService.startVerse.toInt()}-${bibleService.endVerse.toInt()}';

    title = '$title $rangeVerse';

    return Scaffold(
      appBar: CustomAppBar(
          // leading: goBackButton(context, book, isDarkMode),
          title: title,
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
                      padding: getPadding(all: 0.0),
                      child: Column(
                        children: [...versesList],
                      )),
                ),
              ),
              if (onAudioSound)
                PopupAudioPlayer(
                    bookTitle: title,
                    bookAuthor: '',
                    end: end,
                    max: _newVoiceText!.length,
                    ttsState: ttsState,
                    speak: _speak,
                    pause: _pause)
            ],
          ),

          // Page view chapter's markers
          PageViewBookmarks(
            markerList: markerService.getMarkerList('', {}),
            onTapped: _handleTapPageViewMarkerList,
            onDeleteMarker: (marker) {},
          ),
        ],
      ),

      // bottomNavigationBar: CustomBottomNavigationBar(
      //     currentIndex: bottomNavigationBarCurrentIndex,
      //     onChangeIndex: (index) {},
      //     bottomMenuList: bottomMenuList),
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

class TabBarViewChapters extends StatelessWidget {
  final Function onChangeTab;
  const TabBarViewChapters({
    super.key,
    required this.amountOfChapters,
    required this.onChangeTab,
  });

  final int amountOfChapters;

  @override
  Widget build(BuildContext context) {
    BibleService bibleService =
        Provider.of<BibleService>(context, listen: true);

    print(bibleService.selectedBook.name);
    final boxShadow = [
      BoxShadow(
        color: Color.fromRGBO(24, 39, 75, 0.08),
        offset: const Offset(0.0, 12.0),
        blurRadius: 32.0,
        spreadRadius: -4.0,
      ), //BoxSha
      BoxShadow(
        color: Color.fromRGBO(24, 39, 75, 0.08),
        offset: const Offset(0.0, 8.0),
        blurRadius: 18.0,
        spreadRadius: -6.0,
      ), //BoxShadow
    ];
    return Stack(
      children: [
        SingleChildScrollView(
          child: GridView.count(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 5,
            children: List.generate(bibleService.selectedBook.chapters.length,
                (index) {
              return Center(
                child: GestureDetector(
                  onTap: () {
                    bibleService.selectedChapter =
                        bibleService.selectedBook.chapters[index];
                  },
                  child: Container(
                    padding: getPadding(all: 10.0),
                    decoration: BoxDecoration(
                      color: bibleService.selectedChapter.chapter ==
                              (index + 1).toString()
                          ? ColorConstant.yellow100.withOpacity(0.2)
                          : null,
                    ),
                    child: Text(
                      '${index + 1}',
                      style: AppStyle.txtNunitoSansRegular18Gray900,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height - 350,
          left: 0,
          right: 0,
          child: GestureDetector(
            onTap: () => onChangeTab(),
            child: Container(
              width: double.infinity,
              height: getSize(48),
              decoration: BoxDecoration(
                  color: ColorConstant.yellow100,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: boxShadow),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Siguiente',
                  style: AppStyle.txtNunitoSansSemiBold16,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
