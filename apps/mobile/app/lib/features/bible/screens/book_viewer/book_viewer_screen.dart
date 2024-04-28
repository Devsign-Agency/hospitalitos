import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_app/core/models/BookBible.dart';
import 'package:mobile_app/features/bible/screens/book_viewer/widgets/button_navigation_chapter.dart';
import 'package:mobile_app/features/bible/screens/book_viewer/widgets/popup_new_marker.dart';
import 'package:mobile_app/features/bible/screens/book_viewer/widgets/verse_list.dart';
import 'package:mobile_app/main.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/app_export.dart';
import '../../../../core/models/chip_item.dart';
import '../../../../shared/services/ftoast_service.dart';
import '../../../../shared/shared.dart';
import '../../../../themes/themes.dart';
import '../../../../widgets/filters_bar.dart';
import '../../../../widgets/widgets.dart';
import '../../../book/widgets/widgets.dart';

class BookViewerScreen extends StatefulWidget {
  static const String route = 'book_viewer';
  const BookViewerScreen({super.key});

  @override
  State<BookViewerScreen> createState() => _BookViewerScreenState();
}

class _BookViewerScreenState extends State<BookViewerScreen> {
  bool onAudioSound = false;
  Map<String, dynamic> settingTextInitialValues = {
    'fontSize': 5.0,
    'margin': 1.0,
    'lineHeight': 1.0,
    'color': Colors.black
  };
  String selectedVerse = '';
  TextBook textBook = TextBook(
      fontFamily: 'fontFamily',
      color: Colors.black,
      size: 32.0,
      margin: 14.0,
      lineHeight: 1.2,
      fontSize: FontSize.medium);

  String _newVoiceText = 'Hola';
  CircleButtonModel selectedCircleButton =
      CircleButtonModel(CircleButtonType.black, Colors.black);

  ScrollController scrollController =
      ScrollController(initialScrollOffset: 0.0);

  PageController pageController = PageController();
  FToast? fToast;

  int secuenceVerseIndex = 0;
  Map<String, dynamic> verses = {};
  bool playingVerses = false;
  int currentIndex = 0;
  VoidCallback? onCompletion;

  // GlobalKey<PopupAudioPlayerState> globalKey = GlobalKey();

  late void Function() myMethod = () {};

  @override
  void initState() {
    super.initState();

    // fToast = FToast();
    // fToast?.init(navigatorKey.currentContext!);

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
    Clipboard.setData(ClipboardData(text: ''));
  }

  void openPlayText() async {
    ClipboardData? kTextPlain;
    kTextPlain = await Clipboard.getData(Clipboard.kTextPlain);

    setVoiceText(kTextPlain?.text ?? '');
    setOnAudioSound(true);
  }

  void setVoiceText(String text) {
    setState(() {
      _newVoiceText = text;
    });
  }

  void setOnAudioSound(bool value) {
    setState(() {
      onAudioSound = value;
    });
  }

  void playVerses(int start, int end) {
    setState(() {
      _newVoiceText = verses[start.toString()];
      secuenceVerseIndex = 1;
      Scrollable.ensureVisible(
          GlobalObjectKey(secuenceVerseIndex).currentContext!);
    });

    onCompletion = () {
      secuenceVerseIndex = secuenceVerseIndex + 1;

      if (secuenceVerseIndex <= end) {
        Scrollable.ensureVisible(
            GlobalObjectKey(secuenceVerseIndex).currentContext!);

        _newVoiceText = verses[secuenceVerseIndex.toString()];

        setState(() {});
      } else {
        playingVerses = false;
        setOnAudioSound(false);
      }
    };
  }

