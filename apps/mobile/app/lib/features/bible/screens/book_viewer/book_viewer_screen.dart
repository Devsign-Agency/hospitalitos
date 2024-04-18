import 'dart:async';

import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_app/features/bible/screens/book_viewer/widgets/verse_list.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/app_export.dart';
import '../../../../shared/shared.dart';
import '../../../../themes/themes.dart';
import '../../../../widgets/widgets.dart';
import '../../../book/widgets/widgets.dart';

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
      lineHeight: LineHeight.number(1.2),
      fontSize: FontSize.medium);

  String _newVoiceText = '';
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

    fToast = FToast();
    fToast?.init(context);
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
      secuenceVerseIndex = start;
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
      playVerses(int.parse(bibleService.selectedVerses.keys.first),
          int.parse(verses.keys.last));
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
    Widget toast = FttToast(text: message);

    fToast?.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 3),
    );
  }

  Future<void> share(String value) async {
    await Share.share(value);
  }

  String getTitle(BibleService bibleService) {
    String title =
        '${bibleService.selectedBook.name} ${bibleService.selectedChapter.chapter},';

    String rangeVerse = bibleService.startVerse == bibleService.endVerse ||
            (bibleService.endVerse == -1)
        ? '${bibleService.startVerse.toInt()}'
        : '${bibleService.startVerse.toInt()}-${bibleService.endVerse.toInt()}';

    title = '$title $rangeVerse';

    return title;
  }

  @override
  Widget build(BuildContext context) {
    BibleService bibleService =
        Provider.of<BibleService>(context, listen: false);
    bool isDarkTheme = bibleService.isDarkTheme;

    verses = bibleService.selectedVerses;

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
                      isDarkMode: isDarkTheme,
                      initialValues: settingTextInitialValues,
                      onChange: (dynamic event) {
                        print(event['fontSize']);
                        textBook.fontSize = event['fontSize'];
                        textBook.lineHeight = event['lineHeight'];
                        textBook.margin = event['margin'];
                        textBook.color = event['color'];
                        // print(textBook.fontSize.value);
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

    final appBarActions = [
      {
        'icon': ImageConstant.imgFavorite,
        'color': isDarkTheme ? ColorConstant.whiteA700 : ColorConstant.gray800,
        'variant': bibleService.getPage() == ''
            ? IconButtonVariant.NoFill
            : IconButtonVariant.OutlinePurple50,
        'action': () {
          if (bibleService.getPage() != '') {
            bibleService.deletePage(bibleService.getCurrentPage());
            showCustomToast('Página eliminada exitosamente');
            setState(() {});
          } else {
            bibleService.addNewPage();
            showCustomToast('Página guardada en favoritos exitosamente');
            setState(() {});
          }
        },
      },
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
      ContextMenuButtonItem(
        label: 'Escuchar',
        onPressed: () async {
          ClipboardData? kTextPlain;
          kTextPlain = await Clipboard.getData(Clipboard.kTextPlain);

          _newVoiceText = kTextPlain?.text ?? '';
          onAudioSound = true;

          setState(() {});
        },
      ),
      ContextMenuButtonItem(
          label: 'Compartir',
          onPressed: () async {
            ClipboardData? selectedContent =
                await Clipboard.getData(Clipboard.kTextPlain);

            if (selectedContent != null) share(selectedContent.text!);
          }),
    ];

    return Scaffold(
      backgroundColor: isDarkTheme ? Color(0xff1C1B1F) : ColorConstant.gray100,
      appBar: CustomAppBar(
        hasCustomTitle: true,
        customTitle: Text(getTitle(bibleService),
            style: isDarkTheme
                ? AppStyle.txtNunitoSansSemiBold26WhiteA700
                : AppStyle.txtNunitoSansSemiBold26),
        actions: appBarActions,
        leading: CustomIconButton(
          margin: getMargin(left: 8),
          height: getSize(48),
          width: getSize(48),
          variant: IconButtonVariant.NoFill,
          onTap: () => Navigator.of(context).pop(),
          child: CustomImageView(
            svgPath: isDarkTheme
                ? ImageConstant.imgArrowleftGray900
                : ImageConstant.imgArrowleftWhiteA700,
            color:
                isDarkTheme ? ColorConstant.whiteA700 : ColorConstant.gray800,
          ),
        ),
        backgroundColor: isDarkTheme ? Color(0xff1C1B1F) : ColorConstant.gray50,
      ),
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
                        children: [
                          ..._buildVerseList(bibleService, isDarkTheme),
                          SizedBox(height: 20)
                        ],
                      )),
                ),
              ),
              if (onAudioSound)
                PopupAudioPlayer(
                  onCompletion: onCompletion,
                  voiceText: _newVoiceText,
                  bookTitle: getTitle(bibleService),
                  bookAuthor: '',
                )
            ],
          ),
          // Page view chapter's markers
        ],
      ),
    );
  }

  List<Widget> _buildVerseList(BibleService bibleService, bool isDarkMode) {
    Color borderColor =
        isDarkMode ? ColorConstant.purple50 : ColorConstant.indigo900;
    List<Widget> versesList = [];
    Map<String, dynamic> selectedVerses = bibleService.selectedVerses;
    int i = bibleService.startVerse;

    selectedVerses.forEach((key, value) {
      versesList.add(Container(
          width: double.infinity,
          key: GlobalObjectKey(i),
          padding: getPadding(left: 16, right: 16),
          decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(
                      color: secuenceVerseIndex == i
                          ? borderColor
                          : ColorConstant.transparent,
                      width: secuenceVerseIndex == i ? 6.0 : 0.0))),
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
                        ? AppStyle.txtNunitoSansRegular18WhiteA700
                        : AppStyle.txtNunitoSansRegular18Gray900,
                    // style: TextStyle(
                    //   color: textBook.color,
                    //   fontSize: textBook.fontSize.value,
                    //   height: textBook.lineHeight!.size,
                    //   // fontSize: convertFontSizeToPx(textBook.fontSize),
                    // ),
                  ),
                ),
              ]),
              SizedBox(
                height: 20,
              )
            ],
          )));

      i++;
    });

    return versesList;
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
