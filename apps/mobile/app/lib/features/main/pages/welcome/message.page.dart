import 'package:flutter/material.dart';
import 'package:mobile_app/features/main/pages/welcome/navigation.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigation.welcomeState.currentState?.pushNamed('/welcome/contact');
        },
        child: Text('Contact'));
  }
}
