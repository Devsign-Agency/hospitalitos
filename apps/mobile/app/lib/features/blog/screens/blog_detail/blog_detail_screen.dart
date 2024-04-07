import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:mobile_app/core/app_export.dart';
import '../../widgets/widgets.dart';

class BlogDetail extends StatefulWidget {
  static const route = 'detail';
  const BlogDetail({super.key});

  @override
  State<BlogDetail> createState() => _BlogDetailState();
}

enum TtsStates { playing, stopped, paused, continued }

TtsState ttsState = TtsState.stopped;

get isPlaying => ttsState == TtsState.playing;
get isStopped => ttsState == TtsState.stopped;
get isPaused => ttsState == TtsState.paused;
get isContinued => ttsState == TtsState.continued;

 bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isWeb => kIsWeb;

class _BlogDetailState extends State<BlogDetail> {
  var _scrollController = ScrollController();
  bool _isExpanded = false;
  bool onAudioSound = false;
  String? _newVoiceText;
  FToast? fToast;
  late FlutterTts flutterTts;
   int end = 0;
  int positionLastWord = 0;
    double volume = 0.5;
  double pitch = 1.0;
  double rate = 0.8;
  @override
  void initState() {
    _scrollController.addListener(() {
      setState(() {
        _isExpanded = _isSliverAppBarExpanded;
      });
    });

    fToast = FToast();
    fToast?.init(context);
    this.initTts();
  }

  initTts() {
    flutterTts = FlutterTts();

    flutterTts.setStartHandler(() {
      setState(() {
        print('Playing');
        ttsState = TtsState.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        print('Complete');
        ttsState = TtsState.stopped;
        positionLastWord = 0;
      });
    });

    flutterTts.setCancelHandler(() {
      setState(() {
        print('Cancel');
        ttsState = TtsState.stopped;
      });
    });

    if (isWeb || isIOS) {
      flutterTts.setPauseHandler(() {
        setState(() {
          print('Paused');
          ttsState = TtsState.paused;
        });
      });

      flutterTts.setContinueHandler(() {
        setState(() {
          print('Continued');
          ttsState = TtsState.continued;
        });
      });
    }

    flutterTts.setErrorHandler((msg) {
      setState(() {
        print('error: $msg');
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

  Future _pause() async {
    positionLastWord = end;

    var result = await flutterTts.pause();
    if (result == 1) setState(() => ttsState = TtsState.paused);
  }
  Future _speak() async {
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);
    ttsState = TtsState.playing;
    if (_newVoiceText != null) {
      await flutterTts.awaitSpeakCompletion(true);
      var result = await flutterTts.speak(_newVoiceText!);
      print('RESULT $result');
      if (result == 1) setState(() => ttsState = TtsState.playing);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dynamic params = ModalRoute.of(context)?.settings.arguments;

    final String parsedString =
        stripHtmlIfNeeded(params['content']['rendered']);
    var selectedText = '';
    //final book = params.book;
    //final chapter = params.chapter;
    final String bookTitle =  '';
    final String bookAuthor =  '';
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          if (onAudioSound)
            PopupAudioPlayer(
                voiceText
                bookTitle: bookTitle,
                bookAuthor: bookAuthor,
                end: end,
                max: _newVoiceText!.length,
                ttsState: ttsState,
                speak: _speak,
                pause: _pause),
          CustomAppBar(
              isExpanded: _isExpanded,
              imgUrl: params['_embedded']['wp:featuredmedia'][0]['source_url'],
              linkShare: params['link'],
              title: params['title']['rendered']),
          SliverList(
              delegate: SliverChildListDelegate([
            ...List.generate(1, (int index) {
              return Padding(
                  padding: getPadding(all: 16),
                  child: SelectionArea(
                    onSelectionChanged: (value) {
                      selectedText = value?.plainText ?? "";
                    },
                    contextMenuBuilder: (context, editableTextState) {
                      final List<ContextMenuButtonItem> buttonItems =
                          editableTextState.contextMenuButtonItems;
                      buttonItems.insert(
                        2,
                        ContextMenuButtonItem(
                          label: 'Escuchar',
                          onPressed: () async {
                            debugPrint(selectedText);
                            print('playText');
                            TextToSpeech tts = TextToSpeech();
                            await tts.play(selectedText);

                            this._handleChangeStatusAudio();

                            // your "send email" code
                          },
                        ),
                      );
                      return AdaptiveTextSelectionToolbar.buttonItems(
                        anchors: editableTextState.contextMenuAnchors,
                        buttonItems: buttonItems,
                      );
                    },
                    child: Center(
                      child: Html(
                        data: parsedString,
                        style: {
                          "body": Style(
                            margin: Margins.zero,
                            padding: EdgeInsets.zero,
                            fontSize: FontSize(17.0),
                            lineHeight: LineHeight(1.4),
                            fontFamily: 'Nunito Sans',
                          ),
                          "p": Style(
                              padding: EdgeInsets.all(6),
                              fontFamily: 'Nunito Sans',
                              alignment: Alignment.centerRight // for text right
                              ),
                          'strong': Style(
                            fontSize: FontSize(20.0),
                          ),
                          'img': Style(
                            height: Height(0),
                            width: Width(0),
                          )
                        },
                      ),
                    ),
                  ));
            }),
          ]))
        ],
      ),
    ));
  }

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients && _scrollController.offset > (50);
  }

  void _handleChangeStatusAudio() async {
    ClipboardData? data;
    onAudioSound = !onAudioSound;

    if (onAudioSound) {
      data = await Clipboard.getData(Clipboard.kTextPlain);
    } else {
      Clipboard.setData(ClipboardData(text: ''));
    }

    data != null ? _onChange(data.text!) : _onChange('');
  }

  void _onChange(String text) {
    setState(() {
      _newVoiceText = text;
    });
  }
}

String removeAllHtmlTags(String htmlText) {
  print(htmlText);
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
  var separator = '\n';
  final result = RegExp(r"<[^>]*>")
      .allMatches(htmlText)
      .map((e) => e.group(0))
      .join(separator);

  return result;
}

String stripHtmlIfNeeded(String text) {
  // The regular expression is simplified for an HTML tag (opening or
  // closing) or an HTML escape. We might want to skip over such expressions
  // when estimating the text directionality.
  return text.replaceAll('<img .*?>/g', "");
}
