import 'package:flutter/material.dart';
import 'package:mobile_app/features/profile/screens/profile_menu/profile_menu_screen.dart';
import 'package:mobile_app/router/menu_option.dart';

import '../screens/screens.dart';

class RouterProfile {
  static const initialRoute = ProfileMenuScreen.route;

  static final menuOptions = <MenuOption>[];

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};

    routes.addAll({
      ProfileMenuScreen.route: (BuildContext context) => ProfileMenuScreen(),
      HelpScreen.route: (BuildContext context) => HelpScreen(),
      InterestScreen.route: (BuildContext context) => InterestScreen(),
      EditProfileScreen.route: (BuildContext context) => EditProfileScreen(),
    });

    for (final option in menuOptions) {
      routes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return routes;
  }
}
