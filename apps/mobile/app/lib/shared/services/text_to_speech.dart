import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

enum TtsStates { playing, stopped, paused, continued }

class TextToSpeech with ChangeNotifier {
  static FlutterTts? ftts;
  List<String> textToPlay = [];
  TtsStates ttsState = TtsStates.stopped;
  int positionLastWord = 0;
  int end = 0;
  VoidCallback? completion;
  int loopCount = 0;
  int loopIndex = 0;
  TextToSpeech() {
    ftts ??= FlutterTts();
  }

  String text = '';

  init() async {
    await ftts!.setLanguage('es-VE');
    await ftts!.setSpeechRate(0.5); //speed of speech
    await ftts!.setVolume(1.0); //volume of speech
    await ftts!.setPitch(1); //pitc of sound

    end = positionLastWord = 0;

    ftts!.setStartHandler(() {
      print('Start playing');
      ttsState = TtsStates.playing;
      notifyListeners();
    });

    ftts?.setProgressHandler(
        (String text, int startOffset, int endOffsett, String word) {
      end = positionLastWord + endOffsett;

      // streamController.sink.add(end);
      notifyListeners();
    });

    ftts!.setCompletionHandler(() {
      print('COMPLETION');

      loopIndex++;
      if (loopIndex < loopCount) {
        positionLastWord = end;
        play();
      } else {
        loopIndex = end = positionLastWord = 0;
        ttsState = TtsStates.stopped;
        if (completion != null) {
          completion!();
        }
      }
      notifyListeners();
    });
  }

  pause() async {
    var result = await ftts!.pause();
    print('pause result: $result');
    if (result == 1) {
      positionLastWord = end;
      ttsState = TtsStates.paused;
      notifyListeners();
    }
  }

  cancel() async {
    end = positionLastWord = loopCount = loopIndex = 0;
    textToPlay = [];
    loopCount = 0;
    stop();
  }

  stop() async {
    var result = await ftts!.stop();
    print('STOP');
    ttsState = TtsStates.paused;
  }

  play() async {
    textToPlay = _splitText(text);

    loopCount = textToPlay.length;
    ttsState = TtsStates.playing;
    await ftts!.awaitSpeakCompletion(true);

    var result = await ftts!.speak(textToPlay[loopIndex]);

    if (result == 1) ttsState = TtsStates.playing;

    notifyListeners();
  }

  resume() async {
    await ftts!.pause();
  }

  List<String> _splitText(String text) {
    var count = text.length;
    var max = 2000;
    var loopCount = count ~/ max;
    List<String> sentences = [];

    sentences = [];

    if (count >= max) {
      for (var i = 0; i < loopCount; i++) {
        if (i != loopCount) {
          sentences.add(text.substring(i * max, (i + 1) * max));
        } else {
          var end = (count - ((i * max)) * (i * max));
          sentences.add(text.substring(i * max, end));
        }
      }
      var total = 0;

      for (var text in sentences) {
        total = total + text.length;
      }

      if (total < text.length) {
        sentences.add(text.substring(total - 1, text.length - 1));
        loopCount++;
      }
    } else {
      loopCount++;
      sentences.add(text.substring(0, text.length - 1));
    }

    return sentences;
  }
}
