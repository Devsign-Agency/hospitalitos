import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _preferences;

  static bool _isDarkmode = true;
  static String _markerList = '';
  static String _pageList = '';
  static String _lastPage = '';

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static bool get isDarkmode =>
      _preferences.getBool('isDarkmode') ?? _isDarkmode;
  static set isDarkmode(bool value) {
    _isDarkmode = value;
    _preferences.setBool('isDarkmode', value);
  }

  static set pageList(String value) {
    _pageList = value;
    _preferences.setString('pageList', value);
  }

  static set lastPage(String value) {
    _lastPage = value;
    _preferences.setString('lastPage', value);
  }

  static String get lastPage => _preferences.getString('lastPage') ?? _lastPage;
  static String get markerList =>
      _preferences.getString('markerList') ?? _markerList;
  static String get pageList => _preferences.getString('pageList') ?? _pageList;

  static set markerList(String value) {
    _markerList = value;
    _preferences.setString('markerList', value);
  }

  static removeMarkerList() {
    _preferences.remove('markerList');
  }

  static removePageList() {
    _preferences.remove('pageList');
  }

  static String get themPrefix => _isDarkmode ? 'dark' : 'ligth';
}
