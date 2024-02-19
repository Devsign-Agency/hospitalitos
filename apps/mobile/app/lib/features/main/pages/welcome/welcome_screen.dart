import 'package:flutter/material.dart';
import 'package:mobile_app/features/main/pages/welcome/contact.page.dart';
import 'package:mobile_app/features/main/pages/welcome/message.page.dart';
import 'package:mobile_app/features/main/pages/welcome/navigation.dart';
import 'package:mobile_app/shared/providers/providers.dart';
import 'package:mobile_app/features/main/pages/pages.dart';
import 'package:mobile_app/shared/preferences.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  static const String route = 'welcome';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
                onPressed: () {
                  Preferences.isDarkmode = !Preferences.isDarkmode;
                  final provider =
                      Provider.of<ThemeProvider>(context, listen: false);
                  Preferences.isDarkmode
                      ? provider.setDarkMode()
                      : provider.setLightMode();
                },
                icon: const Icon(Icons.dark_mode))
          ],
        ),
        body: Background(
          child: SizedBox(
              width: double.infinity,
              child: Navigator(
                key: Navigation.welcomeState,
                initialRoute: '',
                onGenerateRoute: (RouteSettings settings) {
                  Widget page;

                  switch (settings.name) {
                    case '/':
                      page = MessagePage();
                      break;
                    case '/welcome/contact':
                      page = ContactPage();
                      break;

                    default:
                      page = MessagePage();
                  }

                  return PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        page,
                  );
                },
              )),
        ));
  }
}
