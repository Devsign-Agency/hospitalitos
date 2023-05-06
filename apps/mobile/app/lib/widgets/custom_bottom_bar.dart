// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mobile_app/core/app_export.dart';
import 'package:mobile_app/widgets/custom_image_view.dart';

class CustomBottomBar extends StatelessWidget {
  CustomBottomBar(
      {required this.onChanged,
      this.bottomMenuList = const [
        BottomMenuModel(
          icon: 'assets/images/img_home.svg',
          title: 'Home',
          type: BottomBarEnum.Home,
        ),
        BottomMenuModel(
          icon: 'assets/images/img_search_gray_800.svg',
          title: 'Descubre',
          type: BottomBarEnum.Descubre,
        ),
        BottomMenuModel(
          icon: 'assets/images/img_calendar.svg',
          title: 'Liturgia',
          type: BottomBarEnum.Liturgia,
        ),
        BottomMenuModel(
          icon: 'assets/images/img_mobile.svg',
          title: 'Biblia',
          type: BottomBarEnum.Biblia,
        )
      ]});
  final List<BottomMenuModel> bottomMenuList;

  final Function(int)? onChanged;

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;

    return BottomNavigationBar(
      backgroundColor: ColorConstant.whiteA700,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0,
      currentIndex: selectedIndex,
      type: BottomNavigationBarType.fixed,
      items: List.generate(bottomMenuList.length, (index) {
        return BottomNavigationBarItem(
          icon: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomImageView(
                svgPath: bottomMenuList[index].icon,
                height: getSize(24),
                width: getSize(24),
                color: ColorConstant.gray800,
              ),
              Padding(
                padding: getPadding(
                  top: 6,
                ),
                child: Text(
                  bottomMenuList[index].title ?? '',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtNunitoSansSemiBold13Gray800.copyWith(
                    color: ColorConstant.gray800,
                  ),
                ),
              ),
            ],
          ),
          activeIcon: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomImageView(
                svgPath: bottomMenuList[index].icon,
                height: getSize(24),
                width: getSize(24),
                color: ColorConstant.indigo900,
              ),
              Padding(
                padding: getPadding(
                  top: 6,
                ),
                child: Text(
                  bottomMenuList[index].title ?? '',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtNunitoSansSemiBold13Indigo900.copyWith(
                    color: ColorConstant.indigo900,
                  ),
                ),
              ),
            ],
          ),
          label: '',
        );
      }),
      onTap: (index) {
        selectedIndex = index;
        onChanged!(bottomMenuList[index].type.index);
      },
    );
  }
}

enum BottomBarEnum {
  Home,
  Descubre,
  Liturgia,
  Biblia,
}

class BottomMenuModel {
  const BottomMenuModel({required this.icon, this.title, required this.type});
  final String icon;
  final String? title;
  final BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}