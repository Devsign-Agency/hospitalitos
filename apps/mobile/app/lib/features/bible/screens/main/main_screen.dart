import 'package:flutter/material.dart';
import 'package:mobile_app/features/bible/screens/screens.dart';

import '../../../../core/app_export.dart';
import '../../../../widgets/widgets.dart';

class MainScreen extends StatelessWidget {
  static const String route = 'bible-router';
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _CustomAppBar(
        title: 'La Biblia',
        backgroundColor: ColorConstant.gray50,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24),

            // Liturgy Reading Date
            CustomCard(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Última Lectura',
                    style: AppStyle.txtNunitoSansSemiBold13Gray200),
                Text('Génesis 1:16', style: AppStyle.txtNunitoSansSemiBold23),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text('Continuar',
                      style: AppStyle.txtNunitoSansSemiBold16),
                ),
              ],
            )),

            CustomCard(
                onTapped: () => Navigator.pushNamed(context, IndexScreen.route),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomIconButton(
                      height: getSize(48),
                      width: getSize(48),
                      variant: IconButtonVariant.NoFill,
                      child: CustomImageView(
                        color: ColorConstant.gray800,
                        svgPath: ImageConstant.imgBookmark,
                      ),
                    ),
                    Text(
                      'Ver índice',
                      style: AppStyle.txtNunitoSansSemiBold23,
                    ),
                  ],
                )),

            CustomCard(
                onTapped: () => Navigator.pushNamed(
                    context, ChaptersScreen.route,
                    arguments: 'instance-chapter'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomIconButton(
                      height: getSize(48),
                      width: getSize(48),
                      variant: IconButtonVariant.NoFill,
                      child: CustomImageView(
                        color: ColorConstant.gray800,
                        svgPath: ImageConstant.imgBookmarkGray800,
                      ),
                    ),
                    Text(
                      'Página guardadas',
                      style: AppStyle.txtNunitoSansSemiBold23,
                    ),
                  ],
                )),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final Color? textIconColor;
  final String? icon;
  final String? title;
  final double? height;
  final List<Widget>? menuItem;
  final bool hideBack;

  const _CustomAppBar({
    super.key,
    this.backgroundColor = Colors.red,
    this.textIconColor = Colors.red,
    this.icon,
    this.title = '',
    this.menuItem,
    this.height: kToolbarHeight,
    this.hideBack = false,
  });
  @override
  Size get preferredSize => Size.fromHeight(height!);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: Align(
          alignment: Alignment.centerLeft,
          child: Text('$title', style: AppStyle.txtNunitoSansSemiBold26)),
      actions: [
        CustomIconButton(
          height: getSize(48),
          margin: getMargin(right: 16),
          width: getSize(48),
          variant: IconButtonVariant.FillGray300,
          child: CustomImageView(
            color: ColorConstant.gray800,
            svgPath: ImageConstant.imgSearch,
          ),
        ),
      ],
    );
  }
}
