import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:mobile_app/themes/dark_theme.dart';
import 'package:provider/provider.dart';
import '../../../core/app_export.dart';
import '../../../shared/shared.dart';
import '../../../widgets/widgets.dart';

class ChapterPage extends StatefulWidget {
  static const String route = 'book/chapter';
  final EpubBook book;
  final EpubChapter chapter;

  const ChapterPage({Key? key, required this.book, required this.chapter})
      : super(key: key);

  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

enum TtsState { playing, stopped, paused, continued }

class _ChapterPageState extends State<ChapterPage> {
  late EpubController _epubController;
  late EpubBook de;
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  bool onAudioSound = false;
  late FlutterTts flutterTts;
  dynamic languages;
  String? language;
  double volume = 0.5;
  double pitch = 1.0;
  double rate = 0.5;
  bool isCurrentLanguageInstalled = false;
  int end = 0;

  String? _newVoiceText;

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
    initTts();
    // getTextFromEpubInstance();

    _epubController = EpubController(
      // Load document

      document: Future.delayed(
          Duration(
            milliseconds: 200,
          ), () {
        return widget.book;
      }),
      // Set start point
      // epubCfi: 'epubcfi(/6/6[chapter-2]!/4/2/1612)',
    );
  }

  initTts() {
    flutterTts = FlutterTts();

    _getLanguages();

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
      setState(() {
        end = endOffset;
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

    if (_newVoiceText != null) {
      await flutterTts.awaitSpeakCompletion(true);
      await flutterTts.speak(_newVoiceText!);
    }
  }

  Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  Future _pause() async {
    var result = await flutterTts.pause();
    if (result == 1) setState(() => ttsState = TtsState.paused);
  }

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

    print('text: $parsedString');
    await _playText(parsedString);
  }

  _playText(parsedString) async {
    print('playText');
    TextToSpeech tts = TextToSpeech();

    onAudioSound ? tts.play(parsedString) : tts.stop();
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }

  void _handleOnAudio() {}

  Color _getColorBg() {
    PdfDocument document = PdfDocument();

    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);

    return themeProvider.currentTheme != DarkTheme.theme
        ? Colors.white
        : Color(0xff1C1B1F);
  }

  void _handleChangeStatusAudio(BuildContext context) async {
    onAudioSound = !onAudioSound;
    // print(activeAudio);
    // PdfDocument document = PdfDocument(
    //     inputBytes: await _readDocumentData('Herram iniciar PCC.pdf'));

    // //Create a new instance of the PdfTextExtractor.
    // PdfTextExtractor extractor = PdfTextExtractor(document);

    // //Extract all the text from the document.
    // String text = extractor.extractText();

    // //Display the text.
    // // _showResult(text);

    // await _playText(text);

    displayDialogAndroid(context);

    setState(() {});
  }

