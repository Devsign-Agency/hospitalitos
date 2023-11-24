import 'package:flutter/material.dart';
import 'package:mobile_app/features/notification/screens/notifications/notifications_screen.dart';
import 'package:mobile_app/features/security/screens/screens.dart';
import 'package:mobile_app/router/menu_option.dart';

class RouterNotification {
  static const initialRoute = 'notification';

  static final menuOptions = <MenuOption>[];

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};

    routes.addAll({
      NotificationsScreen.route: (BuildContext context) =>
          NotificationsScreen(),
    });

    for (final option in menuOptions) {
      routes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return routes;
  }
}
