import 'package:flutter/material.dart';
import 'package:mobile_app/features/profile/screens/screens.dart';

import '../../../../core/app_export.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/widgets.dart';

class ProfileMenuScreen extends StatelessWidget {
  static const String route = 'profile';
  const ProfileMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void displayDialogAndroid(BuildContext context) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: ColorConstant.gray50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28)),
              elevation: 5,
              title: Text('¿Seguro que quieres cerrar sesión?',
                  style: AppStyle.txtNunitoSansSemiBold23),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 10),
                  Text(
                      'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.',
                      style: AppStyle.txtNunitoSansRegular16Gray900)
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancelar',
                        style: AppStyle.txtNunitoSansSemiBold16)),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Aceptar',
                        style: AppStyle.txtNunitoSansSemiBold16)),
              ],
            );
          });
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Perfil',
        backgroundColor: ColorConstant.gray50,
      ),
      body: Column(children: [
        SizedBox(height: 32),

        // Avatar
        _CustomCircleAvatar(),

        SizedBox(height: 32),

        // Menu options
        _Menu(),

        Spacer(),

        // Footer
        Padding(
          padding: getPadding(left: 16, right: 16, bottom: 26),
          child: CustomButton(
              height: getVerticalSize(48),
              text: 'Cerra Sesión',
              margin: getMargin(top: 60),
              fontStyle: ButtonFontStyle.NunitoSansSemiBold16WhiteA700,
              variant: ButtonVariant.FillRed200,
              onTap: () => displayDialogAndroid(context)),
        ),
      ]),
    );
  }
}

class _Menu extends StatelessWidget {
  const _Menu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuOptions = [
      {
        'name': 'Datos',
        'icon': ImageConstant.imgUserGray800,
        'route': EditProfileScreen.route,
      },
      {
        'name': 'Intereses',
        'icon': ImageConstant.imgFavorite,
        'route': InterestScreen.route,
      },
      {
        'name': 'Ayuda',
        'icon': ImageConstant.imgQuestion,
        'route': HelpScreen.route,
      },
    ];
    return Container(
      padding: getPadding(left: 16, right: 16),
      width: double.infinity,
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (_, int index) {
            final option = menuOptions[index];

            return CustomCard(
              margin: getMargin(top: 0),
              child: Row(
                children: [
                  CustomImageView(
                    width: 24,
                    height: 24,
                    color: ColorConstant.whiteA700,
                    svgPath: option['icon'],
                  ),
                  SizedBox(width: 12),
                  Text('${option['name']}',
                      style: AppStyle.txtNunitoSansSemiBold20Black900)
                ],
              ),
              onTapped: () => Navigator.of(context).pushNamed(option['route']),
            );
          },
          separatorBuilder: (_, __) => SizedBox(height: 8),
          itemCount: menuOptions.length),
    );
  }
}

class _CustomCircleAvatar extends StatelessWidget {
  const _CustomCircleAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 80,
          backgroundColor: ColorConstant.deepPurple5001,
          backgroundImage: AssetImage('assets/images/img_image11.png'),
        ),
        SizedBox(height: 24),
        Text('José Frías', style: AppStyle.txtNunitoSansSemiBold23)
      ],
    );
  }
}
