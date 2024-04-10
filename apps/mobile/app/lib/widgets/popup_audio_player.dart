import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';

import '../../../core/app_export.dart';
import '../../../shared/shared.dart';
import '../../../themes/themes.dart';
import '../../../widgets/widgets.dart';

// enum TtsState { playing, stopped, paused, continued }

// typedef MyBuilder = void Function(
//     BuildContext context, void Function() methodFromChild);

class PopupAudioPlayer extends StatelessWidget {
  final String bookTitle;
  final String bookAuthor;
  final String voiceText;
  final Function onCompletion;

  const PopupAudioPlayer({
    super.key,
    required this.bookTitle,
    required this.bookAuthor,
    required this.voiceText,
    required this.onCompletion,
  });

  @override
  Widget build(BuildContext context) {
    TextToSpeech ttsProvider =
        Provider.of<TextToSpeech>(context, listen: false);

    ttsProvider.init();
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkMode = themeProvider.currentTheme == DarkTheme.theme;
    // widget.builder.call(context, sspeak);
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
                        bookTitle: bookTitle,
                        bookAuthor: bookAuthor,
                        max: ttsProvider.text.length),
                    _AudioPlayerButton(),
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
  final int max;

  const _AudioPlayerTitleAndAuthor(
      {super.key,
      required this.bookTitle,
      required this.bookAuthor,
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
          _AudioPlayerProgressBar(
              valueColor: colorBar,
              backgroundColor: backgroundColorBar,
              max: max)
        ],
      ),
    );
  }
}

class _AudioPlayerProgressBar extends StatefulWidget {
  final Color valueColor;
  final Color backgroundColor;
  final int max;

  const _AudioPlayerProgressBar(
      {super.key,
      required this.valueColor,
      required this.backgroundColor,
      required this.max});

  @override
  State<_AudioPlayerProgressBar> createState() =>
      _AudioPlayerProgressBarState();
}

class _AudioPlayerProgressBarState extends State<_AudioPlayerProgressBar> {
  StreamController<int> streamController = StreamController<int>();
  late TextToSpeech ttsProvider;

  FlutterTts? ftts;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // ttsProvider = Provider.of<TextToSpeech>(context, listen: true);
      print('Hola');

      await ttsProvider.streamController.close();
      streamController = ttsProvider.streamController;

      ttsProvider.ftts!.setCompletionHandler(() {
        print('COMPLETIOOOOOOOOOOOON');
      });
    });
  }

  @override
  dispose() {
    print('DISPOSE');
    // ttsProvider.unsubscription();
    ttsProvider.cancel();
    streamController.close();
    ttsProvider.closeStream();
    super.dispose();
    // streamController.done;
    // ttsProvider.streamController.done;
    // ttsProvider.streamController.close();
  }

  @override
  Widget build(BuildContext context) {
    ttsProvider = Provider.of<TextToSpeech>(context, listen: true);
    int end = ttsProvider.end;
    var value = end / widget.max;

    return Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 5.0, right: 10),
        child: LinearProgressIndicator(
          backgroundColor: widget.backgroundColor,
          color: ColorConstant.indigo900,
          valueColor: AlwaysStoppedAnimation<Color>(widget.valueColor),
          value: value.isNaN || value.isInfinite
              ? 0.0
              : ttsProvider.end / widget.max,
        ));
  }
}

class _AudioPlayerButton extends StatelessWidget {
  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isWeb => kIsWeb;

  const _AudioPlayerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkMode = themeProvider.currentTheme == DarkTheme.theme;
    TextToSpeech ttsProvider = Provider.of<TextToSpeech>(context, listen: true);

    return _btnSection(isDarkMode, ttsProvider);
  }

  Widget _btnSection(bool isDarkMode, TextToSpeech ttsProvider) {
    IconButtonVariant variant = isDarkMode
        ? IconButtonVariant.OutlinePurple50
        : IconButtonVariant.FillIndigo;
    Color colorIcon =
        isDarkMode ? ColorConstant.indigo900 : ColorConstant.whiteA700;

    if (isAndroid) {
      if (ttsProvider.ttsState != TtsStates.playing) {
        return _buildButtonColumn(colorIcon, ImageConstant.imgArrowMedia, '',
            ttsProvider.play, variant);
      } else {
        // ttsProvider.positionLastWord = end;
        return _buildButtonColumn(colorIcon, ImageConstant.imgArrowdown, '',
            ttsProvider.pause, variant);
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
