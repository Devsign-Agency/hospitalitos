import 'package:flutter/material.dart';
import 'package:mobile_app/features/bible/screens/index/widgets/widgets.dart';
import 'package:mobile_app/shared/services/bible_service.dart';

import '../../../../core/app_export.dart';
import '../../../../widgets/widgets.dart';

class IndexScreen extends StatefulWidget {
  static const String route = 'bible/index';

  const IndexScreen({Key? key}) : super(key: key);

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController =
        TabController(length: BibleService.tabBarItems.length, vsync: this);
  }

  handleChangeTab() {
    print(tabController.index);
    if (tabController.index < 2) {
      tabController.index++;
      // tabController.animateTo(tabController.index++);
    }
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final List<BottomNavigationMenu> bottomMenuList = [
      BottomNavigationMenu(icon: ImageConstant.imgHome, title: 'Home'),
      BottomNavigationMenu(
          icon: ImageConstant.imgSearchGray800, title: 'Descubre'),
      BottomNavigationMenu(icon: ImageConstant.imgCalendar, title: 'Liturgia'),
      BottomNavigationMenu(icon: ImageConstant.imgMobile, title: 'Biblia'),
    ];
    final List<Map<String, dynamic>> actions = [
      {
        'icon': ImageConstant.imgSearch,
        'action': () => {print('Search...')}
      },
    ];
    return Scaffold(
      appBar: CustomAppBar(
        leading: CustomIconButton(
          margin: getMargin(left: 8),
          height: getSize(48),
          width: getSize(48),
          variant: IconButtonVariant.NoFill,
          onTap: () => Navigator.of(context).pop(),
          child: CustomImageView(
            svgPath: ImageConstant.imgArrowleftGray900,
            color: ColorConstant.gray800,
          ),
        ),
        title: 'Índice',
        backgroundColor: ColorConstant.gray50,
        actions: [...actions],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // Tab items
                CustomTabBar(
                    tabController: tabController,
                    items: BibleService.tabBarItems),

                // TabBarView
                SizedBox(
                  height: height * 0.8,
                  width: double.infinity,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      // Books Tab
                      TabBarViewBooks(
                          bookNames: BibleService.bookNames,
                          onChangeTab: handleChangeTab),

                      // Chapters Tab
                      TabBarViewChapters(
                          amountOfChapters: BibleService.amountOfChapters,
                          onChangeTab: handleChangeTab),

                      // Verses Tab
                      TabBarViewVerses(
                          amountOfChapters: BibleService.amountOfVerses,
                          onChangeTab: handleChangeTab),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: 3,
          onChangeIndex: (index) {},
          bottomMenuList: bottomMenuList),
    );
  }
}
