import 'package:flutter/material.dart';
import 'package:mobile_app/features/library/screens/courses/discover_screen.dart';
import 'package:mobile_app/features/liturgia/screens/calendar/calendar_screen.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_export.dart';
import '../../../../shared/shared.dart';
import '../../../../widgets/widgets.dart';
import '../../../main/pages/home/home.dart';
import '../screens.dart';
import 'widgets/widgets.dart';

class BibleMain extends StatelessWidget {
  static const String route = 'bible-router';
  const BibleMain({Key? key}) : super(key: key);

  void handleChangeBottomNavigationBar(int index, BuildContext context) {
    Widget widget;
    switch (index) {
      case 0:
        widget = HomePage();
        break;
      case 1:
        widget = DiscoverScreen();
        break;
      case 2:
        widget = LiturgiaCalendarScreen();
        break;
      case 3:
        widget = BibleMain();
        break;
      default:
        widget = HomePage();
        break;
    }

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => widget),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    // Preferences.removePageList();
    BibleBookMarkService bibleBookMarkService =
        Provider.of<BibleBookMarkService>(context, listen: false);

    bibleBookMarkService.getBookMarks();
    return Scaffold(
      appBar: CustomAppBar(
        title: 'La Biblia',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24),

            // Liturgy Reading Date
            CardLastReading(),

            // Index
            CardItem(
                title: 'Ver índice',
                image: ImageConstant.imgBookmark,
                onTap: () =>
                    Navigator.of(context).pushNamed(IndexScreen.route)),

            // Saved pages
            CardItem(
                title: 'Marcadores',
                image: ImageConstant.imgBookmarkGray800,
                onTap: () =>
                    Navigator.of(context).pushNamed(BookmarksScreen.route)),

            SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: 3,
          onChangeIndex: (int index) =>
              handleChangeBottomNavigationBar(index, context),
          bottomMenuList: WidgetConstant.defaultBottomMenuList),
    );
  }
}
