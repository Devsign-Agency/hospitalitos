import 'package:flutter/material.dart';
import 'package:mobile_app/features/main/main.screen.dart';
import 'package:mobile_app/features/main/pages/pages.dart';
import 'package:mobile_app/router/menu_option.dart';

class RouterMain {
  static const initialRoute = '';

  static final menuOptions = <MenuOption>[];

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};

    routes.addAll(
        {MainScreen.route: (BuildContext context) => MainScreen()});
    routes.addAll(
        {HomePage.route: (BuildContext context) => HomePage()});
    routes.addAll(
        {WelcomeScreen.route: (BuildContext context) => const WelcomeScreen()});
    routes.addAll({
      SettingsScreen.route: (BuildContext context) => const SettingsScreen()
    });

    for (final option in menuOptions) {
      routes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return routes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (_) => HomePage());
  }
}
