import 'package:flutter/material.dart';
import 'package:mobile_app/features/bible/bible_screen.dart';
import 'package:mobile_app/features/bible/screens/chapters/chapters_screen.dart';
import 'package:mobile_app/features/bible/screens/index/index.dart';
import 'package:mobile_app/shared/shared.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_export.dart';
import '../../../../widgets/widgets.dart';
import '../../../main/pages/home/home.dart';

class BibleMain extends StatefulWidget {
  static const String route = 'bible-router';
  const BibleMain({Key? key}) : super(key: key);

  @override
  State<BibleMain> createState() => _BibleMainState();
}

class _BibleMainState extends State<BibleMain> {
  @override
  void dispose() {
    // STEP 3
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BibleService bibleService =
        Provider.of<BibleService>(context, listen: false);
    final List<BottomNavigationMenu> bottomMenuList = [
      BottomNavigationMenu(icon: ImageConstant.imgHome, title: 'Home'),
      BottomNavigationMenu(
          icon: ImageConstant.imgSearchGray800, title: 'Descubre'),
      BottomNavigationMenu(icon: ImageConstant.imgCalendar, title: 'Liturgia'),
      BottomNavigationMenu(icon: ImageConstant.imgMobile, title: 'Biblia'),
    ];

    bibleService.getBooks();
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
                onTapped: () =>
                    Navigator.of(context).pushNamed(IndexScreen.route),
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
                onTapped: () =>
                    Navigator.of(context).pushNamed(ChaptersScreen.route),
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
      bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: 3,
          onChangeIndex: (index) {},
          bottomMenuList: bottomMenuList),
    );
  }
}
