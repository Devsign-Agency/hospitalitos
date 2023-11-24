import 'package:flutter/material.dart';
import 'package:mobile_app/features/favorite/screens/screens.dart';
import 'package:mobile_app/features/main/pages/pages.dart';
import 'package:mobile_app/router/menu_option.dart';

class RouterFavorite {
  static const initialRoute = LoadingPage.route;

  static final menuOptions = <MenuOption>[];

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};

    routes.addAll({
      FavoriteListScreen.route: (BuildContext context) => FavoriteListScreen()
    });

    for (final option in menuOptions) {
      routes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return routes;
  }
}
