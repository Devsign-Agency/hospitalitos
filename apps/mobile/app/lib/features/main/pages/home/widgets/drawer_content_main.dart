import 'package:flutter/material.dart';
import 'package:mobile_app/core/app_export.dart';
import 'package:provider/provider.dart';

import '../../../../../shared/shared.dart';

class DrawerContentMain extends StatefulWidget {
  const DrawerContentMain({super.key});

  @override
  State<DrawerContentMain> createState() => _DrawerContentMainState();
}

class _DrawerContentMainState extends State<DrawerContentMain> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _DrawerHeader(),
        Expanded(
            child: Container(
                padding: getPadding(left: 16),
                width: double.infinity,
                child: ListView(
                  padding: getPadding(all: 0),
                  children: [
                    ListTile(
                      title: Text('Tus marcadores',
                          style: AppStyle.txtNunitoSansRegular18Gray900),
                      leading: Icon(Icons.bookmark),
                    ),
                    ListTile(
                      title: Text('Favoritos',
                          style: AppStyle.txtNunitoSansRegular18Gray900),
                      leading: Icon(Icons.star),
                    ),
                    ListTile(
                      title: Text('Historial',
                          style: AppStyle.txtNunitoSansRegular18Gray900),
                      leading: Icon(Icons.access_alarms_outlined),
                    ),
                    ListTile(
                      title: Text('Preferencias',
                          style: AppStyle.txtNunitoSansRegular18Gray900),
                      leading: Icon(Icons.settings),
                    ),
                    const Divider(),
                    SwitchListTile(
                        value: Preferences.isDarkmode,
                        title: const Icon(Icons.brightness_3_outlined),
                        onChanged: (value) {
                          final provider = Provider.of<ThemeProvider>(context,
                              listen: false);
                          value
                              ? provider.setDarkMode()
                              : provider.setLightMode();
                          setState(() {
                            Preferences.isDarkmode = value;
                          });
                        }),
                  ],
                )))
      ],
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
