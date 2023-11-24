import 'package:flutter/material.dart';

import '../core/app_export.dart';
import 'widgets.dart';

class MenuOptions extends StatelessWidget {
  final List<Map<String, dynamic>> menuOptions;

  const MenuOptions({
    super.key,
    required this.menuOptions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(left: 16),
      width: double.infinity,
      height: 40,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, int index) {
            final option = menuOptions[index];

            return _MenuOptionButton(
              icon: option['icon']!,
              title: option['title']!,
              action: option['action']!,
            );
          },
          separatorBuilder: (_, __) => SizedBox(width: 8),
          itemCount: menuOptions.length),
    );
  }
}

class _MenuOptionButton extends StatelessWidget {
  final String icon;
  final String title;
  final Function action;

  const _MenuOptionButton({
    super.key,
    required this.icon,
    required this.title,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(right: 12),
            // fixedSize: Size(146, 36),
            elevation: 0,
            backgroundColor: ColorConstant.gray300),
        onPressed: () => action(),
        child: Row(
          children: [
            CustomIconButton(
              height: getSize(48),
              width: getSize(48),
              variant: IconButtonVariant.NoFill,
              child: CustomImageView(
                color: ColorConstant.whiteA700,
                svgPath: icon,
              ),
            ),
            Text(
              title,
              style: AppStyle.txtNunitoSansSemiBold16Gray800,
            )
          ],
        ));
  }
}
