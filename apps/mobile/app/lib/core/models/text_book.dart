import 'dart:ui';

import 'package:flutter_html/style.dart';
import 'package:mobile_app/core/models/circle_button_model.dart';

class TextBook {
  String fontFamily;
  FontSize fontSize;
  Color color;
  double size;
  double? margin;
  double? lineHeight;

  TextBook(
      {required this.fontFamily,
      required this.color,
      required this.fontSize,
      this.margin,
      required this.lineHeight,
      required this.size});
}
