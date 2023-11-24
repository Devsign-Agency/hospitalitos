import 'package:flutter/material.dart';
import 'package:mobile_app/router/menu_option.dart';

import '../screens/screens.dart';

class RouterBlog {
  static const initialRoute = BlogScreen.route;

  static final menuOptions = <MenuOption>[];

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};

    routes.addAll({
      BlogScreen.route: (BuildContext context) => BlogScreen(),
      BlogDetail.route: (BuildContext context) => BlogDetail(),
    });

    for (final option in menuOptions) {
      routes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return routes;
  }
}
