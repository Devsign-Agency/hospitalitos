import 'package:flutter/material.dart';
import 'package:mobile_app/features/bible/bible_screen.dart';
import 'package:mobile_app/features/bible/screens/screens.dart';
import 'package:mobile_app/router/menu_option.dart';

class RouterBible {
  static final menuOptions = <MenuOption>[];

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};

    routes.addAll({BibleMain.route: (BuildContext context) => BibleMain()});
    routes.addAll(
        {ChaptersScreen.route: (BuildContext context) => ChaptersScreen()});
    routes.addAll({IndexScreen.route: (BuildContext context) => IndexScreen()});
    routes.addAll({BibleScreen.route: (BuildContext context) => BibleScreen()});

    return routes;
  }
}
