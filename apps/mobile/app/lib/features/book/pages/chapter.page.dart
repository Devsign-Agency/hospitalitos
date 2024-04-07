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
  bool isCurrentLanguageInstalled = false;
  int end = 0;
  int positionLastWord = 0;
  OverlayEntry? _overlayEntry;
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

  int bottomNavigationBarCurrentIndex = 0;
  TtsState ttsState = TtsState.stopped;


  double offsetScroll = 0;
  PageController pageController = PageController();
  FToast? fToast;
  Map<String, dynamic> settingTextInitialValues = {
    'fontSize': 5.0,
    'margin': 1.0,
    'lineHeight': 1.0,
    'color': Colors.black
  };

  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;
  get isPaused => ttsState == TtsState.paused;
  get isContinued => ttsState == TtsState.continued;

  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isWeb => kIsWeb;
ScrollController scrollController =
      ScrollController(initialScrollOffset: 0.0);

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

  setColor(CircleButtonModel newCircleButton) {
    print('color: $newCircleButton');
    setState(() {
      textBook.color = newCircleButton.color;
      selectedCircleButton =
          CircleButtonModel(newCircleButton.name, newCircleButton.color);
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

    MarkerService markerService =
        Provider.of<MarkerService>(context, listen: true);
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkMode = themeProvider.currentTheme == DarkTheme.theme;

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
                      }, selectedColor: CircleButtonType.blue,
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
        'action': () => _handleChangeStatusAudio()
      },
    ];

    final List<ContextMenuButtonItem> menuButtonItems = [
      ContextMenuButtonItem(
        label: 'Escuchar',
        onPressed: () async {
          print('escuchar');
          _handleChangeStatusAudio();
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

   PopupMenuButton<int> popupMenuButton(
          List<PopupMenuItemModel> menuOptions, bool isDarkMode) => PopupMenuButton<int>(
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
  void _handleTapPageViewMarkerList(double offset) {
    bottomNavigationBarCurrentIndex = 0;

    pageController.animateToPage(0,
        duration: Duration(milliseconds: 500), curve: Curves.linear);

    // scrollController.removeListener(() {});
    setScrollController(offset);
    setState(() {});
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

class IndexPage extends StatefulWidget {
  static const String route = 'book/index';
  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as EpubArguments;
    final book = arguments.book;
    var count = 0;
    return Scaffold(
      appBar: CustomAppBar(
        title: book?.Title!,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Tab items
              CustomTabBar(
                  tabController: tabController,
                  items: IndexService.tabBarItems),

              // TabBarView
              SizedBox(
                height: height * 0.8,
                width: double.infinity,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    // Books Tab
                    ListChaptersOfBook(book: book),
                    Center(
                      child: Column(children: [
                        Text('Titulo: ${book!.Title!}'),
                        Text('Autor: ${book.Author}')
                      ]),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showTitle(String data, index, items) {
    print('title---------------- $data $index $items');
    var textToShow = '';

    return data;
  }

  findOcurrenceChapterArr(book) {
    var band = true;
    var pos = [];
    for (var i = 0; i < book!.Chapters!.length; i++) {
      String mainString = book.Chapters![i].Title.toLowerCase();
      String substring = "capítulo";

      if (mainString.contains(substring)) {
        band = false;
        pos.add(i);
      }
    }

    return pos;
  }

  makeDataToShow(book) {
    var band = true;
    var pos = [];
    for (var i = 0; i < book!.Chapters!.length; i++) {
      String mainString = book.Chapters![i].Title.toLowerCase();
      String substring = "capítulo";

      if (mainString.contains(substring)) {
        band = false;
        //book.Chapters![i].Title = book.Chapters![i].Title + '\n'+ book.Chapters![i + 1].Title;
      }
    }

    return pos;
  }

  changeTitle(book, index) {
    var title = book.Title;
    var band = true;
    print(title.toLowerCase().split(':')[0]);
    if ((title.toLowerCase().split(':')[0].contains('capítulo') ||
            title.toLowerCase().split(':')[0].contains('capitulo')) &&
        book.SubChapters!.isEmpty) {
      title = '';
      band = false;
    }

    print('title $title');

    return band;
  }

  comparateIndexPos(index, items) {
    var band = false;
    for (var i = 0; i < items.length; i++) {
      if (items[i] == index) {
        band = true;
      }
    }

    return band;
  }

  valueArrMenor(index, items) {
    var band = false;
    for (var i = 0; i < items.length; i++) {
      if (items[i] < index) {
        band = true;
      }
    }

    return band;
  }

  valueArrMax(index, items) {
    var band = false;
    for (var i = 0; i < items.length; i++) {
      if (items[i] > index) {
        band = true;
      }
    }

    return band;
  }

  subChaptersMenu(data, book) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(
                data[index].Title!,
                style: AppStyle.txtNunitoSansRegular16,
              ),
              onTap: () {
                // Navigator.pop(context);
                Navigator.pushNamed(context, ChapterPage.route,
                    arguments: EpubArguments(
                        book: book, chapter: book.Chapter[index]));
              });
        },
        itemCount: data.length);
  }
}

class ListChaptersOfBook extends StatelessWidget {
  const ListChaptersOfBook({
    super.key,
    required this.book,
  });

  final EpubBook? book;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          itemCount: book!.Chapters!.length,
          itemBuilder: (context, index) {
            var title = (book?.Chapters![index].Title!).toString();
            return title != ''
                ? ListTile(
                    title: Text(
                      title,
                      style: AppStyle.txtNunitoSansRegular16,
                    ),
                    onTap: () {
                      // Navigator.pop(context);
                      Navigator.pushNamed(context, ChapterPage.route,
                          arguments: EpubArguments(
                              book: book, chapter: book?.Chapters![index]));
                    })
                : Container();
          }),
    );
  }
}

class PopupAudioPlayer extends StatefulWidget {
  final String bookTitle;
  final String bookAuthor;
  final int end;
  final int max;
  final TtsState ttsState;
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
        ttsState = TtsState.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        print('Complete');
        ttsState = TtsState.stopped;
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
    ttsState = TtsState.playing;
    if (widget.voiceText != null) {
      await flutterTts.awaitSpeakCompletion(true);
      var result = await flutterTts.speak(widget.voiceText);
      if (result == 1) setState(() => ttsState = TtsState.playing);
    }
  }

  Future _pause() async {
    // positionLastWord = end;

    var result = await flutterTts.pause();
    if (result == 1) setState(() => ttsState = TtsState.paused);
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
  final TtsState ttsState;
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
      if (ttsState != TtsState.playing) {
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
