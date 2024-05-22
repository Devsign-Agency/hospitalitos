import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_app/core/models/BookBible.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/app_export.dart';
import '../../../../core/models/chip_item.dart';
import '../../../../shared/shared.dart';
import '../../../../themes/themes.dart';
import '../../../../widgets/filters_bar.dart';
import '../../../../widgets/widgets.dart';
import '../../../book/widgets/widgets.dart';
import 'widgets/widgets.dart';

class BookViewerScreen extends StatefulWidget {
  static const String route = 'book_viewer';
  const BookViewerScreen({super.key});

  @override
  State<BookViewerScreen> createState() => _BookViewerScreenState();
}

class _BookViewerScreenState extends State<BookViewerScreen> {
  bool _onAudioSound = false;
  Map<String, dynamic> _settingTextInitialValues = {
    'fontSize': 5.0,
    'margin': 1.0,
    'lineHeight': 1.0,
    'color': Colors.black
  };

  TextBook _textBook = TextBook(
      fontFamily: 'fontFamily',
      color: Colors.black,
      size: 32.0,
      margin: 14.0,
      lineHeight: 1.2,
      fontSize: FontSize.medium);
  String _newVoiceText = 'Hola';
  int _secuenceVerseIndex = 0;
  Map<String, dynamic> _verses = {};
  bool _playingVerses = false;
  VoidCallback? _onCompletion;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      BibleService bibleService =
          Provider.of<BibleService>(context, listen: false);

