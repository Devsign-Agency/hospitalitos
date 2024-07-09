import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mobile_app/features/book/screens/chapter/widgets/epub_table_content.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:html/parser.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/app_export.dart';
import '../../../../shared/shared.dart';
import '../../../../themes/themes.dart';
import '../../widgets/widgets.dart';
import '../screens.dart';
import 'widgets/widgets.dart';

class ChapterScreen extends StatefulWidget {
  static const String route = 'book/chapter';

  const ChapterScreen({Key? key}) : super(key: key);

  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  bool _showTextPlayer = false;
  Map<String, dynamic> _settingTextInitialValues = {
    'fontSize': 8.0,
    'margin': 1.0,
    'lineHeight': 1.0,
    'color': const Color.fromARGB(255, 211, 187, 187)
  };

  TextBook textBook = TextBook(
      fontFamily: 'fontFamily',
      color: ColorConstant.black900,
      size: 32.0,
      margin: 14.0,
      lineHeight: 1.2,
      fontSize: FontSize.xLarge);

  String _newVoiceText = '';

  double _offsetScroll = 0;
  ScrollController _scrollController =
      ScrollController(initialScrollOffset: 0.0);

  String parsedString = '';
  bool isDarkTheme = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      DrawerService drawerService =
          Provider.of<DrawerService>(context, listen: false);
      _scrollController.addListener(() {
        _offsetScroll = _scrollController.position.pixels;
      });

      if (drawerService.isFirstOpen) {
        _key.currentState!.openDrawer();
        drawerService.isFirstOpen = false;
      }

      setState(() {});
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();

    Clipboard.setData(ClipboardData(text: ''));
    super.dispose();
  }

  void playSelectedText() async {
    _newVoiceText = await ClipboardService.getCopyText();
    setState(() {
      _showTextPlayer = true;
    });
  }

  void setScrollController(double offset) async {
    if (_scrollController.hasClients) {
      await _scrollController.animateTo(offset,
          duration: Duration(milliseconds: 1000), curve: Curves.bounceIn);
    }
    setState(() {});
  }

  void handleSelectedContent(SelectedContent? selectedContent) {
    if (selectedContent != null) {
      ClipboardService.setCopyText(selectedContent.plainText);
    }
  }

  void _handleChangeSetting(dynamic event, dynamic values) {
    textBook.fontSize = event['fontSize'];
    textBook.lineHeight = event['lineHeight'];
    textBook.margin = event['margin'];
    textBook.color = Colors.white;
    setState(() {});
  }

  String _parseDocumentToString(EpubChapter? chapter) {
    dynamic htmlContent = parse(chapter!.HtmlContent!);

    return parse(htmlContent.body!.text).documentElement!.text;
  }

  void _share(String value) async {
    await Share.share(value);
  }

  void shareSelectedText() async {
    ClipboardData? selectedContent =
        await Clipboard.getData(Clipboard.kTextPlain);

    if (selectedContent != null) _share(selectedContent.text!);
  }

  void createBookmark(
      EpubBookmarkService bookmarkService, BookService bookService) async {
    ClipboardData? selectedContent =
        await Clipboard.getData(Clipboard.kTextPlain);

    if (selectedContent != null) {
      bookmarkService.createBookmark({
        'bookName': bookService.selectedBook.Title,
        'chapterName': bookService.subchapterSelected.Title,
        'text': selectedContent.text,
        'date': DateTime.now(),
        'offset': _offsetScroll.toString()
      });
    }

    Fluttertoast.showToast(msg: 'Marcador guardado con éxito');
  }

  void changeChapter(BookService bookService, String action) {
    bookService.moveSubchapter(action);
    _scrollController.animateTo(0.0,
        duration: Duration(milliseconds: 100), curve: Curves.bounceIn);
  }

  void handleChangePopupMenu(int option) {
    BookService bookService = Provider.of<BookService>(context, listen: false);

    switch (option) {
      case 1:
        // Open the bottom sheet modal of text settings
        AppModalBottomSheet.modalBottomSheet(
            context,
            PanelSettingTextBook(
              initialValues: _settingTextInitialValues,
              onChange: _handleChangeSetting,
            ));
        break;
      case 2:
        // Share the current chapter
        String parsedString =
            _parseDocumentToString(bookService.subchapterSelected);

        _share(
            '${bookService.selectedBook.Title!}\n${bookService.chapterTitle}\n$parsedString');
        break;
      case 3:
        // Navigate to bookmarks
        Navigator.of(context)
            .push(
          PageTransition(
              type: PageTransitionType.leftToRight,
              child: EpubBookmarkScreen(
                book: bookService.selectedBook,
              )),
        )
            .then((value) {
          setScrollController(0.0);
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    BookService bookService = Provider.of<BookService>(context, listen: true);
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkTheme = themeProvider.currentTheme == DarkTheme.theme;

    EpubBookmarkService bookmarkService =
        Provider.of<EpubBookmarkService>(context, listen: true);

    final List<ContextMenuButtonItem> menuButtonItems = [
      ContextMenuButtonItem(label: 'Escuchar', onPressed: playSelectedText),
      ContextMenuButtonItem(label: 'Compartir', onPressed: shareSelectedText),
    ];

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _key,
      appBar: EpubAppBar(
        title: bookService.selectedBook.Title!,
        isActivePlay: _showTextPlayer,
        onTapPlay: (bool value) => setState(() {
          _showTextPlayer = value;
          _newVoiceText =
              _parseDocumentToString(bookService.subchapterSelected);
        }),
        onSelectedMenu: handleChangePopupMenu,
      ),
      drawer: Drawer(
          child: EpubDrawerContent(
        book: bookService.selectedBook,
        chapter: bookService.subchapterSelected,
        isDarkMode: isDarkTheme,
      )),
      body: SizedBox(
        height: height,
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: CustomSelectionArea(
                onSelectionChanged: handleSelectedContent,
                menuButtonItems: menuButtonItems,
                child: EpubTableContent(
                  textBook: textBook,
                  book: bookService.selectedBook,
                  data: bookService.subchapterSelected.HtmlContent!,
                ),
              ),
            ),
            if (_showTextPlayer)
              PopupAudioPlayer(
                voiceText: _newVoiceText,
                bookTitle: bookService.selectedBook.Title ?? '',
                bookAuthor: bookService.selectedBook.Author ?? '',
                onCompletion: () {},
              ),
            EpubChapterBackButton(
                onTap: () => changeChapter(bookService, 'back')),
            EpubChapterNextButton(
                onTap: () => changeChapter(bookService, 'next')),
            EpubBookmarkButton(
                onTap: () {
                  if (bookmarkService.checkChapterBelongsToBookmark(
                      bookService.subchapterSelected.Title!)) {
                    bookmarkService.deleteBookmarkByChapterName(
                        bookService.subchapterSelected.Title!);
                    Fluttertoast.showToast(msg: 'Marcador eliminado con éxito');
                  } else {
                    createBookmark(bookmarkService, bookService);
                  }
                },
                icon: bookmarkService.checkChapterBelongsToBookmark(
                        bookService.subchapterSelected.Title!)
                    ? Icons.bookmark
                    : Icons.bookmark_border_outlined)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      floatingActionButton: !_showTextPlayer
          ? CustomFloatingActionButton(onTap: () {
              _showTextPlayer = false;
              setState(() {});
              _key.currentState!.openDrawer();
            })
          : null,
    );
  }
}
