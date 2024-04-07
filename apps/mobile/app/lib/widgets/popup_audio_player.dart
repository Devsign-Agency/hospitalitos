import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';

import '../../../core/app_export.dart';
import '../../../shared/shared.dart';
import '../../../themes/themes.dart';
import '../../../widgets/widgets.dart';

enum TtsState { playing, stopped, paused, continued }

typedef MyBuilder = void Function(
    BuildContext context, void Function() methodFromChild);

class PopupAudioPlayer extends StatefulWidget {
  final MyBuilder builder;
  final String bookTitle;
  final String bookAuthor;
  final String voiceText;
  final bool onAudioSound;
  final Function onCompletion;

  const PopupAudioPlayer(
      {super.key,
      required this.bookTitle,
      required this.bookAuthor,
      required this.voiceText,
      required this.onAudioSound,
      required this.onCompletion,
      required this.builder});

  @override
  State<PopupAudioPlayer> createState() => PopupAudioPlayerState();
}

class PopupAudioPlayerState extends State<PopupAudioPlayer> {
  late FlutterTts flutterTts;
  dynamic languages;
  String? language;
  double volume = 0.5;
  double pitch = 1;
  double rate = 0.5;
  int end = 0;
  int positionLastWord = 0;
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
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }

  @override
  didChangeDependencies() {
    print('DID change dependencies');
    super.didChangeDependencies();
    sspeak();
  }

  @override
  didUpdateWidget(covariant oldWidget) {
    print('did update widget ');
    super.didUpdateWidget(oldWidget);
    print(oldWidget.voiceText);

    if (widget.voiceText != oldWidget.voiceText) {
      sspeak();
    }
  }

  void initTts() {
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
        // positionLastWord = 0;
        // end = 0;
        widget.onCompletion();
        // if (playingVerses) {
        //   playVerses();
        // } else {
        //   closePlayText();
        // }
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
      print('positionLastWord');

      setState(() {
        // int index = widget.voiceText!.indexOf(word);
        // end = index + word.length;
        end = endOffset + positionLastWord;
      });
    });
  }

  Future sspeak() async {
    print('voice text: ${widget.voiceText}');
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);
    ttsState = TtsState.playing;
    if (widget.voiceText != null) {
      await flutterTts.awaitSpeakCompletion(true);
      var result = await flutterTts.speak(widget.voiceText);
      if (result == 1) setState(() => ttsState = TtsState.playing);
    }
  }

  Future _pause() async {
    positionLastWord = end;

    var result = await flutterTts.pause();
    if (result == 1) setState(() => ttsState = TtsState.paused);
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkMode = themeProvider.currentTheme == DarkTheme.theme;
    widget.builder.call(context, sspeak);
    return DraggableScrollableSheet(
      initialChildSize: .16,
      minChildSize: .16,
      maxChildSize: .16,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          padding: getPadding(left: 16, right: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isDarkMode ? ColorConstant.gray80040 : ColorConstant.neutral,
          ),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              controller: scrollController,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _AudioPlayerTitleAndAuthor(
                        bookTitle: widget.bookTitle,
                        bookAuthor: widget.bookAuthor,
                        end: end,
                        max: widget.voiceText.length),
                    _AudioPlayerButton(
                      ttsState: ttsState,
                      speak: sspeak,
                      pause: _pause,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class _AudioPlayerTitleAndAuthor extends StatelessWidget {
  final String bookTitle;
  final String bookAuthor;
  final int end;
  final int max;

  const _AudioPlayerTitleAndAuthor(
      {super.key,
      required this.bookTitle,
      required this.bookAuthor,
      required this.end,
      required this.max});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkMode = themeProvider.currentTheme == DarkTheme.theme;
    Color colorBar =
        isDarkMode ? ColorConstant.purple50 : ColorConstant.indigo900;
    Color backgroundColorBar =
        isDarkMode ? ColorConstant.gray100 : ColorConstant.indigo90033;
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            bookTitle,
            style: isDarkMode
                ? AppStyle.txtNunitoSansSemiBold20WhiteA700
                : AppStyle.txtNunitoSansSemiBold20Black900,
          ),
          Text(
            bookAuthor,
            style: isDarkMode
                ? AppStyle.txtNunitoSansSemiBold13WhiteA700
                : AppStyle.txtNunitoSansSemiBold13Indigo900,
          ),
          _progressBar(end, colorBar, backgroundColorBar),
        ],
      ),
    );
  }

  Widget _progressBar(int end, Color valueColor, Color backgroundColor) {
    var a = end / max;
    // print(a);
    // print('end: $end/ $max');
    // print('max: $max');
    return Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 5.0, right: 10),
        child: LinearProgressIndicator(
          backgroundColor: backgroundColor,
          color: ColorConstant.indigo900,
          valueColor: AlwaysStoppedAnimation<Color>(valueColor),
          value: a.isNaN || a.isInfinite ? 0.0 : end / max,
        ));
  }
}

class _AudioPlayerButton extends StatelessWidget {
  final TtsState ttsState;
  final Function speak;
  final Function pause;

  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isWeb => kIsWeb;

  const _AudioPlayerButton(
      {super.key,
      required this.ttsState,
      required this.speak,
      required this.pause});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkMode = themeProvider.currentTheme == DarkTheme.theme;

    return _btnSection(isDarkMode);
  }

  Widget _btnSection(bool isDarkMode) {
    IconButtonVariant variant = isDarkMode
        ? IconButtonVariant.OutlinePurple50
        : IconButtonVariant.FillIndigo;
    Color colorIcon =
        isDarkMode ? ColorConstant.indigo900 : ColorConstant.whiteA700;

    if (isAndroid) {
      if (ttsState != TtsState.playing) {
        return _buildButtonColumn(
            colorIcon, ImageConstant.imgArrowMedia, '', speak, variant);
      } else {
        return _buildButtonColumn(
            colorIcon, ImageConstant.imgArrowdown, '', pause, variant);
      }
    } else {
      return Container();
    }
  }

  CustomIconButton _buildButtonColumn(Color colorIcon, String icon,
      String label, Function func, IconButtonVariant variant) {
    return CustomIconButton(
      margin: getMargin(left: 8),
      height: getSize(58),
      width: getSize(58),
      variant: variant,
      onTap: () => func(),
      child: CustomImageView(svgPath: icon, color: colorIcon),
    );
  }
}