      Scrollable.ensureVisible(
          GlobalObjectKey(bibleService.startVerse).currentContext!);
    });
  }

  @override
  void dispose() {
    super.dispose();
    ClipboardService.clearCopyText();
  }

  void setVoiceText(String text) {
    setState(() {
      _newVoiceText = text;
    });
  }

  void setOnAudioSound(bool value) {
    setState(() {
      _onAudioSound = value;
    });
  }

  void playVerses(int start, int end) {
    setState(() {
      _newVoiceText = _verses[start.toString()];
      _secuenceVerseIndex = 1;
      Scrollable.ensureVisible(
          GlobalObjectKey(_secuenceVerseIndex).currentContext!);
    });

    _onCompletion = () {
      _secuenceVerseIndex = _secuenceVerseIndex + 1;

      if (_secuenceVerseIndex <= end) {
        Scrollable.ensureVisible(
            GlobalObjectKey(_secuenceVerseIndex).currentContext!);

        _newVoiceText = _verses[_secuenceVerseIndex.toString()];

        setState(() {});
      } else {
        _playingVerses = false;
        setOnAudioSound(false);
      }
    };
  }

  void handleButtonPlay(BibleService bibleService) {
    setOnAudioSound(!_onAudioSound);
    _playingVerses = !_playingVerses;

    if (_onAudioSound) {
      playVerses(1, _verses.length);
    } else {
      _onCompletion = null;
      _secuenceVerseIndex = 0;
      setOnAudioSound(false);
    }
    setState(() {});
  }

  void handleSelectedContent(SelectedContent? selectedContent) {
    if (selectedContent != null) {
      ClipboardService.setCopyText(selectedContent.plainText);
    }
  }

  Future<void> share(String value) async {
    await Share.share(value);
  }

  String getTitle(BibleService bibleService) =>
      '${bibleService.selectedBook.name} ${bibleService.selectedChapter.chapter}';

  void shareVerses(String title, Map<String, dynamic> mapVerses) {
    List<String> verseList = [];

    mapVerses.forEach((key, value) {
      verseList.add('$key) $value\n');
    });

    share('$title\n${verseList.join()}');
  }

  void shareSelectedText() async {
    share(await ClipboardService.getCopyText());
  }

  void playSelectedText() async {
    _newVoiceText = await ClipboardService.getCopyText();
    setOnAudioSound(true);
  }

  void handleChangeTextSetting(dynamic event, dynamic values) {
    _textBook.fontSize = event['fontSize'];
    _textBook.lineHeight = event['lineHeight'];
    _textBook.margin = event['margin'];
    _settingTextInitialValues['fontSize'] = values['fontSize'];
    _settingTextInitialValues['margin'] = values['margin'];
    _settingTextInitialValues['lineHeight'] = values['lineHeight'];
    // textBook.color = event['color'];
    setState(() {});
  }

  void showDialogMarker(BibleBookMark bookMark) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return PopupNewMarker(bookMark: bookMark);
        });
  }

  void showBottomSheet(bool isDarkTheme) {
    AppModalBottomSheet.modalBottomSheet(
        context,
        PanelSettingTextBook(
          isDarkMode: isDarkTheme,
          initialValues: _settingTextInitialValues,
          onChange: handleChangeTextSetting,
        ));
  }

  void handleEventFilter(BibleService bibleService, int id) {
    Chapter chapter = bibleService.selectedBook.chapters
        .firstWhere((element) => int.parse(element.chapter) == id);

    bibleService.selectedChapter = chapter;
    bibleService.startVerse = 1;

    Scrollable.ensureVisible(GlobalObjectKey(1).currentContext!);
  }

  @override
  Widget build(BuildContext context) {
    BibleService bibleService =
        Provider.of<BibleService>(context, listen: true);
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkTheme = themeProvider.currentTheme == DarkTheme.theme;
    BookBible book = bibleService.selectedBook;

    _verses = bibleService.versesByChapter;

    bibleService.setLastPage();

    final List<PopupMenuItemModel> menuOptions = [
      PopupMenuItemModel(
          id: 1,
          title: 'Ajustar texto',
          onTappedItem: () => showBottomSheet(isDarkTheme)),
      PopupMenuItemModel(
          id: 2,
          title: 'Compartir',
          onTappedItem: () =>
              shareVerses(getTitle(bibleService), bibleService.versesByChapter))
    ];

    final appBarActions = [
      {
        'icon': ImageConstant.imgMusicIndigo900,
        'color': isDarkTheme
            ? (_onAudioSound
                ? ColorConstant.indigo900
                : ColorConstant.whiteA700)
            : ColorConstant.gray800,
        'variant': !_onAudioSound
            ? IconButtonVariant.NoFill
            : IconButtonVariant.OutlinePurple50,
        'action': () => handleButtonPlay(bibleService),
      },
    ];

    final List<ContextMenuButtonItem> menuButtonItems = [
      ContextMenuButtonItem(label: 'Escuchar', onPressed: playSelectedText),
      ContextMenuButtonItem(label: 'Compartir', onPressed: shareSelectedText),
    ];

    List<ChipItem> filtersData = [];

    for (var element in book.chapters) {
      filtersData.add(ChipItem(
          id: int.parse(element.chapter),
          name: 'Capítulo  ${element.chapter}'));
    }
    double height = MediaQuery.of(context).size.height * 0.60;

    return Scaffold(
      appBar: CustomAppBar(
        title: getTitle(bibleService),
        actions: appBarActions,
        hasPopupMenu: true,
        popupMenuButton: CustomPopupMenuButton(
            isDarkMode: isDarkTheme, menuOptions: menuOptions),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Items filter
          Padding(
            padding: getPadding(bottom: 16),
            child: FiltersBar(
                selectedItem: int.parse(bibleService.selectedChapter.chapter),
                items: filtersData,
                onChangeSelected: (int id) =>
                    handleEventFilter(bibleService, id)),
          ),

          Expanded(
            child: SizedBox(
              height: 800,
              child: Stack(
                children: [
                  CustomSelectionArea(
                    onSelectionChanged: handleSelectedContent,
                    menuButtonItems: menuButtonItems,
                    child: Padding(
                      padding: getPadding(all: 0.0),
                      child: VerseList(
                          secuenceVerseIndex: _secuenceVerseIndex,
                          isDarkMode: isDarkTheme,
                          textBook: _textBook),
                    ),
                  ),

                  // Button back chapter
                  if (int.parse(bibleService.selectedChapter.chapter) > 1)
                    Positioned(
                      top: height,
                      left: 0,
                      child: ButtonNavigationChapter(
                          onTap: () => bibleService.moveChapter('back'),
                          icon: Icons.arrow_back),
                    ),

                  // Button next chapter
                  if (int.parse(bibleService.selectedChapter.chapter) <
                      bibleService.selectedBook.chapters.length)
                    Positioned(
                        right: 0,
                        top: height,
                        child: ButtonNavigationChapter(
                            onTap: () => bibleService.moveChapter('next'),
                            icon: Icons.arrow_forward)),

                  // Player Text
                  if (_onAudioSound)
                    ConstrainedBox(
                      constraints: BoxConstraints(minHeight: 400),
                      child: PopupAudioPlayer(
                        onCompletion: _onCompletion,
                        voiceText: _newVoiceText,
                        bookTitle: getTitle(bibleService),
                        bookAuthor: '',
                      ),
                    )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: bibleService.selectedVerses.isNotEmpty &&
              !_onAudioSound
          ? FloatingActionButton(
              onPressed: () async {
                BibleBookMarkService bibleBookMarkService =
                    Provider.of<BibleBookMarkService>(context, listen: false);
                BibleBookMark bookMark = await bibleBookMarkService.addBookMark(
                    book,
                    bibleService.selectedChapter,
                    bibleService.selectedVerses.keys.toList()[0],
                    '');
                Fluttertoast.showToast(msg: 'Marcador guardado exitosamenete');

                showDialogMarker(bookMark);
              },
              backgroundColor: ColorConstant.indigo900,
              child: Icon(
                Icons.bookmark,
                color: ColorConstant.whiteA700,
              ))
          : null,
    );
  }
}
