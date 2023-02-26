import 'package:flutter/material.dart';
import 'package:mobile_app/features/main/router/router.dart';
import 'package:mobile_app/features/security/router/router.dart';

class RouterApp {
  static const initialRoute = RouterMain.initialRoute;

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};

    routes.addAll(RouterMain.getRoutes());
    routes.addAll(RouterSecurity.getRoutes());

    return routes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return RouterMain.onGenerateRoute(settings);
  }
}
