import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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

class _Form extends StatefulWidget {
  _Form();

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
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
            step: 1,
          ),
          SecurityFormField(
            onChanged: validate,
            margin: getMargin(top: 32),
            controller: nameController,
            svgPath: ImageConstant.imgUser,
            placeHolder: 'Nombre y Apellido',
            validator: validateName,
          ),
          SecurityFormField(
            onChanged: validate,
            controller: emailController,
            svgPath: ImageConstant.imgMailGray900,
            textInputType: TextInputType.emailAddress,
            placeHolder: 'Correo electrónico',
            validator: _validateEmail,
          ),
          CustomButton(
              height: getVerticalSize(48),
              text: 'Continuar',
              margin: getMargin(top: 60),
              onTap: valid ? submit : null,
          )
        ],
      ),
    );
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      final storage = FlutterSecureStorage();
      final name = nameController.text;
      final email = emailController.text;
      storage.write(key: 'name', value: name);
      storage.write(key: 'email', value: email);
      
      Navigator.pushNamed(context, RegisterScreenSecurity.route);
    }
  }

  String? validateName(value) {
    if (value == null || value.isEmpty) {
      return 'El campo Nombre y Apellido es obligatorio';
    }
    return null;
  }

  String? _validateEmail(value) {
    final RegExp regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value == null || value.isEmpty) {
      return 'El campo Correo electrónico es obligatorio';
    } else if (!regExp.hasMatch(value)) {
      return 'El campo no es una dirección de correo válida';
    }
    return null;
  }

  validate(value) {
    final name = nameController.text;
    final email = emailController.text;

    bool prevValue = valid;
    valid = name.isNotEmpty && _validateEmail(email) == null;
    if (prevValue != valid) {
      setState(() {});
    }
  }
}
