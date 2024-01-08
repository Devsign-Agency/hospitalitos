import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/widgets.dart';

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

  const CustomAppBar(
      {super.key,
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
      this.hideActions = false});
  @override
  Size get preferredSize => Size.fromHeight(height!);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      leading: leading,
      backgroundColor: backgroundColor,
      title: Align(
          alignment: Alignment.centerLeft,
          child: Container(
              margin: getMargin(bottom: 20),
              child: Text('$title', style: AppStyle.txtNunitoSansSemiBold26))),
      actions: [
        if (actions != null && !hideActions!)
          ...actions!.map(
            (item) => CustomIconButton(
              margin: getMargin(left: 8),
              height: getSize(48),
              width: getSize(48),
              variant: iconButtonVariant,
              onTap: item['action'],
              child: CustomImageView(
                svgPath: item['icon'],
              ),
            ),
          ),
        SizedBox(width: 16)
      ],
    );
  }
}
