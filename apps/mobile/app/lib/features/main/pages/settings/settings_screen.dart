import 'package:flutter/material.dart';
import 'package:mobile_app/shared/providers/providers.dart';
import 'package:mobile_app/shared/shared.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const String route = 'settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const SideMenu(),
      body: Column(
        children: [
          const Text('Ajustes',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          const Divider(),
          SwitchListTile(
              value: Preferences.isDarkmode,
              title: const Text('Darkmode'),
              onChanged: (value) {
                final provider =
                    Provider.of<ThemeProvider>(context, listen: false);
                value ? provider.setDarkMode() : provider.setLightMode();
                setState(() {
                  Preferences.isDarkmode = value;
                });
              }),
        ],
      ),
    );
  }
}
