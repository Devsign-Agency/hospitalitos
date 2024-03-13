import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _preferences;

  static bool _isDarkmode = true;
  static String _markerList = '';

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static bool get isDarkmode =>
      _preferences.getBool('isDarkmode') ?? _isDarkmode;
  static set isDarkmode(bool value) {
    _isDarkmode = value;
    _preferences.setBool('isDarkmode', value);
  }

  static String get markerList =>
      _preferences.getString('markerList') ?? _markerList;

  static set markerList(String value) {
    _markerList = value;
    _preferences.setString('markerList', value);
  }

  static removeMarkerList() {
    _preferences.remove('markerList');
  }

  static String get themPrefix => _isDarkmode ? 'dark' : 'ligth';
}
