import 'package:flutter/material.dart';

class ColorConstant {
  static Color whiteA700 = fromHex('#ffffff');

  static Color whiteA70001 = fromHex('#fffbfe');

  static Color whiteA70019 = fromHex('#19ffffff');

  static Color whiteA70048 = fromHex('#48ffffff');

  static Color whiteA7004c = fromHex('#4cffffff');

  static Color whiteA70066 = fromHex('#66ffffff');

  static Color whiteA7007f = fromHex('#7fffffff');

  static Color whiteA7007e = fromHex('#7effffff');

  static Color whiteA70099 = fromHex('#99ffffff');

  static Color blueGray100 = fromHex('#cac4d0');

  static Color blueGray10001 = fromHex('#d3d2de');

  static Color blueGray10002 = fromHex('#d9d9d9');

  static Color bluegray400 = fromHex('#888888');

  static Color blueGray900 = fromHex('#313033');

  static Color blueGray90001 = fromHex('#2a2831');

  static Color blueGray90014 = fromHex('#1418274b');

  static Color blueGray90002 = fromHex('#282530');

  static Color blueGray90003 = fromHex('#343239');

  static Color blueGray9000a = fromHex('#0a18274b');

  static Color red200 = fromHex('#f84545');

  static Color red500 = fromHex('#f74545');

  static Color red50033 = fromHex('#33f84545');

  static Color indigo900 = fromHex('#211c59');

  static Color indigo90033 = fromHex('#33211c59');

  static Color indigo9004c = fromHex('#4c211c59');

  static Color indigo90075 = fromHex('#75211c59');

  static Color black90000 = fromHex('#00000000');

  static Color black900 = fromHex('#000000');

  static Color black9004c = fromHex('#4c000000');

  static Color neutral = fromHex('#dBd9df');

  static Color gray50 = fromHex('#f3f2f7');

  static Color gray100 = fromHex('#f4f4f7');

  static Color gray10001 = fromHex('#f6f6f6');

  static Color gray10002 = fromHex('#f4eff4');

  static Color gray10003T05 = fromHex('#05f3f2f7');

  static Color gray10003T45 = fromHex('#2df3f2f7');

  static Color gray10075 = fromHex('#75f6f6f6');

  static Color gray200 = fromHex('#97969B');

  static Color gray300 = fromHex('#e1e0e6');

  static Color gray30002 = fromHex('#5b5a5f');

  static Color gray30001 = fromHex('#e6e1e5');

  static Color gray400 = fromHex('#dbd9df');

  static Color gray600 = fromHex('#79747e');

  static Color gray6007e = fromHex('#7e79747e');

  static Color gray800 = fromHex('#49454f');

  static Color gray8003f = fromHex('#3f49454f');

  static Color gray80077 = fromHex('#77484649');

  static Color gray8007f = fromHex('#7f49454f');

  static Color gray80099 = fromHex('#9949454f');

  static Color gray80040 = fromHex('#3c3b40');

  static Color gray900 = fromHex('#1c1b1f');

  static Color purple50 = fromHex('#c3c5dd');

  static Color purple200 = fromHex('#777caf');

  static Color deepPurple50 = fromHex('#e8def8');

  static Color deepPurple5001 = fromHex('#ede9f1');

  static Color deepPurple5002 = fromHex('#e7e2ec');

  static Color lime900 = fromHex('#906b46');

  static Color amber300 = fromHex('#fed564');

  static Color amber30050 = fromHex('#ffebb3');

  static Color yellow100 = fromHex('#ffd350');

  static Color transparent = Colors.transparent;

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
