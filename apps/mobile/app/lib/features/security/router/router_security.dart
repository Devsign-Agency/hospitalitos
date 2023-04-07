import 'package:flutter/material.dart';
import 'package:mobile_app/features/security/screens/screens.dart';
import 'package:mobile_app/router/menu_option.dart';

class RouterSecurity {

  static const initialRoute = 'login';

  static final menuOptions = <MenuOption>[];

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};

    routes.addAll(
        {LoginScreen.route: (BuildContext context) => LoginScreen()});

    for (final option in menuOptions) {
      routes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return routes;
  }
}
