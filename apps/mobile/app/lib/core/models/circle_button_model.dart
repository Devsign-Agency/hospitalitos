import 'package:flutter/material.dart';

class CircleButtonModel {
  final CircleButtonType name;
  final Color color;
  CircleButtonModel(this.name, this.color);
}

enum CircleButtonType { black, yellow, red, blue, green, purple, brown }
