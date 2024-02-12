import 'package:flutter/material.dart';
import 'package:mobile_app/core/app_export.dart';
import 'package:mobile_app/features/main/pages/home/home.dart';
import 'package:mobile_app/features/security/screens/screens.dart';
import 'package:mobile_app/shared/shared.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatelessWidget {
  static const route = 'loading';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: checkLoginState(context),
          builder: (context, snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Text('Autenticando')],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: CircularProgressIndicator(
                          color: ColorConstant.yellow100),
                    )
                  ],
                ),
              ],
            );
          }),
    );
  }

  Future checkLoginState(BuildContext context) async {
    final authService = Provider.of<AuthService>(context, listen: false);
    final authenticated = await authService.isLoggedIn();
    if (authenticated) {
      if (context.mounted)
        Navigator.pushReplacementNamed(context, HomePage.route);
    } else {
      if (context.mounted)
        Navigator.pushReplacementNamed(context, LoginScreen.route);
    }
  }
}
