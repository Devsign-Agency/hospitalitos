import 'dart:io';
import 'package:epub_view/epub_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:mobile_app/core/models/book.dart';
import 'package:mobile_app/themes/dark_theme.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import '../../../core/app_export.dart';
import '../../../shared/shared.dart';
import '../../../widgets/widgets.dart';

class AudioPlayerScreen extends StatefulWidget {
  static const String route = 'audio-palyer';
  const AudioPlayerScreen({Key? key}) : super(key: key);

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

// enum TtsStates { playing, stopped, paused, continued }

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  late FlutterTts flutterTts;
  dynamic languages;
  String? language;
  double volume = 0.5;
  double pitch = 1.0;
  double rate = 0.8;
  bool isCurrentLanguageInstalled = false;
  int end = 0;
  int positionLastWord = 0;
  OverlayEntry? _overlayEntry;

  String? _newVoiceText;
  String parsedEpubString = '';
  int _sentencesCount = 0;
  int i = 0;
  List<String> sentences = [];
  TtsStates ttsState = TtsStates.stopped;
  late TextToSpeech ttsProvider;
  String doc2 = """
    <h1>Hola mundo</h1>
  """;
  String htmlContent = '';
  late Book book = Book(id: '', name: '', image: '');
  get isPlaying => ttsState == TtsStates.playing;
  get isStopped => ttsState == TtsStates.stopped;
  get isPaused => ttsState == TtsStates.paused;
  get isContinued => ttsState == TtsStates.continued;

  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isWeb => kIsWeb;

  @override
  void initState() {
    super.initState();
    initTts();
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments;
    book = arguments as Book;

    getTextFromEpubInstance(book.path!);
  }

  initTts() {
    flutterTts = FlutterTts();

    flutterTts.setStartHandler(() {
      setState(() {
        print('Playing');
        ttsState = TtsStates.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        print('Complete');
        ttsState = TtsStates.stopped;
        i++;
        if (i < _sentencesCount) {
          _newVoiceText = sentences[i];
          _speak();
        } else {
          positionLastWord = 0;
        }
      });
    });

    if (isWeb || isIOS) {
      flutterTts.setPauseHandler(() {
        setState(() {
          print('Paused');
          ttsState = TtsStates.paused;
        });
      });

      flutterTts.setContinueHandler(() {
        setState(() {
          print('Continued');
          ttsState = TtsStates.continued;
        });
      });
    }

    flutterTts.setErrorHandler((msg) {
      setState(() {
        ttsState = TtsStates.stopped;
      });
    });

    flutterTts.setProgressHandler(
        (String text, int startOffset, int endOffset, String word) {
      setState(() {
        end = endOffset + positionLastWord;
      });
    });
  }

