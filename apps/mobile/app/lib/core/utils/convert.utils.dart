import 'package:flutter_html/style.dart';

class ConvertUtils {
  static double getDoubleFromFontSize(FontSize fontSize) {
    Map<FontSize, double> values = {
      FontSize.xSmall: 12.0,
      FontSize.xxSmall: 14.0,
      FontSize.smaller: 16.0,
      FontSize.small: 18.0,
      FontSize.medium: 24.0,
      FontSize.large: 32.0,
      FontSize.larger: 36.0,
      FontSize.xLarge: 40.0,
      FontSize.xxLarge: 48.0
    };

    return values[fontSize]!;
  }
}
