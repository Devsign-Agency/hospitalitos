import 'dart:io';
import 'package:epub_view/epub_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'package:flutter/material.dart';
import 'package:html/parser.dart';
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
  double rate = 0.5;
  bool isCurrentLanguageInstalled = false;
  int end = 0;
  int positionLastWord = 0;
  OverlayEntry? _overlayEntry;

  String? _newVoiceText;

  TtsStates ttsState = TtsStates.stopped;
  late TextToSpeech ttsProvider;

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
    //initTts();

    getTextFromEpubInstance();
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
        ttsState = TtsStates.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        print("Complete");
        ttsState = TtsStates.stopped;
        positionLastWord = 0;
      });
    });

    flutterTts.setCancelHandler(() {
      setState(() {
        print("Cancel");
        ttsState = TtsStates.stopped;
      });
    });

    if (isWeb || isIOS) {
      flutterTts.setPauseHandler(() {
        setState(() {
          print("Paused");
          ttsState = TtsStates.paused;
        });
      });

      flutterTts.setContinueHandler(() {
        setState(() {
          print("Continued");
          ttsState = TtsStates.continued;
        });
      });
    }

    flutterTts.setErrorHandler((msg) {
      setState(() {
        print("error: $msg");
        ttsState = TtsStates.stopped;
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
    print('SPEAAAAAAAAAAAAAAAAAAAAAAAAAAKKKKKKKKKK');
    // await flutterTts.setVolume(volume);
    // await flutterTts.setSpeechRate(rate);
    // await flutterTts.setPitch(pitch);
    // ttsState = TtsStates.playing;
    if (_newVoiceText != null) {
      ttsProvider.play(_newVoiceText!);
      // await flutterTts.awaitSpeakCompletion(true);
      // var result = await flutterTts.speak(_newVoiceText!);
      // print("RESULT $result");
      // if (result == 1) setState(() => ttsState = TtsStates.playing);
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

  _playText(parsedString) async {
    print('playText');
    TextToSpeech tts = TextToSpeech();
    tts.play(parsedString);
    // onAudioSound ? tts.play(parsedString) : tts.stop();
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

    setState(() {
      _newVoiceText = parsedString;
      print(_newVoiceText);
    });
    // await _playText(parsedString);
  }

  @override
  Widget build(BuildContext context) {
    TextToSpeech ttsProviderr = Provider.of<TextToSpeech>(context);

    final actions = [
      {
        'icon': ImageConstant.imgShareGray50,
        'action': () => {print('Search...')}
      },
    ];
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Reproduciendo',
        backgroundColor: ColorConstant.gray50,
        // hideActions: _isEditing,
        actions: actions,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              SizedBox(height: 32),
              Container(
                width: double.infinity,
                height: 280,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                        image: AssetImage('assets/images/img_media.png'),
                        fit: BoxFit.cover)),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Título',
                          style: AppStyle.txtNunitoSansSemiBold26,
                        ),
                        Text(
                          'Autor',
                          style: AppStyle.txtNunitoSansRegular18Black900,
                        ),
                      ],
                    ),
                    CustomIconButton(
                      margin: getMargin(left: 8),
                      height: getSize(48),
                      width: getSize(48),
                      variant: IconButtonVariant.NoFill,
                      onTap: () {},
                      child: CustomImageView(
                        svgPath: ImageConstant.imgFavoriteGray800,
                      ),
                    ),
                  ],
                ),
              ),
              _progressBar(30),
              SizedBox(height: 63),
              _btnSection(ttsProviderr),
            ],
          ),
        ),
      ),
    );
  }

  CustomIconButton _buildButtonColumn(
      Color color,
      Color splashColor,
      String icon,
      String label,
      Function func,
      int index,
      TextToSpeech ttsProvider) {
    return CustomIconButton(
      margin: getMargin(left: 8),
      height: getSize(58),
      width: getSize(58),
      variant: IconButtonVariant.FillIndigo,
      onTap: () => func(index, ttsProvider),
      child: CustomImageView(
        svgPath: icon,
      ),
    );
  }

  Widget _btnSection(TextToSpeech ttsProviderr) {
    print('TtsState: $ttsState');
    if (isAndroid) {
      if (ttsProviderr.ttsState != TtsStates.playing) {
        print('Not playing: $ttsState');
        return _buildButtonColumn(Colors.red, Colors.redAccent,
            ImageConstant.imgArrowMedia, '', handleEventBtn, 1, ttsProviderr);
      } else {
        print('Playing: $ttsState');
        return _buildButtonColumn(Colors.red, Colors.redAccent,
            ImageConstant.imgArrowdown, '', handleEventBtn, 2, ttsProviderr);
      }
    } else {
      return Container();
    }
  }

  void handleEventBtn(int index, TextToSpeech ttsProvider) {
    if (index == 1) {
      ttsProvider.play(_newVoiceText!);
    } else {
      ttsProvider.stop();
    }
  }

  Widget _progressBar(int end) {
    // print('newVoiceText: $_newVoiceText');
    return Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 5.0, right: 10),
        child: LinearProgressIndicator(
          backgroundColor: ColorConstant.indigo90033,
          valueColor: AlwaysStoppedAnimation<Color>(ColorConstant.indigo900),
          value: end / 20,
        ));
  }
}
