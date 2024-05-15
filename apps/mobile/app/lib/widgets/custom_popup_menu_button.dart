import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../core/app_export.dart';

class CustomPopupMenuButton extends StatelessWidget {
  final bool isDarkMode;
  final List<PopupMenuItemModel> menuOptions;

  const CustomPopupMenuButton(
      {super.key, required this.isDarkMode, required this.menuOptions});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
        color: isDarkMode ? ColorConstant.gray30002 : ColorConstant.gray100,
        constraints: BoxConstraints(
          minWidth: 200,
        ),
        offset: Offset(20, 60),
        itemBuilder: (context) => [
              ...menuOptions.map((item) => PopupMenuItem(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(item.title,
                            style: AppStyle.txtNunitoSansRegular18WhiteA700
                                .copyWith(
                                    color: isDarkMode
                                        ? ColorConstant.whiteA700
                                        : ColorConstant.black900))),
                    onTap: () => item.onTappedItem(),
                  ))
            ]);
  }
}
