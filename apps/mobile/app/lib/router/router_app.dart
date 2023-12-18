import 'package:flutter/material.dart';
import 'package:mobile_app/features/blog/router/router.dart';
import 'package:mobile_app/features/book/router/router.dart';
import 'package:mobile_app/features/library/router/library_router.dart';
import 'package:mobile_app/features/main/router/router.dart';
import 'package:mobile_app/features/notification/router/router_notification.dart';
import 'package:mobile_app/features/security/router/router.dart';
import 'package:mobile_app/features/favorite/router/router.dart';
import 'package:mobile_app/features/profile/router/router.dart';

import '../features/bible/router/router.dart';
import '../features/liturgia/router/router.dart';

class RouterApp {
  static const initialRoute = RouterMain.initialRoute;

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};

    routes.addAll(RouterMain.getRoutes());
    routes.addAll(RouterSecurity.getRoutes());
    routes.addAll(RouterBook.getRoutes());
    routes.addAll(RouterBlog.getRoutes());
    routes.addAll(RouterProfile.getRoutes());
    routes.addAll(RouterFavorite.getRoutes());
    routes.addAll(RouterNotification.getRoutes());
    routes.addAll(RouterLibrary.getRoutes());
    routes.addAll(RouterLiturgia.getRoutes());
    routes.addAll(RouterBible.getRoutes());

    return routes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return RouterMain.onGenerateRoute(settings);
  }
}