  void handleButtonPlay(BibleService bibleService) {
    setOnAudioSound(!onAudioSound);
    playingVerses = !playingVerses;

    if (onAudioSound) {
      playVerses(1, verses.length);
    } else {
      onCompletion = null;
      secuenceVerseIndex = 0;
      setOnAudioSound(false);
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

  Future<void> share(String value) async {
    await Share.share(value);
  }

  String getTitle(BibleService bibleService) =>
      '${bibleService.selectedBook.name} ${bibleService.selectedChapter.chapter}';

  double convertFontSizePxToDouble(FontSize fontSize) {
    Map<FontSize, double> values = {
      FontSize.xSmall: 12.0,
      FontSize.xxSmall: 14.0,
      FontSize.smaller: 16.0,
      FontSize.small: 18.0,
      FontSize.medium: 24.0,
      FontSize.large: 32.0,
      FontSize.larger: 36.0,
      FontSize.xLarge: 40.0,
      FontSize.xxLarge: 48.0
    };

    return values[fontSize]!;
  }

  void shareVerses(String title, Map<String, dynamic> mapVerses) {
    List<String> verseList = [];

    mapVerses.forEach((key, value) {
      verseList.add('$key) $value\n');
    });

    share('$title\n${verseList.join()}');
  }

  void shareSelectedText() async {
    ClipboardData? selectedContent =
        await Clipboard.getData(Clipboard.kTextPlain);

    if (selectedContent != null) share(selectedContent.text!);
  }

  void playSelectedText() async {
    ClipboardData? kTextPlain;
    kTextPlain = await Clipboard.getData(Clipboard.kTextPlain);

    _newVoiceText = kTextPlain?.text ?? '';
    onAudioSound = true;

    setState(() {});
  }

  void addNewPageToFavorite(BibleService bibleService) {
    String message = '';
    if (bibleService.getPage() != '') {
      // bibleService.deletePage(bibleService.getCurrentPage());
      message = 'Página eliminada exitosamente';
      setState(() {});
    } else {
      // bibleService.addNewPage(usernameController.text);
      message = 'Página guardada en favoritos exitosamente';
      setState(() {});
    }

    showCustomToast(message);
  }

  void handleChangeTextSetting(dynamic event, dynamic values) {
    textBook.fontSize = event['fontSize'];
    textBook.lineHeight = event['lineHeight'];
    textBook.margin = event['margin'];
    settingTextInitialValues['fontSize'] = values['fontSize'];
    settingTextInitialValues['margin'] = values['margin'];
    settingTextInitialValues['lineHeight'] = values['lineHeight'];
    // textBook.color = event['color'];
    setState(() {});
  }

  showDialogMarker() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return PopupNewMarker();
        });
  }

  @override
  Widget build(BuildContext context) {
    BibleService bibleService =
        Provider.of<BibleService>(context, listen: true);
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkTheme = themeProvider.currentTheme == DarkTheme.theme;
    BookBible book = bibleService.selectedBook;

    verses = bibleService.versesByChapter;

    bibleService.setLastPage();

    final List<PopupMenuItemModel> menuOptions = [
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
                      isDarkMode: isDarkTheme,
                      initialValues: settingTextInitialValues,
                      onChange: handleChangeTextSetting,
                    ));
          }),
      PopupMenuItemModel(
          id: 2,
          title: 'Compartir',
          onTappedItem: (context) =>
              shareVerses(getTitle(bibleService), bibleService.versesByChapter))
    ];

    final appBarActions = [
      {
        'icon': ImageConstant.imgMusicIndigo900,
        'color': isDarkTheme
            ? (onAudioSound ? ColorConstant.indigo900 : ColorConstant.whiteA700)
            : ColorConstant.gray800,
        'variant': !onAudioSound
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

    return Scaffold(
      backgroundColor:
          isDarkTheme ? ColorConstant.black9001c : ColorConstant.gray100,
      appBar: CustomAppBar(
        hasCustomTitle: true,
        customTitle: Text(getTitle(bibleService),
            style: isDarkTheme
                ? AppStyle.txtNunitoSansSemiBold26WhiteA700
                : AppStyle.txtNunitoSansSemiBold26),
        actions: appBarActions,
        leading: CustomIconBackButton(isDarkTheme: isDarkTheme),
        backgroundColor:
            isDarkTheme ? ColorConstant.black9001c : ColorConstant.gray50,
        hasPopupMenu: true,
        popupMenuButton: CustomPopupMenuButton(
            isDarkMode: isDarkTheme, menuOptions: menuOptions),
      ),
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          // Page view book viewer
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Items filter
              Padding(
                padding: getPadding(bottom: 16),
                child: FiltersBar(
                    selectedItem:
                        int.parse(bibleService.selectedChapter.chapter),
                    items: filtersData,
                    onChangeSelected: (int id) {
                      Chapter chapter = book.chapters.firstWhere(
                          (element) => int.parse(element.chapter) == id);

                      bibleService.selectedChapter = chapter;
                      bibleService.startVerse = 1;

                      Scrollable.ensureVisible(
                          GlobalObjectKey(1).currentContext!);
                    }),
              ),

              Expanded(
                child: SizedBox(
                  height: 800,
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        controller: scrollController,
                        child: CustomSelectionArea(
                          onSelectionChanged: handleSelectedContent,
                          menuButtonItems: menuButtonItems,
                          child: Padding(
                            padding: getPadding(all: 0.0),
                            child: VerseList(
                                secuenceVerseIndex: secuenceVerseIndex,
                                isDarkMode: isDarkTheme,
                                textBook: textBook),
                          ),
                        ),
                      ),

                      // Button back chapter
                      if (int.parse(bibleService.selectedChapter.chapter) > 1)
                        Positioned(
                          top: 250,
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
                            top: 250,
                            child: ButtonNavigationChapter(
                                onTap: () => bibleService.moveChapter('next'),
                                icon: Icons.arrow_forward)),
                      if (onAudioSound)
                        ConstrainedBox(
                          constraints: BoxConstraints(minHeight: 400),
                          child: PopupAudioPlayer(
                            onCompletion: onCompletion,
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
          // Page view chapter's markers
        ],
      ),
      floatingActionButton: bibleService.selectedVerses.isNotEmpty &&
              !onAudioSound
          ? FloatingActionButton(
              onPressed: () {
                bibleService.addNewPage('');
                Fluttertoast.showToast(msg: 'Marcador guardado exitosamenete');

                showDialogMarker();
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
