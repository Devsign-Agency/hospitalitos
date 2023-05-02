import 'package:flutter/material.dart';
import 'package:mobile_app/router/router.dart';
import 'package:mobile_app/shared/shared.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        ChangeNotifierProvider(create: (_) => CategoryService() )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Kaad App',
          initialRoute: RouterApp.initialRoute,
          routes: RouterApp.getRoutes(),
          onGenerateRoute: (settings) => RouterApp.onGenerateRoute(settings),
          theme: Provider.of<ThemeProvider>(context).currentTheme),
    );
  }
}
