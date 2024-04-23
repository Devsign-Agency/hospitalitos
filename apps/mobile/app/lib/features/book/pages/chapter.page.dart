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
  double? lineHeight;
  CircleButtonModel circle;

  TextBook(
      {required this.fontFamily,
      required this.color,
      required this.fontSize,
      this.margin,
      required this.lineHeight,
      required this.circle,
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
      lineHeight: 1.2,
      circle: CircleButtonModel(CircleButtonType.white, Colors.white),
      fontSize: FontSize.medium);

  String _newVoiceText = '';
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

  int i = 0;
  String parsedString = '';
  bool isDarkTheme = false;

  @override
  void initState() {
    super.initState();

    fToast = FToast();
    fToast?.init(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final arguments =
        ModalRoute.of(context)!.settings.arguments as EpubArguments;

    parsedString = _parseDocumentToString(arguments.chapter!);
  }

  @override
  void dispose() {
    super.dispose();

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

    // _speak();
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
      _shareDocument(chapter);
    }

    if (index != 3) {
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.linear);
    }

    setState(() {});
  }

  void handleSelectedContent(SelectedContent? selectedContent) {
    if (selectedContent != null) {
      ClipboardData data = ClipboardData(text: selectedContent.plainText);
      Clipboard.setData(data);
    }
  }

  void showCustomToast(String message) {
    fToast?.showToast(
      child: FttToast(text: message),
      toastDuration: const Duration(seconds: 3),
    );
  }

  void _handleChangeSetting(dynamic event, dynamic values) {
    print('event: $event');
    textBook.fontSize = event['fontSize'];
    textBook.lineHeight = event['lineHeight'];
    textBook.margin = event['margin'];
    textBook.color = Colors.white;
    // textBook.circle = event['circle'];
    setState(() {});
  }

  String _parseDocumentToString(EpubChapter? chapter) {
    dynamic htmlContent = parse(chapter!.HtmlContent!);

    return parse(htmlContent.body!.text).documentElement!.text;
  }

  void _share(String value) async {
    await Share.share(value);
  }

  void _shareDocument(EpubChapter? chapter) async {
    String parsedString = _parseDocumentToString(chapter);

    _share(parsedString);
  }

  Color getTextColor(CircleButtonType type) {
    Color color;
    if (type == CircleButtonType.black ||
        (type == CircleButtonType.grey) ||
        (type == CircleButtonType.brown) ||
        (type == CircleButtonType.red)) {
      color = ColorConstant.whiteA700;
    } else {
      color = ColorConstant.black900;
    }

    return color;
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
    bool isDarkTheme = themeProvider.currentTheme == DarkTheme.theme;

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
            setState(() {
              isDarkTheme = !isDarkTheme;
            });
          }),
      PopupMenuItemModel(
          id: 1,
          title: 'Ajustar texto',
          onTappedItem: (context) {
            showModalBottomSheet(
                backgroundColor: isDarkTheme
                    ? ColorConstant.gray80040
                    : ColorConstant.whiteA700,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                context: context,
                builder: (context) => PanelSettingTextBook(
                      isDarkMode: isDarkTheme,
                      initialValues: settingTextInitialValues,
                      onChange: _handleChangeSetting,
                    ));
          }),
      PopupMenuItemModel(
          id: 2,
          title: 'Compartir',
          onTappedItem: (context) {
            _shareDocument(chapter);
          })
    ];

    final actions = [
      {
        'icon': ImageConstant.imgMusicIndigo900,
        'color': isDarkTheme
            ? (onAudioSound ? ColorConstant.indigo900 : ColorConstant.whiteA700)
            : ColorConstant.gray800,
        'variant': !onAudioSound
            ? IconButtonVariant.NoFill
            : IconButtonVariant.OutlinePurple50,
        'action': () {
          setState(() {
            onAudioSound = !onAudioSound;
            _newVoiceText = parsedString;
          });
        }
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

            if (selectedContent != null) _share(selectedContent.text!);
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
          hasCustomTitle: true,
          customTitle: Text(bookTitle,
              style: AppStyle.txtNunitoSansSemiBold26WhiteA700.copyWith(
                  color: isDarkTheme
                      ? ColorConstant.whiteA700
                      : ColorConstant.black900)),
          leading: CustomIconBackButton(isDarkTheme: isDarkTheme),
          title: bookTitle,
          actions: actions,
          hasPopupMenu: true,
          popupMenuButton: CustomPopupMenuButton(
              isDarkMode: isDarkTheme, menuOptions: menuOptions)),
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
                            color: isDarkTheme
                                ? ColorConstant.whiteA700
                                : ColorConstant.black900,
                            lineHeight: LineHeight(textBook.lineHeight),
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
                  voiceText: _newVoiceText,
                  bookTitle: bookTitle,
                  bookAuthor: bookAuthor,
                  onCompletion: () {},
                )
            ],
          ),

          // Page view chapter's markers
          PageViewBookmarks(
            isDarkMode: isDarkTheme,
            markerList: markerService.getMarkerList(bookTitle, chapter),
            onTapped: _handleTapPageViewMarkerList,
            onDeleteMarker: (marker) {
              markerService.deleteMarker(bookTitle, chapter, marker);
              showCustomToast('Marcador eliminado con éxito');
            },
          ),

          // Page view book's index
          PageViewIndex(
            book: book!,
            chapter: chapter!,
            isDarkMode: isDarkTheme,
          )
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: bottomNavigationBarCurrentIndex,
          onChangeIndex: (index) => _handleChangeBottomNavigationBar(
              index, markerService, bookTitle, chapter),
          bottomMenuList: bottomMenuList),
    );
  }
}
