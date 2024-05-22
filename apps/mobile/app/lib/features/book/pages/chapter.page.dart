import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:epub_view/epub_view.dart';
import 'package:mobile_app/features/book/pages/bookmarks_screen.dart';
import 'package:page_transition/page_transition.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:html/parser.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../../core/app_export.dart';
import '../../../shared/shared.dart';
import '../../../themes/themes.dart';
import '../../bible/screens/book_viewer/widgets/button_navigation_chapter.dart';
import '../widgets/widgets.dart';

// import 'package:css_text/css_text.dart';
class ChapterPage extends StatefulWidget {
  static const String route = 'book/chapter';

  const ChapterPage({Key? key}) : super(key: key);

  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  bool onAudioSound = false;
  Map<String, dynamic> settingTextInitialValues = {
    'fontSize': 5.0,
    'margin': 1.0,
    'lineHeight': 1.0,
    'color': Colors.black
  };

  TextBook textBook = TextBook(
      fontFamily: 'fontFamily',
      color: ColorConstant.black900,
      size: 32.0,
      margin: 14.0,
      lineHeight: 1.2,
      fontSize: FontSize.medium);

  String _newVoiceText = '';

  Map<dynamic, dynamic> marker = {};
  double offsetScroll = 0;
  ScrollController scrollController =
      ScrollController(initialScrollOffset: 0.0);

  int bottomNavigationBarCurrentIndex = 0;

  PageController pageController = PageController();

  String parsedString = '';
  bool isDarkTheme = false;

  late EpubBook? book = EpubBook();
  late EpubChapter chapter = EpubChapter();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      BookService bookService =
          Provider.of<BookService>(context, listen: false);

      final arguments =
          ModalRoute.of(context)!.settings.arguments as EpubArguments;
      book = arguments.book;
      chapter = bookService.subchapterSelected;

      parsedString = _parseDocumentToString(arguments.chapter!);

      scrollController.addListener(() {
        offsetScroll = scrollController.position.pixels;
      });

