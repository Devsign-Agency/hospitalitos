import 'package:flutter/material.dart';

import '../../../../core/app_export.dart';
import '../../../../widgets/widgets.dart';

class LiturgiaCalendarScreen extends StatelessWidget {
  static const String route = 'calendar-route';
  const LiturgiaCalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> liturgias = [
      'Tiempo de navidad',
      'Sábado de la semana II.',
      'Del propio del día. Salterío II.'
    ];

    List<Map<String, dynamic>> items = [
      {
        'id': '0',
        'title': 'Oficio de lectura',
        'description':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        'isSelected': false,
      },
      {
        'id': '1',
        'title': 'Laudes',
        'description':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        'isSelected': false,
      },
      {
        'id': '2',
        'title': 'Tercia',
        'description':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        'isSelected': false,
      },
      {
        'id': '3',
        'title': 'Sexta',
        'description':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        'isSelected': false,
      },
      {
        'id': '4',
        'title': 'Nona',
        'description':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        'isSelected': false,
      },
      {
        'id': '5',
        'title': 'Visperas',
        'description':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        'isSelected': false,
      },
      {
        'id': '6',
        'title': 'Completas',
        'description':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        'isSelected': false,
      },
    ];

    return Scaffold(
      appBar: _CustomAppBar(
        title: 'Liturgia',
        backgroundColor: ColorConstant.gray50,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24),

            // Liturgy Reading Date
            CustomCard(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('07 de enero',
                    style: AppStyle.txtNunitoSansSemiBold20Black900),
                CustomImageView(
                    width: 24,
                    height: 24,
                    color: ColorConstant.whiteA700,
                    svgPath: ImageConstant.imgEditIndigo900,
                    onTap: () {
                      _handleEditDate(context);
                    }),
              ],
            )),

            // Readings
            CustomCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...liturgias.map((liturgia) =>
                      Text(liturgia, style: AppStyle.txtNunitoSansRegular16)),
                ],
              ),
            ),

            // Item List
            CustomCard(
                child: ListCollapseItem(
              items: items,
              onSelectedItem: _handleSelectedItem,
            )),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  void _handleSelectedItem(dynamic item) {
    print(item);
  }

  _handleEditDate(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
            primary: ColorConstant.indigo900, // header background color
            onPrimary: Colors.red, // header text color
            onSurface: Colors.blue, // body text color
          )),
          // data: ThemeData.light().copyWith(
          //     primaryColor: const Color(0xFF4A5BF6), //Head background
          //     colorScheme: ColorScheme.light(background: Colors.white),
          //     dialogBackgroundColor: Colors.red,
          //     dialogTheme: DialogTheme(
          //         backgroundColor: Colors.white,
          //         shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.all(Radius.circular(4))))),
          child: child ?? Text(''),
        );
      },
    );
    // DateTime? date = await showDatePicker(
    //     context: context,

    //     locale: const Locale('es', 'ES'),
    //     initialDate: DateTime.now(),
    //     firstDate: DateTime(1900),
    //     lastDate: DateTime(2100));

    // dateCtl.text = date.toIso8601String();
    print(date);
  }
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final Color? textIconColor;
  final String? icon;
  final String? title;
  final double? height;
  final List<Widget>? menuItem;
  final bool hideBack;

  const _CustomAppBar({
    super.key,
    this.backgroundColor = Colors.red,
    this.textIconColor = Colors.red,
    this.icon,
    this.title = '',
    this.menuItem,
    this.height: kToolbarHeight,
    this.hideBack = false,
  });
  @override
  Size get preferredSize => Size.fromHeight(height!);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: Align(
          alignment: Alignment.centerLeft,
          child: Text('$title', style: AppStyle.txtNunitoSansSemiBold26)),
    );
  }
}
