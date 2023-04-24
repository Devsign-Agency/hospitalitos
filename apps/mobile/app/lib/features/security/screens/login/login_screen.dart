import 'package:flutter/material.dart';
import 'package:mobile_app/core/app_export.dart';
import 'package:mobile_app/features/main/router/main.router.dart';
import 'package:mobile_app/features/security/widgets/security_screen.dart';
import 'package:mobile_app/helpers/show_alert.dart';
import 'package:mobile_app/shared/shared.dart';
import 'package:mobile_app/widgets/custom_button.dart';
import 'package:mobile_app/widgets/custom_image_view.dart';
import 'package:mobile_app/widgets/custom_text_form_field.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:provider/provider.dart';

import '../register/register.dart';

class LoginScreen extends StatelessWidget {
  static const String route = 'login';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            backgroundColor: ColorConstant.gray100,
            resizeToAvoidBottomInset: false,
            body: SecurityScreen(
                title: '¡Te damos la bienvenida!',
                subTitle:
                    'Acá podrás encontrar un espacio para conectar con tu fé.',
                header: _Header(),
                child: _Form())));
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
    final authService = Provider.of<AuthService>(context);

    return Column(
      children: [
        Padding(
            padding: getPadding(top: 37),
            child: Text('Iniciar sesión rápido con:',
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtNunitoSansRegular14Gray9001
                    .copyWith(letterSpacing: getHorizontalSize(0.25)))),
        Container(
            margin: getMargin(left: 89, top: 17, right: 89),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(getHorizontalSize(12))),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomImageView(
                      svgPath: ImageConstant.imgGoogle,
                      color: ColorConstant.transparent,
                      height: getSize(32),
                      width: getSize(32),
                      onTap: () {
                        onTapImgGoogle(context);
                      }),
                  CustomImageView(
                      svgPath: ImageConstant.imgFacebook,
                      height: getSize(32),
                      width: getSize(32),
                      margin: getMargin(left: 56),
                      onTap: () {
                        onTapImgFacebook(context);
                      })
                ])),
        _SecurityFormField(
          focusNode: FocusNode(),
          margin: getMargin(top: 32),
          controller: usernameController,
          svgPath: ImageConstant.imgUser,
          placeHolder: 'Usuario',
        ),
        _SecurityFormField(
          controller: passwordController,
          isObscureText: true,
          svgPath: ImageConstant.imgLock,
          placeHolder: 'Contraseña',
        ),
        Align(
            alignment: Alignment.centerRight,
            child: Padding(
                padding: getPadding(top: 13, right: 1),
                child: Text('¿Olvidaste la contraseña?',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtNunitoSansSemiBold16Indigo900))),
        CustomButton(
            height: getVerticalSize(48),
            text: 'Iniciar Sesión',
            margin: getMargin(top: 60),
            onTap: authService.authenticating ? null : () => login(context)),
        Padding(
            padding: getPadding(top: 21),
            child: TextButton(
              onPressed: () => Navigator.pushNamed(context, PreRegisterScreen.route),
              child: Text('O regístrate acá',
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

  login(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final username = usernameController.text;
    final password = passwordController.text;
    final authService = Provider.of<AuthService>(context, listen: false);
    final loginOk = await authService.login(username, password);
    if (loginOk) {
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, RouterMain.initialRoute);
      }
    } else {
      // Mostrar alerta
      if (context.mounted) showAlert(context, 'Error', 'Invalid credentials');
    }
  }

  onTapImgGoogle(BuildContext context) async {
    var url = 'https://accounts.google.com/';
    // if (!await launch(url)) {
    //   throw 'Could not launch https://accounts.google.com/';
    // }
  }

  onTapImgFacebook(BuildContext context) async {
    var url = 'https://www.facebook.com/login/';
    // if (!await launch(url)) {
    //   throw 'Could not launch https://www.facebook.com/login/';
    // }
  }
}

class _SecurityFormField extends StatelessWidget {
  final TextEditingController controller;
  final String placeHolder;
  final bool isObscureText;
  final String? svgPath;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? margin;

  _SecurityFormField(
      {required this.controller,
      this.svgPath,
      this.focusNode,
      this.placeHolder = '',
      this.isObscureText = false,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
        focusNode: focusNode,
        controller: controller,
        hintText: placeHolder,
        margin: margin ?? getMargin(top: 16),
        variant: TextFormFieldVariant.OutlineGray500,
        textInputType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
        isObscureText: isObscureText,
        prefix: svgPath == null
            ? null
            : Container(
                margin: getMargin(left: 12, top: 16, right: 12, bottom: 16),
                child: CustomImageView(
                    svgPath: svgPath, color: ColorConstant.gray600)),
        prefixConstraints: BoxConstraints(maxHeight: getVerticalSize(56)));
  }
}