      setState(() {});
    });
  }

  @override
  void dispose() {
    scrollController.dispose();

    Clipboard.setData(ClipboardData(text: ''));
    super.dispose();
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
  }

  void _onChange(String text) {
    setState(() {
      _newVoiceText = text;
    });
  }

  void setScrollController(double offset) async {
    // scrollController.removeListener(() {});
    // scrollController = ScrollController(initialScrollOffset: offset);
    if (scrollController.hasClients) {
      await scrollController.animateTo(offset,
          duration: Duration(milliseconds: 1000), curve: Curves.bounceIn);
    }

    // scrollController.addListener(() {
    //   offsetScroll = scrollController.position.pixels;

    //   print('offsetScroll: $offsetScroll');
    // });
    setState(() {});
  }

  void handleSelectedContent(SelectedContent? selectedContent) {
    if (selectedContent != null) {
      ClipboardData data = ClipboardData(text: selectedContent.plainText);
      Clipboard.setData(data);
    }
  }

  void _handleChangeSetting(dynamic event, dynamic values) {
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

  void _shareDocument(
      EpubChapter? chapter, String bookTitle, String title) async {
    String parsedString = _parseDocumentToString(chapter);

    _share('$parsedString\n');
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

  void showBottomSheet(bool isDarkTheme) {
    AppModalBottomSheet.modalBottomSheet(
        context,
        PanelSettingTextBook(
          isDarkMode: isDarkTheme,
          initialValues: settingTextInitialValues,
          onChange: _handleChangeSetting,
        ));
  }

  @override
  Widget build(BuildContext context) {
    BookService bookService = Provider.of<BookService>(context, listen: true);

    final String bookTitle = book?.Title ?? '';
    final String bookAuthor = book?.Author ?? '';

    MarkerService markerService =
        Provider.of<MarkerService>(context, listen: true);

    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkTheme = themeProvider.currentTheme == DarkTheme.theme;

    parsedString = _parseDocumentToString(bookService.subchapterSelected);

    final List<PopupMenuItemModel> menuOptions = [
      PopupMenuItemModel(
          id: 1,
          title: 'Ajustar texto',
          onTappedItem: () => showBottomSheet(isDarkTheme)),
      PopupMenuItemModel(
          id: 2,
          title: 'Compartir',
          onTappedItem: () {
            _shareDocument(chapter, bookTitle, bookService.chapterTitle);
          }),
      PopupMenuItemModel(
          id: 3,
          title: 'Marcadores',
          onTappedItem: () {
            Navigator.of(context)
                .push(
              PageTransition(
                  type: PageTransitionType.leftToRight,
                  child: BookmarksScreen(
                    book: book!,
                  )),
            )
                .then((value) {
              print(value);
              book = value.book;
              chapter = value.chapter;

              setScrollController(value.offset);
              setState(() {});
            });
          }),
    ];

    String findRefInBook(url) {
      var link = url!.split('_')[url!.split('_').length - 1];
      var index = int.parse(link);
      var item = '';
      var i = 0;

      LiturgyService liturgyService =
          Provider.of<LiturgyService>(context, listen: false);

      var data = liturgyService.data;

      for (var element in data) {
        var boookInstance = element['book'];
        if (book?.Title! == boookInstance) {
          item = data[i]['ref'][index - 1];
        }
        i++;
      }
      return item;
    }

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

            Fluttertoast.showToast(msg: 'Marcador guardado con éxito');
          }),
    ];

    double height = MediaQuery.of(context).size.height * 0.60;

    return Scaffold(
      key: _key,
      appBar: CustomAppBar(
          hasCustomTitle: true,
          customTitle: Text(bookTitle,
              style: AppStyle.txtNunitoSansSemiBold26WhiteA700.copyWith(
                  color: isDarkTheme
                      ? ColorConstant.whiteA700
                      : ColorConstant.black900)),
          leading: CustomIconBackButton(isDarkTheme: isDarkTheme),
          actions: actions,
          hasPopupMenu: true,
          popupMenuButton: CustomPopupMenuButton(
              isDarkMode: isDarkTheme, menuOptions: menuOptions)),
      drawer: Drawer(
          child: DrawerContent(
        book: book!,
        chapter: chapter!,
        isDarkMode: isDarkTheme,
      )),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            child: CustomSelectionArea(
              onSelectionChanged: handleSelectedContent,
              menuButtonItems: menuButtonItems,
              child: Padding(
                padding:
                    getPadding(left: textBook.margin, right: textBook.margin),
                child: Html(
                  onLinkTap: (url, _, __, ___) async {
                    var item = findRefInBook(url);

                    Fluttertoast.showToast(msg: item);
                  },
                  style: {
                    'body': Style(
                        fontSize: textBook.fontSize,
                        color: isDarkTheme
                            ? ColorConstant.whiteA700
                            : ColorConstant.black900,
                        lineHeight: LineHeight(textBook.lineHeight),
                        fontFamily:
                            Theme.of(context).textTheme.titleLarge!.fontFamily),
                  },
                  data: bookService.subchapterSelected.HtmlContent,
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
            ),
          if (bookService.hasChapterOrSubChapter() &&
              bookService.subchapterIndex > 0)
            Positioned(
              top: height,
              left: 0,
              child: ButtonNavigationChapter(
                  onTap: () => bookService.moveSubchapter('back'),
                  icon: Icons.arrow_back),
            ),
          if (bookService.hasChapterOrSubChapter() &&
              bookService.subchapterIndex <
                  bookService.selectedBook.Chapters![bookService.chapterIndex]
                          .SubChapters!.length -
                      1)
            Positioned(
                right: 0,
                top: height,
                child: ButtonNavigationChapter(
                    onTap: () => bookService.moveSubchapter('next'),
                    icon: Icons.arrow_forward)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConstant.black900.withOpacity(0.1),
        elevation: 0,
        onPressed: () {
          _key.currentState!.openDrawer();
        },
        child: Icon(
          Icons.menu,
          color: ColorConstant.indigo900,
        ),
      ),
    );
  }
}
