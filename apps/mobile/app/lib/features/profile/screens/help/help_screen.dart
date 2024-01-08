import 'package:flutter/material.dart';

import '../../../../core/app_export.dart';
import '../../../../widgets/widgets.dart';

class HelpScreen extends StatelessWidget {
  static const String route = 'profile-help';

  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> questions = List<Map<String, dynamic>>.generate(
        5,
        (index) => ({
              'id': '$index',
              'title': 'Pregunta $index',
              'description':
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              'isSelected': false,
            }));
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Ayuda',
        backgroundColor: ColorConstant.gray50,
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          // Questions Menu
          CustomCard(
              margin: getMargin(top: 24, right: 16, left: 16, bottom: 24),
              child: ListCollapseItem(
                items: questions,
                onSelectedItem: _handleSelectedItem,
              )),
        ]),
      ),
    );
  }

  void _handleSelectedItem(dynamic item) {}
}