  Future _speak() async {
    print('speak');
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);
    ttsState = TtsStates.playing;
    if (_newVoiceText != null) {
      await flutterTts.awaitSpeakCompletion(true);
      var result = await flutterTts.speak(_newVoiceText!);
      if (result == 1) setState(() => ttsState = TtsStates.playing);
    }
  }

  Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsStates.stopped);
  }

  Future _pause() async {
    positionLastWord = end;

    var result = await flutterTts.pause();
    if (result == 1) setState(() => ttsState = TtsStates.paused);
  }

  fragmentNewVoiceText(String newVoiceText) async {
    var count = newVoiceText.length;
    var max = 4000;
    var loopCount = count ~/ max;

    for (var i = 0; i <= loopCount; i++) {
      if (i != loopCount) {
        sentences.add(newVoiceText.substring(i * max, (i + 1) * max));
      } else {
        var end = (count - ((i * max)) + (i * max));
        sentences.add(newVoiceText.substring(i * max, end));
      }
    }
    _sentencesCount = loopCount;
    _newVoiceText = sentences[i];
    setState(() {});
  }

  getTextFromEpubInstance(String path) async {
    final byteData = await rootBundle.load('assets/epubs/$path.epub');
    Directory tempDir = await getTemporaryDirectory();

    File tempVideo = File("${tempDir.path}/assets/my_video.mp4")
      ..createSync(recursive: true)
      ..writeAsBytesSync(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    File epubFile = File(tempVideo.path);
    final contents = await epubFile.readAsBytes();
    EpubBookRef epub = await EpubReader.openBook(contents.toList());
    var cont = await EpubReader.readTextContentFiles(epub.Content!.Html!);
    var opt = await epub.getChapters();
    var aux = await EpubReader.readChapters(opt);
    print(aux);
    List<String> htmlList = [];
    List<String> htmlList2 = [];
    for (var value in cont.values) {
      // print(value);
      htmlList.add(value.Content!);
    }
    var doc = parse(htmlList.join());
    final String parsedString = parse(doc.body!.text).documentElement!.text;

    htmlList2.add(aux[0].HtmlContent!);
    htmlContent = aux[2].HtmlContent!;
    var doc3 = parse(htmlList2.join());
    print(parse(doc3.body!.text).documentElement!.text);
    // doc2 = parse(doc3.body!.text).body!.innerHtml;
    parsedEpubString = parsedString;
    // parsedEpubString =
    //     'Uno dos tres cuatro cinco seis siete ocho nueve diez once doce trece catoce quince';
    fragmentNewVoiceText(parsedEpubString);
  }

  setVolumen(double newVolume) async {
    setState(() {
      print('New volumen $newVolume');
      volume = newVolume;
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
    // _pause();
    // _speak();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Reproduciendo',
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 18, vertical: 32),
          child: Column(
            children: [
              _BookImage(book: book),
              SizedBox(height: 40),
              _BookTitleAndAuthor(book: book),
              SizedBox(height: 30),
              _progressBar(),
              SizedBox(height: 63),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _btnModeDarkOrLight(context),
                  _btnPlayOrPause(),
                  _btnSetting(onShareBook, context, setVolumen, setPitch,
                      setRate, volume, rate),
                ],
              ),
              Text(doc2),
              Container(
                child: SelectionArea(child: Html(data: htmlContent)),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onShareBook(context, setVolumen, setPitch, setRate, volume, rate) =>
      showModalBottomSheet(
          // backgroundColor: ColorConstant.gray50,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          context: context,
          builder: (context) => _PanelSettingsVoicePlayer(
              onSetVolumen: setVolumen,
              onSetPitch: setPitch,
              onSetRate: setRate,
              volume: volume,
              rate: rate));

  CustomIconButton _btnSetting(
      Function func,
      BuildContext context,
      Function setVolumen,
      Function setPitch,
      Function setRate,
      double volume,
      double rate) {
    return CustomIconButton(
      margin: getMargin(left: 8),
      height: getSize(58),
      width: getSize(58),
      variant: IconButtonVariant.FillGray300,
      onTap: () => func(context, setVolumen, setPitch, setRate, volume, rate),
      child: CustomImageView(
        svgPath: ImageConstant.imgSettings,
        color: ColorConstant.indigo900,
      ),
    );
  }

  CustomIconButton _btnModeDarkOrLight(BuildContext context) {
    return CustomIconButton(
      margin: getMargin(left: 8),
      height: getSize(58),
      width: getSize(58),
      variant: IconButtonVariant.FillGray300,
      onTap: () {
        ThemeProvider themeProvider =
            Provider.of<ThemeProvider>(context, listen: false);
        themeProvider.currentTheme == DarkTheme.theme
            ? themeProvider.setLightMode()
            : themeProvider.setDarkMode();
      },
      child: CustomImageView(
        svgPath: ImageConstant.imgMoonIndigo,
        color: ColorConstant.indigo900,
      ),
    );
  }

  CustomIconButton _buildButtonColumn(
      String icon, Function func, IconButtonVariant variant) {
    return CustomIconButton(
      margin: getMargin(left: 8),
      height: getSize(58),
      width: getSize(58),
      variant: variant,
      onTap: () => func(),
      child: CustomImageView(
        svgPath: icon,
        color: ColorConstant.indigo900,
      ),
    );
  }

  Widget _btnPlayOrPause() {
    if (isAndroid) {
      return ttsState != TtsStates.playing
          ? _buildButtonColumn(ImageConstant.imgPlayIndigo900, _speak,
              IconButtonVariant.FillYellow)
          : _buildButtonColumn(
              ImageConstant.imgArrowdown, _pause, IconButtonVariant.FillYellow);
    }

    return Container();
  }

  Widget _progressBar() {
    return Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 5.0, right: 10),
        child: LinearProgressIndicator(
          value:
              parsedEpubString.isNotEmpty ? (end / parsedEpubString.length) : 0,
        ));
  }
}

class _PanelSettingsVoicePlayer extends StatelessWidget {
  final Function onSetVolumen;
  final Function onSetPitch;
  final Function onSetRate;
  final double volume;
  final double rate;

  const _PanelSettingsVoicePlayer({
    super.key,
    required this.onSetVolumen,
    required this.onSetPitch,
    required this.onSetRate,
    required this.volume,
    required this.rate,
  });

  // double volume = 0.0;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkMode = themeProvider.currentTheme == DarkTheme.theme;
    return Padding(
      padding: getPadding(left: 16, right: 16, bottom: 20),
      child: Wrap(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: getMargin(top: 16, bottom: 28),
              width: 32,
              height: 4,
              color: ColorConstant.gray600,
            ),
          ),
          _buildSliders(isDarkMode, volume, rate),
        ],
      ),
    );
  }

  Widget _buildSliders(bool isDarkMode, double volume, double rate) {
    TextStyle labelStyle = isDarkMode
        ? AppStyle.txtNunitoSansSemiBold16WhiteA700
        : AppStyle.txtNunitoSansSemiBold16Indigo900;
    Color iconColor =
        isDarkMode ? ColorConstant.whiteA700 : ColorConstant.indigo90075;
    return Column(
      children: [
        CustomSlider(
            onSetVolumen: onSetVolumen,
            icon: Icons.volume_up_rounded,
            indicator: 'Volumen',
            label: 'Volumen',
            labelStyle: labelStyle,
            iconColor: iconColor,
            min: 0.0,
            max: 1.0,
            value: volume),
        CustomSlider(
            onSetVolumen: onSetRate,
            icon: Icons.flash_on_rounded,
            indicator: 'Velocidad',
            label: 'Velocidad',
            labelStyle: labelStyle,
            iconColor: iconColor,
            min: 0.0,
            max: 1.0,
            value: rate),
      ],
    );
  }
}

