import 'package:flutter/material.dart';

import '../screens/screens.dart';

class RouterLibrary {
  static const initialRoute = CoursesScreen.route;

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};

    routes.addAll({
      CoursesScreen.route: (BuildContext context) => CoursesScreen(),
      PreviewVideoScreen.route: (BuildContext context) => PreviewVideoScreen(),
      PreviewBookScreen.route: (BuildContext context) => PreviewBookScreen(),
      ReaderBookScreen.route: (BuildContext context) => ReaderBookScreen(),
      PreviewPodcastScreen.route: (BuildContext context) =>
          PreviewPodcastScreen(),
    });

    return routes;
  }
}
