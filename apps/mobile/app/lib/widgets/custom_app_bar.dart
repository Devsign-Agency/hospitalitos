import 'package:flutter/material.dart';
import 'package:mobile_app/shared/providers/theme_provider.dart';
import 'package:mobile_app/themes/dark_theme.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../core/app_export.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final Color? textIconColor;
  final String? icon;
  final String? title;
  final double? height;
  final List<Widget>? menuItem;
  final bool hideBack;
  final List<Map<String, dynamic>>? actions;
  final Widget? leading;
  final List<Widget>? bottom;
  final IconButtonVariant? iconButtonVariant;
  final bool? hideActions;
  final bool hasCustomTitle;
  final Widget? customTitle;
  final bool hasPopupMenu;
  final List<Map<String, dynamic>>? menuOptions;
  final PopupMenuButton<int>? popupMenuButton;

  const CustomAppBar({
    super.key,
    this.backgroundColor = Colors.red,
    this.textIconColor = Colors.red,
    this.icon,
    this.title = '',
    this.menuItem,
    this.height: kToolbarHeight,
    this.hideBack = false,
    this.actions,
    this.leading,
    this.bottom,
    this.iconButtonVariant = IconButtonVariant.NoFill,
    this.hideActions = false,
    this.hasCustomTitle = false,
    this.customTitle,
    this.hasPopupMenu = false,
    this.menuOptions,
    this.popupMenuButton,
  });
  @override
  Size get preferredSize => Size.fromHeight(height!);

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    ThemeData currentTheme = themeProvider.currentTheme;
    bool isDarkTheme = currentTheme == DarkTheme.theme;

    return AppBar(
      automaticallyImplyLeading: true,
      leading: leading,
      title: !hasCustomTitle
          ? Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  margin: getMargin(bottom: 10),
                  child: Text('$title',
                      style: isDarkTheme
                          ? AppStyle.txtNunitoSansSemiBold26WhiteA700
                          : AppStyle.txtNunitoSansSemiBold26)))
          : customTitle,
      actions: [
        if (actions != null && !hideActions!)
          ...actions!.map(
            (item) => CustomIconButton(
              margin: getMargin(left: 8),
              height: getSize(48),
              width: getSize(48),
              variant: item['variant'] ?? iconButtonVariant,
              onTap: item['action'],
              child: CustomImageView(
                svgPath: item['icon'],
                color: item['color'] ??
                    (isDarkTheme
                        ? ColorConstant.whiteA700
                        : ColorConstant.gray800),
              ),
            ),
          ),
        SizedBox(width: 16),
        if (hasPopupMenu) popupMenuButton!
      ],
    );
  }
}
