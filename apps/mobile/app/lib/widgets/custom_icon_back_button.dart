import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/widgets.dart';

import '../core/app_export.dart';

class CustomIconBackButton extends StatelessWidget {
  final bool isDarkTheme;

  const CustomIconBackButton({super.key, required this.isDarkTheme});

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      margin: getMargin(left: 8),
      height: getSize(48),
      width: getSize(48),
      variant: IconButtonVariant.NoFill,
      onTap: () => Navigator.of(context).pop(),
      child: CustomImageView(
        svgPath: isDarkTheme
            ? ImageConstant.imgArrowleftGray900
            : ImageConstant.imgArrowleftWhiteA700,
        color: isDarkTheme ? ColorConstant.whiteA700 : ColorConstant.gray800,
      ),
    );
  }
}
