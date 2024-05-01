import 'package:flutter/material.dart';
import 'package:mobile_app/shared/providers/providers.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../../../../core/app_export.dart';
import '../../../../../themes/themes.dart';

class ExpandedButton extends StatelessWidget {
  final String icon;
  final String label;
  final String? route;
  final String message;

  const ExpandedButton(
      {super.key,
      required this.icon,
      required this.label,
      this.route,
      this.message = ''});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: true);
    bool isDarkMode = themeProvider.currentTheme == DarkTheme.theme;

    return Expanded(
      child: Column(
        children: [
          GestureDetector(
            onTap: route != null
                ? () => Navigator.pushNamed(context, route ?? '')
                : null,
            child: Container(
                margin: const EdgeInsets.only(bottom: 10.0),
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 12.0),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: isDarkMode
                        ? ColorConstant.gray80040
                        : ColorConstant.whiteA700,
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(24, 39, 75, 0.08),
                        offset: const Offset(0.0, 8.0),
                        blurRadius: 18.0,
                        spreadRadius: -6.0,
                      ), //BoxSha
                      BoxShadow(
                        color: Color.fromRGBO(24, 39, 75, 0.08),
                        offset: const Offset(0.0, 12.0),
                        blurRadius: 42.0,
                        spreadRadius: -4.0,
                      ), //BoxShadow
                    ]),
                child: CustomIconButton(
                    height: 60,
                    width: 60,
                    variant: IconButtonVariant.NoFill,
                    shape: IconButtonShape.CircleBorder24,
                    alignment: Alignment.center,
                    child: CustomImageView(
                      color: isDarkMode
                          ? ColorConstant.whiteA700
                          : ColorConstant.indigo900,
                      svgPath: icon,
                    ))),
          ),
          Text(
            label,
            style: AppStyle.txtNunitoSansSemiBold16.copyWith(
                color: isDarkMode
                    ? ColorConstant.whiteA700
                    : ColorConstant.black9001c),
          )
        ],
      ),
    );
  }
}
