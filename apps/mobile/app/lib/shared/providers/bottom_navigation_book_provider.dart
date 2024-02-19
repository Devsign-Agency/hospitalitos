import 'package:flutter/material.dart';

import '../../core/app_export.dart';

class BottomNavigationBookProvider extends ChangeNotifier {
  int selectedItem = 0;
  static List<BottomNavigationMenu> bottomMenuList = [
    BottomNavigationMenu(icon: ImageConstant.imgHome, title: 'Home'),
    BottomNavigationMenu(
        icon: ImageConstant.imgSearchGray800, title: 'Descubre'),
    BottomNavigationMenu(icon: ImageConstant.imgCalendar, title: 'Liturgia'),
    BottomNavigationMenu(icon: ImageConstant.imgMobile, title: 'Biblia'),
  ];

  BottomNavigationBookProvider({this.selectedItem = 0});

  int get getSelectedItem => selectedItem;

  void setSelectedItem(int index) {
    selectedItem = index;
    notifyListeners();
  }
}
