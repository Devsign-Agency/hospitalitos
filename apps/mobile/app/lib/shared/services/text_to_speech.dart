import 'package:flutter_tts/flutter_tts.dart';
import 'package:html/parser.dart';

class TextToSpeech {
  static FlutterTts? ftts;
  List<String> textToPlay = [];
  int index = 0;
  bool active = false;

  TextToSpeech() {
    ftts ??= FlutterTts();
  }

  init() async {
    await ftts!.setLanguage('es-VE');
    await ftts!.setSpeechRate(0.5); //speed of speech
    await ftts!.setVolume(1.0); //volume of speech
    await ftts!.setPitch(1); //pitc of sound
  }

  pause() async {
    await ftts!.stop();
  }

  stop() async {
    active = false;
    textToPlay = [];
    await ftts!.pause();
  }

  play(String text) async {
    active = true;
    textToPlay = _parseHtmlString(text);

    ftts!.setCompletionHandler(() async {
      if (index < textToPlay.length - 1) {
        index++;
        if (active) {
          await _speak(textToPlay[index]);
        }
      } else {
        active = false;
      }
    });

    await _speak(textToPlay[index]);
  }

  resume() async {
    await ftts!.pause();
  }

  _speak(String text) async {
    await ftts!.speak(text);
  }

  List<String> _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;

    List<String> parsed = [];

    final count = parsedString.length;
    const max = 2000;
    final loopCount = count ~/ max;

    for (var i = 0; i <= loopCount; i++) {
      if (i != loopCount) {
        parsed.add(parsedString.substring(i * max, (i + 1) * max));
      } else {
        var end = (count - ((i * max)) + (i * max));
        parsed.add(parsedString.substring(i * max, end));
      }
    }
    return parsed;
  }
}
