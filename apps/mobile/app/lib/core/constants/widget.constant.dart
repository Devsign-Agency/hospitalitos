import 'package:mobile_app/core/app_export.dart';
// import 'package:mobile_app/widgets/custom_bottom_bar.dart';

class WidgetConstant {
  static List<BottomNavigationMenu> defaultBottomMenuList = [
    BottomNavigationMenu(icon: ImageConstant.imgHome, title: 'Home'),
    BottomNavigationMenu(
        icon: ImageConstant.imgSearchGray800, title: 'Descubre'),
    BottomNavigationMenu(icon: ImageConstant.imgCalendar, title: 'Liturgia'),
    BottomNavigationMenu(icon: ImageConstant.imgMobile, title: 'Biblia'),
  ];

  static List<BottomNavigationMenu> bibleBottomMenuList = [
    BottomNavigationMenu(
        icon: ImageConstant.imgBookmark, title: 'Antiguo Testamento'),
    BottomNavigationMenu(
        icon: ImageConstant.imgBookmark, title: 'Nuevo Testamento'),
  ];

  static final List<PopupMenuItemModel> menuOptions = [
    PopupMenuItemModel(id: 1, title: 'Ajustar texto', onTappedItem: () {}),
    PopupMenuItemModel(id: 2, title: 'Compartir', onTappedItem: () {}),
    PopupMenuItemModel(id: 3, title: 'Marcadores', onTappedItem: () {}),
  ];

  static List<String> tabBarItems = [
    'Libros',
    'Capítulos',
    'Versículos',
  ];
}
