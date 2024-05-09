import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ClipboardService extends ChangeNotifier {
  static Future<String> getCopyText() async {
    ClipboardData? kTextPlain;
    kTextPlain = await Clipboard.getData(Clipboard.kTextPlain);

    return kTextPlain?.text ?? '';
  }

  static void setCopyText(String text) {
    ClipboardData data = ClipboardData(text: text);
    Clipboard.setData(data);
  }

  static void clearCopyText() {
    Clipboard.setData(ClipboardData(text: ''));
  }
}
