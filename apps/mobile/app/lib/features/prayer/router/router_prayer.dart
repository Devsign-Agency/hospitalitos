import 'package:flutter/material.dart';
import 'package:mobile_app/features/prayer/screens/prayer_detail/prayer_detail_screen.dart';
import 'package:mobile_app/features/prayer/screens/prayers/prayers_screen.dart';

import 'package:mobile_app/router/menu_option.dart';

class RouterPrayer {
  static final menuOptions = <MenuOption>[];

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};

    routes.addAll({
      PrayerDetailScreen.route: (BuildContext context) => PrayerDetailScreen()
    });
    routes.addAll(
        {PrayersScreen.route: (BuildContext context) => PrayersScreen()});

    for (final option in menuOptions) {
      routes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return routes;
  }
}
