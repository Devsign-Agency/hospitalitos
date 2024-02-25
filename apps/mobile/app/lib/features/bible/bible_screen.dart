import 'package:flutter/material.dart';
import 'package:mobile_app/features/bible/screens/screens.dart';
import 'package:mobile_app/features/main/pages/pages.dart';
import 'package:mobile_app/shared/providers/bottom_navigation_main_provider.dart';
import 'package:mobile_app/widgets/custom_bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

import '../../core/app_export.dart';
import '../liturgia/screens/screens.dart';

class BibleScreen extends StatefulWidget {
  static const String route = 'bible';
  const BibleScreen({Key? key}) : super(key: key);

  @override
  State<BibleScreen> createState() => _BibleScreenState();
}

class _BibleScreenState extends State<BibleScreen> {
  late BottomNavigationMainProvider bottomNavigationMain =
      Provider.of<BottomNavigationMainProvider>(context, listen: false);

  @override
  void dispose() {
    // STEP 3
    super.dispose();
  }

  void _onChangeTab(int index) {
    bottomNavigationMain.setSelectedItem(index);
    switch (index) {
      case 0:
        // Navigator.of(context).pushNamed(HomePage.route);
        // Navigator.popAndPushNamed(context, HomePage.route);
        Navigator.pushNamedAndRemoveUntil(
            context, HomePage.route, (r) => false);
        break;
      case 1:
        Navigator.of(context).pushNamed('welcome');
        break;
      case 2:
        Navigator.of(context).pushNamed(LiturgiaCalendarScreen.route);
        break;
      case 3:
        Navigator.of(context).pushReplacementNamed(BibleScreen.route);
        break;
    }
  }

  Widget _getPage(BuildContext context) {
    String? route = ModalRoute.of(context)?.settings.name;

    print('route: $route');
    Widget page;

    switch (route) {
      case '/bible':
        page = BibleMain();
        break;
      case '/bible/chapters':
        page = ChaptersScreen();
        break;
      case '/bible/index':
        page = IndexScreen();
        break;

      default:
        page = BibleMain();
    }
    return page;
  }

  @override
  Widget build(BuildContext context) {
    final List<BottomNavigationMenu> bottomMenuList = [
      BottomNavigationMenu(icon: ImageConstant.imgHome, title: 'Home'),
      BottomNavigationMenu(
          icon: ImageConstant.imgSearchGray800, title: 'Descubre'),
      BottomNavigationMenu(icon: ImageConstant.imgCalendar, title: 'Liturgia'),
      BottomNavigationMenu(icon: ImageConstant.imgMobile, title: 'Biblia'),
    ];

    final BottomNavigationMainProvider bottomNavigationMain =
        Provider.of<BottomNavigationMainProvider>(context, listen: false);

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Bible'),
      // ),

      // body: Center(
      //   child: _getPage(context),
      // ),
      // // body: Center(child: Text('Bible main')),
      body: Center(
          child: Navigator(
        key: GlobalKey(),
        initialRoute: '',
        onGenerateRoute: (RouteSettings settings) {
          Widget page;

          switch (settings.name) {
            case '/bible':
              page = BibleMain();
              break;
            case '/bible/chapters':
              page = ChaptersScreen();
              break;
            case '/bible/index':
              page = IndexScreen();
              break;

            default:
              page = BibleMain();
          }

          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => page,
          );
        },
      )),
      bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: bottomNavigationMain.getSelectedItem,
          onChangeIndex: _onChangeTab,
          bottomMenuList: bottomMenuList),
    );
  }
}
