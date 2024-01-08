import 'package:flutter/material.dart';
import 'package:mobile_app/features/bible/screens/screens.dart';

import '../../../../core/app_export.dart';
import '../../../../widgets/widgets.dart';

class MainScreen extends StatelessWidget {
  static const String route = 'bible-router';
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> actions = [
      {
        'icon': ImageConstant.imgSearch,
        'action': () => {print('Search...')}
      },
    ];
    return Scaffold(
      appBar: CustomAppBar(
        title: 'La Biblia',
        backgroundColor: ColorConstant.gray50,
        iconButtonVariant: IconButtonVariant.FillGray300,
        actions: [...actions],
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

            // Index
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

            // Saved pages
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
