import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/app_export.dart';
import '../../../shared/shared.dart';
import '../../../themes/themes.dart';
import '../../../widgets/widgets.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final Function onChangeIndex;

  const CustomBottomNavigationBar({
    super.key,
    required this.onChangeIndex,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);

    bool isDarkMode = themeProvider.currentTheme == DarkTheme.theme;

    final List<Map<dynamic, dynamic>> bottomMenuList = [
      {'id': 0, 'name': '', 'icon': ImageConstant.imgEditGray800},
      {'id': 1, 'name': '', 'icon': ImageConstant.imgBookmarkGray800},
      {'id': 2, 'name': '', 'icon': ImageConstant.imgBookmark},
      {'id': 3, 'name': '', 'icon': ImageConstant.imgShareGray50},
    ];
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (int index) {
        _currentIndex = index;
        widget.onChangeIndex(index);
        setState(() {});
      },
      type: BottomNavigationBarType.fixed,
      items: List.generate(
        bottomMenuList.length,
        (index) {
          return BottomNavigationBarItem(
              label: '',
              icon: Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: CustomImageView(
                  svgPath: bottomMenuList[index]['icon'],
                  height: getSize(24),
                  width: getSize(24),
                  color: isDarkMode
                      ? ColorConstant.whiteA700
                      : ColorConstant.gray800,
                ),
              ),
              activeIcon: Padding(
                padding: EdgeInsets.only(top: 10, bottom: 18),
                child: CustomImageView(
                    svgPath: bottomMenuList[index]['icon'],
                    height: getSize(24),
                    width: getSize(24),
                    color: ColorConstant.yellow100),
              ));
        },
      ),
    );
  }
}
