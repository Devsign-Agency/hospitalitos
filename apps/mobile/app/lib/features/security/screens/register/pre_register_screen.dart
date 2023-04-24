import 'package:flutter/material.dart';
import 'package:mobile_app/core/app_export.dart';
import 'package:mobile_app/features/security/widgets/security_screen.dart';
import 'package:mobile_app/widgets/custom_button.dart';
import 'package:mobile_app/widgets/custom_image_view.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

import '../login/login_screen.dart';
import 'register_01.dart';

class PreRegisterScreen extends StatelessWidget {
  static const String route = 'preregister';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.red500,
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        body: SecurityScreen(
          title: '¡Te damos la bienvenida!',
          subTitle: 'Acá podrás encontrar un espacio para conectar con tu fé.',
          header: _Header(),
          child: _Form(),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: getPadding(top: 24),
        child: OutlineGradientButton(
            padding: EdgeInsets.only(
                left: getHorizontalSize(1),
                top: getVerticalSize(1),
                right: getHorizontalSize(1),
                bottom: getVerticalSize(1)),
            strokeWidth: getHorizontalSize(1),
            gradient: LinearGradient(
                begin: Alignment(0.03, -0.3),
                end: Alignment(1.01, 1.23),
                colors: [ColorConstant.whiteA7007f, ColorConstant.whiteA70019]),
            corners: Corners(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8)),
            child: CustomButton(
                text: 'Hospitalitos de la fe',
                margin: getMargin(top: 0),
                variant: ButtonVariant.Outline,
                shape: ButtonShape.RoundedBorder8,
                padding: ButtonPadding.PaddingAll6,
                fontStyle: ButtonFontStyle.NunitoSansSemiBold20)));
  }
}

class _Form extends StatelessWidget {
  _Form();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: getPadding(top: 37),
            child: Text('Registrate con:',
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtNunitoSansRegular14Gray9001
                    .copyWith(letterSpacing: getHorizontalSize(0.25)))),
        Container(
          width: double.infinity,
          margin: getMargin(
            top: 32,
          ),
          padding: getPadding(
            left: 12,
            top: 16,
            right: 12,
            bottom: 16,
          ),
          decoration: AppDecoration.outlineIndigo900.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                svgPath: ImageConstant.imgGoogle,
                height: getSize(24),
                width: getSize(24),
              ),
              Padding(
                padding: getPadding(left: 12),
                child: Text(
                  'Google',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtNunitoSansSemiBold16,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              minimumSize: Size(88, 36),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusStyle.txtRoundedBorder12,
              ),
              side: BorderSide(width: 2, color: Colors.black),
            ),
            onPressed: () =>
                Navigator.pushNamed(context, RegisterScreenUserdata.route),
            child: Center(
              child: Text(
                'Manualmente',
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtNunitoSansSemiBold16,
              ),
            ),
          ),
        ),
        Align(
            alignment: Alignment.centerRight,
            child: Padding(
                padding: getPadding(top: 13, right: 1), child: Text(''))),
        Padding(
            padding: getPadding(top: 21),
            child: TextButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, LoginScreen.route),
              child: Text('O Inicia sesión acá',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtNunitoSansSemiBold16Indigo900),
            )),
        Container(
            margin: getMargin(top: 40),
            child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text:
                          'Al registrarte aceptas los Términos de Uso y Política de Privacidad',
                      style: TextStyle(
                          color: ColorConstant.gray600,
                          fontSize: getFontSize(12),
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w600))
                ]),
                textAlign: TextAlign.center)),
      ],
    );
  }
}
