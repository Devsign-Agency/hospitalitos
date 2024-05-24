import 'package:flutter/material.dart';
import 'package:mobile_app/features/book/book.screen.dart';
import 'package:mobile_app/router/menu_option.dart';

import '../screens/screens.dart';

class RouterBook {
  static const initialRoute = BookScreen.route;

  static final menuOptions = <MenuOption>[];

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};

    routes.addAll({
      ChapterScreen.route: (BuildContext context) => ChapterScreen(),
      EpubIndexScreen.route: (BuildContext context) => EpubIndexScreen(),
    });

    for (final option in menuOptions) {
      routes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return routes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (_) => EpubIndexScreen());
  }
}
