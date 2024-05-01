import 'package:flutter/material.dart';
import 'package:mobile_app/features/reading/screens/screens.dart';

import 'package:mobile_app/router/menu_option.dart';

import '../screens/reading_detail/reading_detail_screen.dart';

class RouterReading {
  static final menuOptions = <MenuOption>[];

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};

    routes.addAll(
        {ReadingScreen.route: (BuildContext context) => ReadingScreen()});
    routes.addAll({
      ReadingDetailScreen.route: (BuildContext context) => ReadingDetailScreen()
    });

    for (final option in menuOptions) {
      routes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return routes;
  }
}
