import 'package:flutter/material.dart';
import 'package:mobile_app/themes/themes.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme;
  final ThemeData light = LightTheme.theme;
  final ThemeData dark = DarkTheme.theme;

  ThemeProvider({required bool isDarkmode})
      : currentTheme = !isDarkmode ? DarkTheme.theme : LightTheme.theme;

  setLightMode() {
    currentTheme = LightTheme.theme;
    notifyListeners();
  }

  setDarkMode() {
    currentTheme = DarkTheme.theme;
    notifyListeners();
  }
}
