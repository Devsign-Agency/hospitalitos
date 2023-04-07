import 'package:flutter/material.dart';
import 'package:mobile_app/core/app_export.dart';
import 'package:mobile_app/features/main/router/main.router.dart';
import 'package:mobile_app/helpers/show_alert.dart';
import 'package:mobile_app/shared/shared.dart';
import 'package:mobile_app/widgets/custom_button.dart';
import 'package:mobile_app/widgets/custom_image_view.dart';
import 'package:mobile_app/widgets/custom_text_form_field.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static const String route = 'login';

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            backgroundColor: ColorConstant.gray100,
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: ColorConstant.gray100,
                      image: DecorationImage(
                          image: AssetImage(ImageConstant.imgIniciodesesin),
                          fit: BoxFit.cover)),
                  child: Container(
                      width: double.maxFinite,
                      padding: getPadding(left: 16, right: 16),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
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
                                        colors: [
                                          ColorConstant.whiteA7007f,
                                          ColorConstant.whiteA70019
                                        ]),
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
                                        fontStyle: ButtonFontStyle
                                            .NunitoSansSemiBold20))),
                            SizedBox(
                                width: double.maxFinite,
                                child: Container(
                                    margin: getMargin(top: 16),
                                    padding: getPadding(
                                        left: 14, top: 6, right: 14, bottom: 6),
                                    decoration: AppDecoration
                                        .outlineBluegray90014
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .customBorderTL12),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding: getPadding(top: 18),
                                              child: Text(
                                                  '¡Te damos la bienvenida!',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtNunitoSansSemiBold20Gray900)),
                                          Padding(
                                              padding: getPadding(
                                                  left: 26, right: 27),
                                              child: Text(
                                                  'Acá podrás encontrar un espacio para conectar con tu fé.',
                                                  maxLines: null,
                                                  textAlign: TextAlign.center,
                                                  style: AppStyle
                                                      .txtNunitoSansRegular14Gray900
                                                      .copyWith(
                                                          letterSpacing:
                                                              getHorizontalSize(
                                                                  0.25)))),
                                          Padding(
                                              padding: getPadding(top: 37),
                                              child: Text(
                                                  'Iniciar sesión rápido con:',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtNunitoSansRegular14Gray9001
                                                      .copyWith(
                                                          letterSpacing:
                                                              getHorizontalSize(
                                                                  0.25)))),
                                          Container(
                                              margin: getMargin(
                                                  left: 89, top: 17, right: 89),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          getHorizontalSize(
                                                              12))),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgGoogle,
                                                        height: getSize(32),
                                                        width: getSize(32),
                                                        onTap: () {
                                                          onTapImgGoogle(
                                                              context);
                                                        }),
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgFacebook,
                                                        height: getSize(32),
                                                        width: getSize(32),
                                                        margin:
                                                            getMargin(left: 56),
                                                        onTap: () {
                                                          onTapImgFacebook(
                                                              context);
                                                        })
                                                  ])),
                                          CustomTextFormField(
                                              focusNode: FocusNode(),
                                              controller: usernameController,
                                              hintText: 'Usuario',
                                              margin: getMargin(top: 32),
                                              variant: TextFormFieldVariant
                                                  .OutlineIndigo900,
                                              prefix: Container(
                                                  margin: getMargin(
                                                      left: 12,
                                                      top: 16,
                                                      right: 12,
                                                      bottom: 16),
                                                  child: CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgUserIndigo900)),
                                              prefixConstraints: BoxConstraints(
                                                  maxHeight:
                                                      getVerticalSize(56))),
                                          CustomTextFormField(
                                              focusNode: FocusNode(),
                                              controller:
                                                  passwordController,
                                              hintText: 'Contraseña',
                                              margin: getMargin(top: 16),
                                              variant: TextFormFieldVariant
                                                  .OutlineIndigo900,
                                              textInputAction:
                                                  TextInputAction.done,
                                              prefix: Container(
                                                  margin: getMargin(
                                                      left: 12,
                                                      top: 16,
                                                      right: 12,
                                                      bottom: 16),
                                                  child: CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgLockIndigo900)),
                                              prefixConstraints: BoxConstraints(
                                                  maxHeight:
                                                      getVerticalSize(56))),
                                          Align(
                                              alignment: Alignment.centerRight,
                                              child: Padding(
                                                  padding: getPadding(
                                                      top: 13, right: 1),
                                                  child: Text(
                                                      '¿Olvidaste la contraseña?',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtNunitoSansSemiBold16Indigo900))),
                                          CustomButton(
                                              height: getVerticalSize(48),
                                              text: 'Iniciar Sesión',
                                              margin: getMargin(top: 60),
                                              onTap: authService.authenticating ? null : () => login(context)),
                                          Padding(
                                              padding: getPadding(top: 21),
                                              child: Text('O regístrate acá',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtNunitoSansSemiBold16Indigo900)),
                                          Container(
                                              width: getHorizontalSize(299),
                                              margin: getMargin(top: 40),
                                              child: RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                        text:
                                                            'Al registrarte aceptas los ',
                                                        style: TextStyle(
                                                            color: ColorConstant
                                                                .gray600,
                                                            fontSize:
                                                                getFontSize(12),
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400)),
                                                    TextSpan(
                                                        text: 'Términos de Uso',
                                                        style: TextStyle(
                                                            color: ColorConstant
                                                                .gray600,
                                                            fontSize:
                                                                getFontSize(12),
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                                    TextSpan(
                                                        text: ' y ',
                                                        style: TextStyle(
                                                            color: ColorConstant
                                                                .gray600,
                                                            fontSize:
                                                                getFontSize(12),
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400)),
                                                    TextSpan(
                                                        text:
                                                            'Política de Privacidad',
                                                        style: TextStyle(
                                                            color: ColorConstant
                                                                .gray600,
                                                            fontSize:
                                                                getFontSize(12),
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600))
                                                  ]),
                                                  textAlign: TextAlign.center)),
                                          Padding(
                                              padding: getPadding(top: 44),
                                              child: SizedBox(
                                                  width: getHorizontalSize(72),
                                                  child: Divider(
                                                      height:
                                                          getVerticalSize(2),
                                                      thickness:
                                                          getVerticalSize(2),
                                                      color: ColorConstant
                                                          .gray900)))
                                        ])))
                          ]))),
            )));
  }

  login(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final username = usernameController.text;
    final password = passwordController.text;
    final authService = Provider.of<AuthService>(context, listen: false);
    final loginOk = await authService.login(username, password);
    if (loginOk) {
        if (context.mounted) Navigator.pushReplacementNamed(context, RouterMain.initialRoute);
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
