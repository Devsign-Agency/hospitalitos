import 'package:flutter/material.dart';
import 'package:mobile_app/core/app_export.dart';
import 'package:mobile_app/themes/dark_variables.dart';

class DarkTheme {
  static final colors = ColorScheme.fromSeed(
      seedColor: DarkVariables.seed,
      brightness: Brightness.dark,
      primary: DarkVariables.primary,
      surface: DarkVariables.primary,
      onPrimary: DarkVariables.onPrimary,
      secondary: DarkVariables.secondary,
      onSecondary: DarkVariables.onSecondary,
      tertiary: DarkVariables.tertiary,
      onTertiary: DarkVariables.onTertiary);

  static final dark = Color(0xff1C1B1F);
  static final dark50 = Color(0xff3C3B40);
  static get theme => ThemeData(
        colorScheme: colors,
        appBarTheme: AppBarTheme(
          color: dark,
        ),
        drawerTheme: DrawerThemeData(
          backgroundColor: dark,
        ),
        popupMenuTheme: PopupMenuThemeData(color: dark50),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: dark,
        ),
        sliderTheme: SliderThemeData(
          activeTrackColor: colors.onPrimary,
          valueIndicatorColor: colors.onPrimary,
          valueIndicatorTextStyle: AppStyle.txtNunitoSansRegular14Black900,
          thumbColor: colors.onPrimary,
          overlayShape: SliderComponentShape.noOverlay,
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: colors.onPrimary,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: dark50,
        ),
      );
}
