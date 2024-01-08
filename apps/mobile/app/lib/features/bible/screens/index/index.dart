import 'package:flutter/material.dart';
import 'package:mobile_app/features/bible/screens/index/widgets/widgets.dart';
import 'package:mobile_app/shared/services/bible_service.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_export.dart';
import '../../../../widgets/widgets.dart';

class IndexScreen extends StatefulWidget {
  static const String route = 'index-route';

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

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final List<Map<String, dynamic>> actions = [
      {
        'icon': ImageConstant.imgSearch,
        'action': () => {print('Search...')}
      },
    ];
    return Scaffold(
        appBar: CustomAppBar(
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
                        TabBarViewBooks(bookNames: BibleService.bookNames),

                        // Chapters Tab
                        TabBarViewChapters(
                            amountOfChapters: BibleService.amountOfChapters),

                        // Verses Tab
                        TabBarViewVerses(
                            amountOfChapters: BibleService.amountOfVerses),

                        Text('Text 4'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
