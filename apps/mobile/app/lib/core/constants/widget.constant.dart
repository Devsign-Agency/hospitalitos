import 'package:mobile_app/widgets/custom_bottom_bar.dart';

class WidgetConstant {
  static final List<BottomMenuModel> defaultBottomMenuList = [
    const BottomMenuModel(
      icon: 'assets/images/img_home.svg',
      title: 'Home',
      type: BottomBarEnum.Home,
    ),
    const BottomMenuModel(
      icon: 'assets/images/img_search_gray_800.svg',
      title: 'Descubre',
      type: BottomBarEnum.Descubre,
    ),
    const BottomMenuModel(
      icon: 'assets/images/img_calendar.svg',
      title: 'Liturgia',
      type: BottomBarEnum.Liturgia,
    ),
    const BottomMenuModel(
      icon: 'assets/images/img_mobile.svg',
      title: 'Biblia',
      type: BottomBarEnum.Biblia,
    )
  ];
}
