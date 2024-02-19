import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/app_export.dart';
import '../../../shared/shared.dart';
import '../../../themes/themes.dart';
import '../../../widgets/widgets.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final Function onChangeIndex;
  final List<BottomNavigationMenu> bottomMenuList;
  final int? currentIndex;

  const CustomBottomNavigationBar({
    super.key,
    required this.onChangeIndex,
    required this.bottomMenuList,
    this.currentIndex = 0,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  initState() {
    super.initState();
    _currentIndex = widget.currentIndex!;
  }

  void _onTappedItem(int index) {
    _currentIndex = index;
    widget.onChangeIndex(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);

    bool isDarkMode = themeProvider.currentTheme == DarkTheme.theme;

    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      items: List.generate(
        widget.bottomMenuList.length,
        (index) {
          return BottomNavigationBarItem(
              label: '',
              icon: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: CustomImageView(
                      svgPath: widget.bottomMenuList[index].icon,
                      height: getSize(24),
                      width: getSize(24),
                      color: isDarkMode
                          ? ColorConstant.whiteA700
                          : ColorConstant.gray800,
                    ),
                  ),
                  if (widget.bottomMenuList[index].title != null)
                    Text(
                      widget.bottomMenuList[index].title ?? '',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtNunitoSansSemiBold13Gray800.copyWith(
                        color: ColorConstant.gray800,
                      ),
                    ),
                ],
              ),
              activeIcon: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: CustomImageView(
                        svgPath: widget.bottomMenuList[index].icon,
                        height: getSize(24),
                        width: getSize(24),
                        color: ColorConstant.yellow100),
                  ),
                  if (widget.bottomMenuList[index].title != null)
                    Text(
                      widget.bottomMenuList[index].title ?? '',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtNunitoSansSemiBold13Gray800.copyWith(
                        color: ColorConstant.yellow100,
                      ),
                    ),
                ],
              ));
        },
      ),
      onTap: _onTappedItem,
    );
  }
}
