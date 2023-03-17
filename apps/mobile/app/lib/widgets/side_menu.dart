import 'package:flutter/material.dart';
import 'package:mobile_app/features/main/pages/pages.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const _DrawerHeader(),
          ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('Welcome'),
              onTap: () =>
                  Navigator.pushReplacementNamed(context, WelcomeScreen.route)),
          ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Home'),
              onTap: () =>
                  Navigator.pushReplacementNamed(context, HomePage.route)),
          ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () =>
                  Navigator.pushReplacementNamed(context, SettingsScreen.route))
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/menu-img.jpg'),
              fit: BoxFit.cover)),
      child: Container(),
    );
  }
}
