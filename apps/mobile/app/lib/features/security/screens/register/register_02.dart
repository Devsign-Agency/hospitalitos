import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobile_app/core/app_export.dart';
import 'package:mobile_app/features/security/screens/screens.dart';
import 'package:mobile_app/features/security/widgets/widgets.dart';
import 'package:mobile_app/widgets/custom_button.dart';
import 'package:mobile_app/widgets/widgets.dart';

class RegisterScreenSecurity extends StatelessWidget {
  static const String route = 'register_02';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            backgroundColor: ColorConstant.gray100,
            resizeToAvoidBottomInset: false,
            body: SecurityScreen(
                title: 'La seguridad primero',
                subTitle: 'Configura tu contraseña para continuar',
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

class _Form extends StatefulWidget {
  _Form();

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  bool valid = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomStepper(
            range: 3,
            step: 2,
          ),
          SecurityFormField(
            onChanged: (_) => _validatePassword(),
            margin: getMargin(top: 32),
            controller: passwordController,
            svgPath: ImageConstant.imgLock,
            textInputType: TextInputType.visiblePassword,
            isObscureText: true,
            placeHolder: 'Contraseña',
            validator: validatePassword
          ),
          SecurityFormField(
            onChanged: (_) => _validatePassword(),
            controller: confirmController,
            svgPath: ImageConstant.imgLock,
            isObscureText: true,
            placeHolder: 'Confirmar contraseña',
            validator: validateConfirm
          ),
          CustomButton(
              height: getVerticalSize(48),
              text: 'Continuar',
              margin: getMargin(top: 60),
              onTap: valid ? submit : null
          ),
        ],
      ),
    );
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      final storage = FlutterSecureStorage();
      final password = passwordController.text;
      storage.write(key: 'password', value: password);
      Navigator.pushNamed(context, RegisterScreenPreferences.route);
    }
  }

  String? validateConfirm(value) {
            if (value == null || value.isEmpty) {
              return 'El campo Confirmar contraseña es obligatorio';
            } else if (value != passwordController.text) {
              return 'La contraseña no coincide';
            }
            return null;
          }

  String? validatePassword(value) {
            if (value == null || value.isEmpty) {
              return 'El campo contraseña es obligatorio';
            }
            return null;
          }

  void _validatePassword() {
    final password = passwordController.text;
    final confirm = confirmController.text;

    bool prevValue = valid;
    valid = password == confirm && password.isNotEmpty && confirm.isNotEmpty;

    if (prevValue != valid) {
      setState(() {});
    }
  }
}
