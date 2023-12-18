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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            // AppBar
            _CustomAppBar(),

            SizedBox(height: 24),

            // Questions Menu
            CustomCard(
                child: ListCollapseItem(
              items: questions,
              onSelectedItem: _handleSelectedItem,
            )),

            SizedBox(height: 24),
          ]),
        ),
      ),
    );
  }

  void _handleSelectedItem(dynamic item) {}
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
          left: 14.0, right: 14.0, top: 8.0, bottom: 24.0),
      child: Row(
        children: [
          CustomIconButton(
            height: getSize(48),
            width: getSize(48),
            variant: IconButtonVariant.NoFill,
            child: CustomImageView(
                color: ColorConstant.whiteA700,
                svgPath: ImageConstant.imgArrowleftGray800),
            onTap: () => Navigator.of(context).pop(),
          ),
          Expanded(
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Ayuda', style: AppStyle.txtNunitoSansSemiBold26)),
          ),
        ],
      ),
    );
  }
}
