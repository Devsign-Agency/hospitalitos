import 'package:flutter/material.dart';

class DrawerService extends ChangeNotifier {
  bool _isFirstOpen = false;
  double _offset = 0.0;

  bool get isFirstOpen => _isFirstOpen;

  double get offset => _offset;

  set isFirstOpen(bool value) {
    _isFirstOpen = value;
    notifyListeners();
  }

  set offset(double value) {
    _offset = value;
    notifyListeners();
  }
}
