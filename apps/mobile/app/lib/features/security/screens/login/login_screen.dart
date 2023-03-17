import 'package:flutter/material.dart';
import 'package:mobile_app/features/security/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  static const String route = 'login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: AuthBackground(child: _Scrollview()));
  }
}

class _Scrollview extends StatelessWidget {
  const _Scrollview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          SizedBox(height: 250),
          CardContainer(child: _LoginForm())
        ],
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 10),
      Text('Login', style: Theme.of(context).textTheme.headlineSmall),
      const SizedBox(height: 10),
      const Text('Formulario')
    ]);
  }
}
