import 'package:flutter/material.dart';
import 'package:mobile_app/core/app_export.dart';
import 'package:mobile_app/features/security/screens/screens.dart';
import 'package:mobile_app/features/security/widgets/widgets.dart';
import 'package:mobile_app/widgets/custom_button.dart';
import 'package:mobile_app/widgets/widgets.dart';

class RegisterScreenUserdata extends StatelessWidget {
  static const String route = 'register_01';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            backgroundColor: ColorConstant.gray100,
            resizeToAvoidBottomInset: false,
            body: SecurityScreen(
                title: 'Antes de empezar...',
                subTitle:
                    'Escribe tu nombre de usuario y tu correo electrónico',
                header: _Header(),
                child: _Form())));
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: getPadding(top: 0, left: 0),
        alignment: Alignment.centerLeft,
        child: CustomImageView(
            svgPath: ImageConstant.imgArrowleft,
            color: ColorConstant.whiteA700,
            height: getSize(24),
            width: getSize(24),
            margin: getMargin(top: 20),
            blendMode: BlendMode.srcIn,
            onTap: () => Navigator.pop(context)));
  }
}

class _Form extends StatelessWidget {
  _Form();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomStepper(
          range: 3,
          step: 1,
        ),
        SecurityFormField(
          focusNode: FocusNode(),
          margin: getMargin(top: 32),
          controller: nameController,
          svgPath: ImageConstant.imgUser,
          placeHolder: 'Nombre y Apellido',
        ),
        SecurityFormField(
          controller: emailController,
          svgPath: ImageConstant.imgMailGray900,
          textInputType: TextInputType.emailAddress,
          placeHolder: 'Correo electrónico',
        ),
        CustomButton(
            height: getVerticalSize(48),
            text: 'Continuar',
            margin: getMargin(top: 60),
            onTap: () =>
                Navigator.pushNamed(context, RegisterScreenSecurity.route)),
      ],
    );
  }
}
