import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _preferences;

  static bool _isDarkmode = true;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static bool get isDarkmode => _preferences.getBool('isDarkmode') ?? _isDarkmode;
  static set isDarkmode(bool value) {
    _isDarkmode = value;
    _preferences.setBool('isDarkmode', value);
  }

  static String get themPrefix => _isDarkmode ? 'dark' : 'ligth';
}