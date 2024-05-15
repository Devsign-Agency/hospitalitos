import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/app_export.dart';
import '../../../../../shared/providers/providers.dart';
import '../../../../../themes/themes.dart';
import '../../../../../widgets/widgets.dart';

class CardItem extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;

  const CardItem(
      {super.key,
      required this.title,
      required this.image,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkTheme = themeProvider.currentTheme == DarkTheme.theme;
    Color iconColor =
        isDarkTheme ? ColorConstant.whiteA700 : ColorConstant.gray800;
    TextStyle txtNunitoSansSemiBold23 = AppStyle.txtNunitoSansSemiBold23
        .copyWith(
            color:
                isDarkTheme ? ColorConstant.whiteA700 : ColorConstant.gray900);

    return CustomCard(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomIconButton(
              height: getSize(48),
              width: getSize(48),
              variant: IconButtonVariant.NoFill,
              child: CustomImageView(
                color: iconColor,
                svgPath: image,
              ),
            ),
            Text(
              title,
              style: txtNunitoSansSemiBold23,
            ),
          ],
        ),
        onTapped: () => onTap());
  }
}
