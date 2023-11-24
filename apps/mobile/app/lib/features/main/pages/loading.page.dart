import 'package:flutter/material.dart';
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
            return Center(
              child: Text('Autenticando...'),
            );
          }),
    );
  }

  Future checkLoginState(BuildContext context) async {
    final authService = Provider.of<AuthService>(context, listen: false);
    final authenticated = await authService.isLoggedIn();
    if (authenticated) {
      if (context.mounted) Navigator.pushReplacementNamed(context, HomePage.route);
    } else {
      if (context.mounted) Navigator.pushReplacementNamed(context, LoginScreen.route);
    }
  }
}
