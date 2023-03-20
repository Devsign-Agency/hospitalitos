import 'package:flutter/material.dart';

class ColorConstant {
  static Color whiteA7007f = fromHex('#7fffffff');

  static Color whiteA7007e = fromHex('#7effffff');

  static Color blueGray10001 = fromHex('#d3d2de');

  static Color blueGray90014 = fromHex('#1418274b');

  static Color blueGray10002 = fromHex('#d9d9d9');

  static Color blueGray9000a = fromHex('#0a18274b');

  static Color red500 = fromHex('#f74545');

  static Color whiteA70099 = fromHex('#99ffffff');

  static Color indigo90033 = fromHex('#33211c59');

  static Color black90000 = fromHex('#00000000');

  static Color indigo90075 = fromHex('#75211c59');

  static Color black900 = fromHex('#000000');

  static Color gray10075 = fromHex('#75f6f6f6');

  static Color blueGray90002 = fromHex('#282530');

  static Color gray8003f = fromHex('#3f49454f');

  static Color whiteA70019 = fromHex('#19ffffff');

  static Color blueGray90001 = fromHex('#2a2831');

  static Color blueGray900 = fromHex('#313033');

  static Color gray8007f = fromHex('#7f49454f');

  static Color red50033 = fromHex('#33f84545');

  static Color gray400 = fromHex('#dbd9df');

  static Color gray600 = fromHex('#79747e');

  static Color black9004c = fromHex('#4c000000');

  static Color deepPurple5001 = fromHex('#ede9f1');

  static Color whiteA7004c = fromHex('#4cffffff');

  static Color indigo9004c = fromHex('#4c211c59');

  static Color blueGray100 = fromHex('#cac4d0');

  static Color deepPurple5002 = fromHex('#e7e2ec');

  static Color gray800 = fromHex('#49454f');

  static Color gray900 = fromHex('#1c1b1f');

  static Color lime900 = fromHex('#906b46');

  static Color blueGray90003 = fromHex('#343239');

  static Color amber300 = fromHex('#fed564');

  static Color gray80099 = fromHex('#9949454f');

  static Color gray80077 = fromHex('#77484649');

  static Color gray300 = fromHex('#e1e0e6');

  static Color gray30001 = fromHex('#e6e1e5');

  static Color gray100 = fromHex('#f4f4f7');

  static Color whiteA70066 = fromHex('#66ffffff');

  static Color gray10002 = fromHex('#f4eff4');

  static Color deepPurple50 = fromHex('#e8def8');

  static Color whiteA70048 = fromHex('#48ffffff');

  static Color bluegray400 = fromHex('#888888');

  static Color gray10001 = fromHex('#f6f6f6');

  static Color whiteA70001 = fromHex('#fffbfe');

  static Color gray6007e = fromHex('#7e79747e');

  static Color indigo900 = fromHex('#211c59');

  static Color whiteA700 = fromHex('#ffffff');

  static Color transparent = Colors.transparent;

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