class _BookTitleAndAuthor extends StatelessWidget {
  const _BookTitleAndAuthor({
    super.key,
    required this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    ThemeData currentTheme = themeProvider.currentTheme;
    bool isDarkTheme = currentTheme == DarkTheme.theme;

    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 260,
                child: Text(
                  book.name,
                  style: isDarkTheme
                      ? AppStyle.txtNunitoSansSemiBold26WhiteA700
                      : AppStyle.txtNunitoSansSemiBold26,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                book.author ?? '',
                style: isDarkTheme
                    ? AppStyle.txtNunitoSansRegular18WhiteA700
                    : AppStyle.txtNunitoSansRegular18Black900,
              ),
            ],
          ),
          // CustomIconButton(
          //   margin: getMargin(left: 8),
          //   height: getSize(48),
          //   width: getSize(48),
          //   variant: IconButtonVariant.NoFill,
          //   onTap: () {},
          //   child: CustomImageView(
          //     svgPath: ImageConstant.imgFavoriteGray800,
          //     color: Colors.red,
          //   ),
          // ),
        ],
      ),
    );
  }
}

class _BookImage extends StatelessWidget {
  const _BookImage({
    super.key,
    required this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 340,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          image: DecorationImage(
              image: AssetImage(book.image != ''
                  ? 'assets/images/${book.image}'
                  : 'assets/images/img_media.png'),
              fit: BoxFit.fill)),
    );
  }
}
