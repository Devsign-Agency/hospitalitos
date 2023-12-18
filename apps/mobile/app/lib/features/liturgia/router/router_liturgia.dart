import 'package:flutter/material.dart';
import 'package:mobile_app/features/liturgia/screens/calendar/calendar_screen.dart';
import 'package:mobile_app/router/menu_option.dart';

class RouterLiturgia {
  static final menuOptions = <MenuOption>[];

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};

    routes.addAll({
      LiturgiaCalendarScreen.route: (BuildContext context) =>
          LiturgiaCalendarScreen()
    });

    for (final option in menuOptions) {
      routes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return routes;
  }
}
