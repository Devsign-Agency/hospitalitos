import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_app/router/router.dart';
import 'package:mobile_app/shared/providers/bottom_navigation_main_provider.dart';
import 'package:mobile_app/shared/services/bible_service.dart';
import 'package:mobile_app/shared/shared.dart';
import 'package:provider/provider.dart';

import 'shared/services/ftoast_service.dart';
import 'themes/themes.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  await Preferences.init();
  return runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (_) => ThemeProvider(isDarkmode: Preferences.isDarkmode))
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => CategoryService()),
        ChangeNotifierProvider(create: (_) => BibleService(), lazy: false),
        ChangeNotifierProvider(create: (_) => LiturgyService()),
        ChangeNotifierProvider(create: (_) => FavoriteService()),
        ChangeNotifierProvider(create: (_) => PdfService()),
        ChangeNotifierProvider(create: (_) => TextToSpeech()),
        ChangeNotifierProvider(create: (_) => BookService()),
        ChangeNotifierProvider(create: (_) => BottomNavigationMainProvider()),
        ChangeNotifierProvider(create: (_) => MarkerService()),
      ],
      child: MaterialApp(
          builder: FToastBuilder(),
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'Kaad App',
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [const Locale('es')],
          initialRoute: RouterApp.initialRoute,
          routes: RouterApp.getRoutes(),
          onGenerateRoute: (settings) => RouterApp.onGenerateRoute(settings),
          theme: LightTheme.theme),
    );
  }
}
