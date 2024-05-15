import 'package:flutter/material.dart';
import 'package:mobile_app/features/bible/screens/index/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_export.dart';
import '../../../../shared/shared.dart';
import '../../../../themes/themes.dart';
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
  bool _showBottomNavigationBar = true;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: WidgetConstant.tabBarItems.length,
      vsync: this,
    );

    tabController.addListener(() {
      _showBottomNavigationBar = tabController.index == 0;
      setState(() {});
    });
  }

  handleChangeTab() {
    if (tabController.index < 2) {
      tabController.index++;
    }
  }

  handleChangeBottomNavigationBar(int index, BibleService bibleService) {
    bibleService.getBooksByGroup(index == 0 ? 'antiguo' : 'nuevo');
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    BibleService bibleService =
        Provider.of<BibleService>(context, listen: true);
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkTheme = themeProvider.currentTheme == DarkTheme.theme;

    return Scaffold(
      appBar: CustomAppBar(
          customTitle: Text('Índice',
              style: isDarkTheme
                  ? AppStyle.txtNunitoSansSemiBold26WhiteA700
                  : AppStyle.txtNunitoSansSemiBold26),
          hasCustomTitle: true,
          leading: CustomIconBackButton(isDarkTheme: isDarkTheme)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // Tab items
                CustomTabBar(
                    tabController: tabController,
                    items: WidgetConstant.tabBarItems),

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
                          books: bibleService.filteredBook,
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
      bottomNavigationBar: _showBottomNavigationBar
          ? CustomBottomNavigationBar(
              currentIndex: bibleService.selectedGroup == 'antiguo' ? 0 : 1,
              onChangeIndex: (int index) =>
                  handleChangeBottomNavigationBar(index, bibleService),
              bottomMenuList: WidgetConstant.bibleBottomMenuList)
          : null,
    );
  }
}
