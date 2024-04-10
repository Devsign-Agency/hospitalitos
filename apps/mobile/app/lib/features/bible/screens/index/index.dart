import 'package:flutter/material.dart';
import 'package:mobile_app/features/bible/screens/index/widgets/widgets.dart';
import 'package:mobile_app/shared/services/bible_service.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_export.dart';
import '../../../../widgets/widgets.dart';
import '../../../main/pages/pages.dart';

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
    tabController = TabController(
      length: BibleService.tabBarItems.length,
      vsync: this,
    );
  }

  handleChangeTab() {
    if (tabController.index < 2) {
      tabController.index++;
    }
  }

  handleChangeBottomNavigationBar(int index) {
    switch (index) {
      case 0:
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomePage()),
            (Route<dynamic> route) => false);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    BibleService bibleService =
        Provider.of<BibleService>(context, listen: true);
    bool isDarkTheme = bibleService.isDarkTheme;

    final List<Map<String, dynamic>> actions = [
      // {
      //   'icon': ImageConstant.imgSearch,
      //   'action': () => {print('Search...')}
      // },
      {
        'icon': ImageConstant.imgMoonIndigo,
        'action': () {
          bibleService.isDarkTheme = !bibleService.isDarkTheme;
          print(bibleService.isDarkTheme);
        }
      },
    ];

    return Scaffold(
      backgroundColor: isDarkTheme ? Color(0xff1C1B1F) : ColorConstant.gray100,
      appBar: CustomAppBar(
        customTitle: Text('Índice',
            style: isDarkTheme
                ? AppStyle.txtNunitoSansSemiBold26WhiteA700
                : AppStyle.txtNunitoSansSemiBold26),
        hasCustomTitle: true,
        leading: CustomIconButton(
          margin: getMargin(left: 8),
          height: getSize(48),
          width: getSize(48),
          variant: IconButtonVariant.NoFill,
          onTap: () => Navigator.of(context).pop(),
          child: CustomImageView(
            svgPath: isDarkTheme
                ? ImageConstant.imgArrowleftGray900
                : ImageConstant.imgArrowleftWhiteA700,
            color:
                isDarkTheme ? ColorConstant.whiteA700 : ColorConstant.gray800,
          ),
        ),
        // title: 'Índice',
        backgroundColor: isDarkTheme ? Color(0xff1C1B1F) : ColorConstant.gray50,
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
                    indicatorColor:
                        isDarkTheme ? ColorConstant.purple200 : null,
                    labelColor: isDarkTheme ? ColorConstant.purple200 : null,
                    tabController: tabController,
                    items: BibleService.tabBarItems),

                // TabBarView
                SizedBox(
                  height: height * 0.8,
                  width: double.infinity,
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: tabController,
                    children: [
                      // Books Tab
                      TabBarViewBooks(
                          future: bibleService.getBooks(),
                          onChangeTab: handleChangeTab),

                      // Chapters Tab
                      TabBarViewChapters(
                          amountOfChapters:
                              bibleService.selectedBook.chapters.length,
                          onChangeTab: handleChangeTab),

                      // Verses Tab
                      TabBarViewVerses(
                          amountOfVerses:
                              bibleService.selectedChapter.verses.length,
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
          backgroundColor:
              isDarkTheme ? Color(0xff1C1B1F) : ColorConstant.gray50,
          currentIndex: 2,
          onChangeIndex: handleChangeBottomNavigationBar,
          bottomMenuList: BibleService.bottomMenuList),
    );
  }
}
