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
<<<<<<< HEAD
  late PdfViewerController _pdfViewerController;
  OverlayEntry? _overlayEntry;
  int i = 0;
  String? _newVoiceText;
  List<String> sentences = [];
  TtsState ttsState = TtsState.stopped;
  int _newVoiceTextLenght = 0;
  String parsedEpubString = '';
  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;
  get isPaused => ttsState == TtsState.paused;
  get isContinued => ttsState == TtsState.continued;
=======

  TextBook textBook = TextBook(
      fontFamily: 'fontFamily',
      color: ColorConstant.black900,
      size: 32.0,
      margin: 14.0,
      lineHeight: LineHeight.number(1.2),
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
>>>>>>> feat/subchapters

  int bottomNavigationBarCurrentIndex = 0;

  PageController pageController = PageController();
  FToast? fToast;

  int i = 0;
  String parsedString = '';
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
<<<<<<< HEAD
    initTts();
    getTextFromEpubInstance();
=======
>>>>>>> feat/subchapters

    fToast = FToast();
    fToast?.init(context);
  }

<<<<<<< HEAD
  buildAudioText(String newVoiceText) async {
    var count = newVoiceText.length;
    var max = 4000;
    var loopCount = count ~/ max;

    for (var i = 0; i <= loopCount; i++) {
      if (i != loopCount) {
        sentences.add(newVoiceText.substring(i * max, (i + 1) * max));
        // await flutterTts
        //     .speak(_newVoiceText!.substring(i * max, (i + 1) * max));
      } else {
        var end = (count - ((i * max)) + (i * max));
        sentences.add(newVoiceText.substring(i * max, end));

        // await flutterTts.speak(_newVoiceText!.substring(i * max, end));
      }
    }
    _newVoiceTextLenght = loopCount;
    _newVoiceText = sentences[i];
    i++;
    setState(() {});
  }

  initTts() {
    flutterTts = FlutterTts();
=======
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
>>>>>>> feat/subchapters

    final arguments =
        ModalRoute.of(context)!.settings.arguments as EpubArguments;

<<<<<<< HEAD
    if (isAndroid) {
      _getEngines();
    }

    flutterTts.setStartHandler(() {
      setState(() {
        print("Playing");
        ttsState = TtsState.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        print("Complete");
        ttsState = TtsState.stopped;
        i++;
        if (i < _newVoiceTextLenght) {
          _newVoiceText = sentences[i];
          _speak();
        } else {
          positionLastWord = 0;
        }
      });
    });

    flutterTts.setCancelHandler(() {
      setState(() {
        print("Cancel");
        ttsState = TtsState.stopped;
      });
    });

    if (isWeb || isIOS) {
      flutterTts.setPauseHandler(() {
        setState(() {
          print("Paused");
          ttsState = TtsState.paused;
        });
      });

      flutterTts.setContinueHandler(() {
        setState(() {
          print("Continued");
          ttsState = TtsState.continued;
        });
      });
    }

    flutterTts.setErrorHandler((msg) {
      setState(() {
        print("error: $msg");
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

  Future _getLanguages() async {
    languages = await flutterTts.getLanguages;
    if (languages != null) setState(() => languages);
  }

  Future _getEngines() async {
    var engines = await flutterTts.getEngines;
    if (engines != null) {
      for (dynamic engine in engines) {
        print(engine);
      }
    }
  }

  Future _speak() async {
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);
    ttsState = TtsState.playing;
    // if (newVoiceText) {
    await flutterTts.awaitSpeakCompletion(true);
    var result = await flutterTts.speak(_newVoiceText!);
    print("RESULT $result");
    if (result == 1) setState(() => ttsState = TtsState.playing);
    // }
  }

  Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  Future _pause() async {
    positionLastWord = end;

    var result = await flutterTts.pause();
    if (result == 1) setState(() => ttsState = TtsState.paused);
  }

  _playText(parsedString) async {
    print('playText');
    TextToSpeech tts = TextToSpeech();

    onAudioSound ? tts.play(parsedString) : tts.stop();
=======
    parsedString = _parseDocumentToString(arguments.chapter!);
>>>>>>> feat/subchapters
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

<<<<<<< HEAD
    // //Extract all the text from the document.
    // String text = extractor.extractText();

    //Display the text.
    // _showResult(text);
    // print(text);

    //Load the PDF document.
    // PdfDocument loadedDocument = PdfDocument(
    //     inputBytes:
    //         File('assets/pdf/G.A.E - 19 nov 2022.pdf').readAsBytesSync());

    // //Get the first page from the document.
    // PdfPage loadedPage = loadedDocument.pages[0];
    // //Create a PDF Template.
    // PdfTemplate template = loadedPage.createTemplate();
    // //Create a new PDF document.
    // PdfDocument document = PdfDocument();
    // //Add the page.
    // PdfPage page = document.pages.add();
    // //Create the graphics.
    // PdfGraphics graphics = page.graphics;
    // //Draw the template.
    // graphics.drawPdfTemplate(template, Offset(0, 0));
    // //Save and dispose of the PDF document.
    // File('Output.pdf').writeAsBytes(await document.save());
    // document.dispose();

    // ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);

    // _onChange(data!.text!);

    setState(() {});
=======
    // _speak();
>>>>>>> feat/subchapters
  }

  void _onChange(String text) {
    setState(() {
      _newVoiceText = text;
    });
  }

<<<<<<< HEAD
  getTextFromEpubInstance() async {
    final byteData = await rootBundle.load('assets/epubs/book.epub');
    Directory tempDir = await getTemporaryDirectory();

    File tempVideo = File("${tempDir.path}/assets/my_video.mp4")
      ..createSync(recursive: true)
      ..writeAsBytesSync(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    File _epubFile = File(tempVideo.path);
    final contents = await _epubFile.readAsBytes();
    EpubBookRef epub = await EpubReader.openBook(contents.toList());
    var cont = await EpubReader.readTextContentFiles(epub.Content!.Html!);
    List<String> htmlList = [];
    for (var value in cont.values) {
      htmlList.add(value.Content!);
    }
    var doc = parse(htmlList.join());
    final String parsedString = parse(doc.body!.text).documentElement!.text;

    // print('text: $parsedString');
    parsedEpubString = parsedString;
    print(parsedEpubString);
    buildAudioText(parsedString);

    // setState(() {
    //   _newVoiceText = parsedString;

    //   print(_newVoiceText);
    // });
    // // await _playText(parsedString);
  }

  void _showContextMenu(
      BuildContext context, PdfTextSelectionChangedDetails details) {
    final OverlayState overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: details.globalSelectedRegion!.center.dy - 55,
        left: details.globalSelectedRegion!.bottomLeft.dx,
        child: ElevatedButton(
          onPressed: () {
            if (details.selectedText != null) {
              Clipboard.setData(ClipboardData(text: details.selectedText!));
              print('Text copied to clipboard: ${details.selectedText}');
              _pdfViewerController.clearSelection();
            }
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            )),
          ),
          child: const Text('Copy', style: TextStyle(fontSize: 17)),
        ),
      ),
    );
    overlayState.insert(_overlayEntry!);
=======
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
>>>>>>> feat/subchapters
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

  void _handleChangeSetting(dynamic event) {
    print('event: $event');
    textBook.fontSize = event['fontSize'];
    textBook.lineHeight = event['lineHeight'];
    textBook.margin = event['margin'];
    textBook.color = Colors.white;
    // textBook.circle = event['circle'];
    setState(() {});
  }

<<<<<<< HEAD
  Widget _btnSection() {
    print('TtsState: $ttsState');
    if (isAndroid) {
      if (ttsState != TtsState.playing) {
        print('Not playing: $ttsState');
        return _buildButtonColumn(Colors.red, Colors.redAccent,
            ImageConstant.imgArrowMedia, '', _speak);
      } else {
        print('Playing: $ttsState');
        return _buildButtonColumn(Colors.red, Colors.redAccent,
            ImageConstant.imgArrowdown, '', _pause);
      }
    }

    return Container();
  }

  CustomIconButton _buildButtonColumn(Color color, Color splashColor,
      String icon, String label, Function func) {
    return CustomIconButton(
      margin: getMargin(left: 8),
      height: getSize(58),
      width: getSize(58),
      variant: IconButtonVariant.FillIndigo,
      onTap: () => func(),
      child: CustomImageView(
        svgPath: icon,
      ),
    );
  }

  Widget _progressBar(int end) {
    // print('newVoiceText: $_newVoiceText $');
    print('value ${end / parsedEpubString.length}');
    return Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 5.0, right: 10),
        child: LinearProgressIndicator(
          backgroundColor: ColorConstant.indigo90033,
          valueColor: AlwaysStoppedAnimation<Color>(ColorConstant.indigo900),
          value: end / parsedEpubString.length,
        ));
  }

  void _handleChangeIndex(int index) {
    switch (index) {
      case 2:
        _pdfViewerKey.currentState?.openBookmarkView();

        break;
    }
  }

  Widget _buildSliders() {
    return Column(
      children: [_volume(), _pitch(), _rate()],
    );
  }

  Widget _volume() {
    return Slider(
        value: volume,
        onChanged: (newVolume) {
          setState(() => volume = newVolume);
        },
        min: 0.0,
        max: 1.0,
        divisions: 10,
        label: "Volume: $volume");
  }

  Widget _pitch() {
    return Slider(
      value: pitch,
      onChanged: (newPitch) {
        setState(() => pitch = newPitch);
      },
      min: 0.5,
      max: 2.0,
      divisions: 15,
      label: "Pitch: $pitch",
      activeColor: Colors.red,
    );
  }

  Widget _rate() {
    return Slider(
      value: rate,
      onChanged: (newRate) {
        setState(() => rate = newRate);
      },
      min: 0.0,
      max: 1.0,
      divisions: 10,
      label: "Rate: $rate",
      activeColor: Colors.green,
    );
  }

  Future<List<int>> _readDocumentData(String name) async {
    final ByteData data = await rootBundle.load('assets/pdf/$name');
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }

  void _showResult(String text) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Extracted text'),
            content: Scrollbar(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                child: Text(text),
              ),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Show Text'))
            ],
          );
        });
  }
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final Color? textIconColor;
  final String? icon;
  final String? title;
  final double? height;
  final List<Widget>? menuItem;
  final bool hideBack;
  final bool audioActive;
  final Function onChangeStatusAudio;

  const _CustomAppBar({
    super.key,
    this.backgroundColor = Colors.red,
    this.textIconColor = Colors.red,
    this.icon,
    this.title = '',
    this.menuItem,
    this.height: kToolbarHeight,
    this.hideBack = false,
    required this.audioActive,
    required this.onChangeStatusAudio,
  });
  @override
  Size get preferredSize => Size.fromHeight(height!);