  void _onChange(String text) {
    setState(() {
      _newVoiceText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _CustomAppBar(
        audioActive: onAudioSound,
        onChangeStatusAudio: _handleChangeStatusAudio,
      ),
      body: Stack(children: [
        SfPdfViewer.asset(
          'assets/pdf/Herram iniciar PCC.pdf',
          canShowPaginationDialog: true,
          pageSpacing: 2.0,
          key: _pdfViewerKey,
        ),
        // _inputSection(),
        // ttsState == TtsState.playing ? _progressBar(end) : Text("hola mundo"),
        // _buildSliders(),
        // _btnSection(),
        if (onAudioSound)
          DraggableScrollableSheet(
            initialChildSize: .15,
            minChildSize: .15,
            maxChildSize: .4,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                padding: getPadding(left: 16, right: 8, top: 8, bottom: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: ColorConstant.gray400,
                ),
                child: ListView(
                  controller: scrollController,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Título',
                          style: AppStyle.txtNunitoSansSemiBold20Black900,
                        ),
                        Text(
                          'Autor',
                          style: AppStyle.txtNunitoSansSemiBold13Indigo900,
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          )
      ]),
      bottomNavigationBar:
          _CustomBottomNavigationBar(onChangeIndex: _handleChangeIndex),
    );
  }

  Widget _inputSection() => Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
      child: TextField(
        onChanged: (String value) {
          _onChange(value);
        },
      ));

  Widget _btnSection() {
    if (isAndroid) {
      return Container(
          padding: EdgeInsets.only(top: 50.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            _buildButtonColumn(Colors.green, Colors.greenAccent,
                Icons.play_arrow, 'PLAY', _speak),
            _buildButtonColumn(
                Colors.red, Colors.redAccent, Icons.stop, 'STOP', _stop),
          ]));
    } else {
      return Container(
          padding: EdgeInsets.only(top: 50.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            _buildButtonColumn(Colors.green, Colors.greenAccent,
                Icons.play_arrow, 'PLAY', _speak),
            _buildButtonColumn(
                Colors.red, Colors.redAccent, Icons.stop, 'STOP', _stop),
            _buildButtonColumn(
                Colors.blue, Colors.blueAccent, Icons.pause, 'PAUSE', _pause),
          ]));
    }
  }

  Column _buildButtonColumn(Color color, Color splashColor, IconData icon,
      String label, Function func) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              icon: Icon(icon),
              color: color,
              splashColor: splashColor,
              onPressed: () => func()),
          Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: Text(label,
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: color)))
        ]);
  }

  Widget _progressBar(int end) => Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
      child: LinearProgressIndicator(
        backgroundColor: Colors.red,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
        value: end / _newVoiceText!.length,
      ));

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

  void displayDialogAndroid(BuildContext context) {
    DraggableScrollableSheet(
      initialChildSize: .2,
      minChildSize: .1,
      maxChildSize: .6,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          margin: EdgeInsets.only(bottom: 10),
          color: Colors.lightGreen[100],
          child: ListView(
            controller: scrollController,
            children: [],
          ),
        );
      },
    );
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

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        'id': 0,
        'name': 'Modo Noche',
        'onTap': (context) {
          ThemeProvider themeProvider =
              Provider.of<ThemeProvider>(context, listen: false);
          themeProvider.currentTheme == DarkTheme.theme
              ? themeProvider.setLightMode()
              : themeProvider.setDarkMode();
        }
      },
      {'id': 1, 'name': 'Ajustar texto', 'onTap': (context) {}},
      {'id': 2, 'name': 'Compartir', 'onTap': onShareBook},
    ];

    return AppBar(
      // backgroundColor: ColorConstant.gray50,
      title: Align(
          alignment: Alignment.centerLeft,
          child: Text('$title', style: AppStyle.txtNunitoSansSemiBold26)),
      actions: [
        CustomIconButton(
          margin: getMargin(left: 8),
          height: getSize(48),
          width: getSize(48),
          variant: !audioActive
              ? IconButtonVariant.NoFill
              : IconButtonVariant.FillIndigo90033,
          onTap: () {
            onChangeStatusAudio(context);
          },
          child: CustomImageView(
            svgPath: ImageConstant.imgMusicIndigo900,
          ),
        ),

        SizedBox(width: 32),
        // Menu
        PopupMenuButton<int>(
          constraints: BoxConstraints(
            minWidth: 200,
          ),
          offset: Offset(20, 60),
          color: Colors.white,
          itemBuilder: (context) => [
            ...menuItems.map((item) => PopupMenuItem(
                  value: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(item['name'],
                        style: AppStyle.txtNunitoSansRegular18Black900),
                  ),
                  onTap: () => item['onTap'](context),
                ))
          ],
          onSelected: (int index) {},
        )
      ],
    );
  }

  void onShareBook(context) => showModalBottomSheet(
      // backgroundColor: ColorConstant.gray50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      context: context,
      builder: (context) => ModalBottomSheet());
}

class _CustomBottomNavigationBar extends StatefulWidget {
  final Function onChangeIndex;

  const _CustomBottomNavigationBar({
    super.key,
    required this.onChangeIndex,
  });

  @override
  State<_CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState
    extends State<_CustomBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Map<dynamic, dynamic>> items = [
      {'id': 0, 'name': '', 'image': ImageConstant.imgEditGray800},
      {'id': 1, 'name': '', 'image': ImageConstant.imgBookmarkGray800},
      {'id': 2, 'name': '', 'image': ImageConstant.imgBookmark},
      {'id': 3, 'name': '', 'image': ImageConstant.imgShareGray50},
    ];
    return BottomNavigationBar(
        // type: BottomNavigationBarType.shifting,
        backgroundColor: ColorConstant.gray50,
        currentIndex: _currentIndex,
        onTap: _changeCurrentIndex,
        items: [
          ...items.map((item) => BottomNavigationBarItem(
                label: '',
                icon: _BottomNavigationBarItemIcon(
                    image: item['image'],
                    isSelected: item['id'] == _currentIndex),
              ))
        ]);
  }

  void _changeCurrentIndex(int index) {
    _currentIndex = index;
    widget.onChangeIndex(index);
    setState(() {});
  }
}

class _BottomNavigationBarItemIcon extends StatelessWidget {
  final String image;
  final bool isSelected;

  const _BottomNavigationBarItemIcon({
    super.key,
    required this.image,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      height: 48,
      width: 48,
      variant: isSelected
          ? IconButtonVariant.FillIndigo90033
          : IconButtonVariant.NoFill,
      child: CustomImageView(color: ColorConstant.indigo900, svgPath: image),
    );
  }
}
