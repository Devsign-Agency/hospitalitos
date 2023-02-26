import 'package:flutter/material.dart';
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
    onTertiary: DarkVariables.onTertiary
  );

  static get theme => ThemeData.from(colorScheme: colors);
}