=======
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

>>>>>>> feat/subchapters
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
              isDarkMode = !isDarkMode;
            });
          }),
      PopupMenuItemModel(
          id: 1,
          title: 'Ajustar texto',
          onTappedItem: (context) {
            showModalBottomSheet(
                backgroundColor: isDarkMode
                    ? ColorConstant.gray80040
                    : ColorConstant.whiteA700,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                context: context,
                builder: (context) => PanelSettingTextBook(
                      isDarkMode: isDarkMode,
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
        'color': isDarkMode
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
      backgroundColor:
          isDarkMode ? ColorConstant.black9001c : ColorConstant.gray100,
      appBar: CustomAppBar(
          hasCustomTitle: true,
          customTitle: Text(bookTitle,
              style: AppStyle.txtNunitoSansSemiBold26WhiteA700.copyWith(
                  color: isDarkMode
                      ? ColorConstant.whiteA700
                      : ColorConstant.black900)),
          backgroundColor:
              isDarkMode ? ColorConstant.black9001c : ColorConstant.gray100,
          leading: _goBackButton(context, book, isDarkMode),
          title: bookTitle,
          actions: actions,
          hasPopupMenu: true,
          popupMenuButton: _popupMenuButton(menuOptions, isDarkMode)),
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
                            color: isDarkMode
                                ? ColorConstant.whiteA700
                                : ColorConstant.black900,
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
                  voiceText: _newVoiceText,
                  bookTitle: bookTitle,
                  bookAuthor: bookAuthor,
                  onCompletion: () {},
                )
            ],
          ),

          // Page view chapter's markers
          PageViewBookmarks(
            isDarkMode: isDarkMode,
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
            isDarkMode: isDarkMode,
          )
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
          backgroundColor:
              isDarkMode ? ColorConstant.gray80040 : ColorConstant.gray100,
          currentIndex: bottomNavigationBarCurrentIndex,
          onChangeIndex: (index) => _handleChangeBottomNavigationBar(
              index, markerService, bookTitle, chapter),
          bottomMenuList: bottomMenuList),
    );
  }

  CustomIconButton _goBackButton(
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

  PopupMenuButton<int> _popupMenuButton(
          List<PopupMenuItemModel> menuOptions, bool isDarkMode) =>
      PopupMenuButton<int>(
          iconColor:
              isDarkMode ? ColorConstant.whiteA700 : ColorConstant.black900,
          color: isDarkMode ? ColorConstant.gray30002 : ColorConstant.gray100,
          constraints: BoxConstraints(
            minWidth: 200,
          ),
          offset: Offset(20, 60),
          itemBuilder: (context) => [
                ...menuOptions.map((item) => PopupMenuItem(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(item.title,
                              style: AppStyle.txtNunitoSansRegular18WhiteA700
                                  .copyWith(
                                      color: isDarkMode
                                          ? ColorConstant.whiteA700
                                          : ColorConstant.black900))),
                      onTap: () => item.onTappedItem(context),
                    ))
              ]);
}
