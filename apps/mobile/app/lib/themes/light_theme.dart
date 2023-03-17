import 'package:flutter/material.dart';
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
    onBackground: LightVariables.onBackground
  );
  static get theme => ThemeData.from(
    colorScheme: colors
  );

}
