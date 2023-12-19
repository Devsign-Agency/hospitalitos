import 'package:flutter/material.dart';
import 'package:mobile_app/features/bible/screens/screens.dart';
import 'package:mobile_app/router/menu_option.dart';

class RouterBible {
  static final menuOptions = <MenuOption>[];

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};

    routes.addAll({MainScreen.route: (BuildContext context) => MainScreen()});
    routes.addAll(
        {ChaptersScreen.route: (BuildContext context) => ChaptersScreen()});
    routes.addAll({IndexScreen.route: (BuildContext context) => IndexScreen()});

    return routes;
  }
}
