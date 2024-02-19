import 'package:flutter/material.dart';

import '../../core/app_export.dart';

class BottomNavigationMainProvider extends ChangeNotifier {
  int selectedItem = 0;
  static final List<BottomNavigationMenu> bottomMenuList = [
    BottomNavigationMenu(icon: ImageConstant.imgEditGray800),
    BottomNavigationMenu(icon: ImageConstant.imgBookmarkGray800),
    BottomNavigationMenu(icon: ImageConstant.imgBookmark),
    BottomNavigationMenu(icon: ImageConstant.imgShareGray50),
  ];

  BottomNavigationMainProvider({this.selectedItem = 0});

  int get getSelectedItem => selectedItem;

  void setSelectedItem(int index) {
    selectedItem = index;
    notifyListeners();
  }
}
