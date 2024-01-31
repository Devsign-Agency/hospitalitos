import 'package:flutter/material.dart';
import 'package:mobile_app/features/book/book.screen.dart';
import 'package:mobile_app/features/book/pages/audio_player.page.dart';
import 'package:mobile_app/features/book/pages/pages.dart';
import 'package:mobile_app/features/book/pages/read_tools.page.dart';
import 'package:mobile_app/features/book/pages/sound.page.dart';
import 'package:mobile_app/router/menu_option.dart';

class RouterBook {
  static const initialRoute = BookScreen.route;

  static final menuOptions = <MenuOption>[];

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};

    routes.addAll({
      BookScreen.route: (BuildContext context) => BookScreen(),
      IndexPage.route: (BuildContext context) => IndexPage(),
      SoundScreen.route: (BuildContext context) => SoundScreen(),
      ReadToolsPage.route: (BuildContext context) => ReadToolsPage(),
      AudioPlayerScreen.route: (BuildContext context) => AudioPlayerScreen(),
    });

    for (final option in menuOptions) {
      routes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return routes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (_) => IndexPage());
  }
}
