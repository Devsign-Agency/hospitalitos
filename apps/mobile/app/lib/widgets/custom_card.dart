import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/app_export.dart';
import '../shared/shared.dart';
import '../themes/themes.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final Function? onTapped;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  const CustomCard(
      {super.key, required this.child, this.onTapped, this.margin, this.color});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);

    bool isDarkTheme = themeProvider.currentTheme == DarkTheme.theme;
    return GestureDetector(
      onTap: onTapped != null
          ? () {
              onTapped!();
            }
          : null,
      child: Container(
          width: double.infinity ,
          height: double.infinity * 2,
          padding: getPadding(all: 16),
          margin: margin ?? getMargin(top: 8, left: 16, right: 16),
          decoration: AppDecoration.fillWhiteA700BoxShadow.copyWith(
              color: isDarkTheme
                  ? ColorConstant.gray80040
                  : color ?? ColorConstant.whiteA700),
          child: child),
    );
  }
}
