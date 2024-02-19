import 'package:flutter/material.dart';
import 'package:mobile_app/core/constants/color.constant.dart';
import 'package:mobile_app/core/theme/app.style.dart';
import 'package:mobile_app/themes/light_variables.dart';

class LightTheme {
  static final colors = ColorScheme.fromSeed(
    seedColor: LightVariables.seed,
    brightness: LightVariables.brightness,
    primary: LightVariables.primary,
    onPrimary: LightVariables.onPrimary,
    // secondary: LightVariables.secondary,
    // onSecondary: LightVariables.onSecondary,
    tertiary: LightVariables.tertiary,
    onTertiary: LightVariables.onTertiary,
    background: LightVariables.background,
    onBackground: LightVariables.onBackground,
  );
  static get theme => ThemeData(
        colorScheme: colors,
        appBarTheme: AppBarTheme(
          color: ColorConstant.gray100,
        ),
        popupMenuTheme: PopupMenuThemeData(color: ColorConstant.whiteA700),
        sliderTheme: SliderThemeData(
            activeTrackColor: colors.primary,
            inactiveTrackColor: ColorConstant.indigo90033,
            valueIndicatorColor: ColorConstant.deepPurple5002,
            valueIndicatorTextStyle: AppStyle.txtNunitoSansRegular14,
            thumbColor: ColorConstant.whiteA700,
            activeTickMarkColor: colors.primary,
            overlayShape: SliderComponentShape.noOverlay,
            inactiveTickMarkColor: ColorConstant.indigo90033),
      );
}
