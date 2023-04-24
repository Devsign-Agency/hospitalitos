import 'package:flutter/material.dart';
import 'package:mobile_app/core/app_export.dart';
import 'package:mobile_app/features/security/screens/screens.dart';
import 'package:mobile_app/features/security/widgets/widgets.dart';
import 'package:mobile_app/widgets/custom_button.dart';
import 'package:mobile_app/widgets/widgets.dart';

class RegisterScreenPreferences extends StatelessWidget {
  static const String route = 'register_03';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            backgroundColor: ColorConstant.gray100,
            resizeToAvoidBottomInset: false,
            body: SecurityScreen(
                title: 'Cuéntanos de ti',
                subTitle:
                    'Elige temas que te interesen para una experiencia a tu medida',
                header: _Header(),
                child: _Form())));
  }
}

class _Header extends StatelessWidget {
  VoidCallback? onSkeep;

  _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomImageView(
              svgPath: ImageConstant.imgArrowleft,
              color: ColorConstant.whiteA700,
              height: getSize(24),
              width: getSize(24),
              blendMode: BlendMode.srcIn,
              onTap: () => Navigator.pop(context)),
          TextButton(
              onPressed: onSkeep,
              child: Text(
                'Saltar',
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtNunitoSansSemiBold16WhiteA700
                    .copyWith(color: ColorConstant.whiteA700),
              ))
        ],
      ),
    );
  }
}

class _Form extends StatefulWidget {
  _Form();

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomStepper(
          range: 3,
          step: 3,
        ),
        Padding(
            padding: getPadding(top: 32),
            child: Wrap(
                runSpacing: getVerticalSize(5),
                spacing: getHorizontalSize(5),
                children: List<Widget>.generate(
                    24, (index) => ChipviewinputchipItemWidget()))),
        CustomButton(
            height: getVerticalSize(48),
            text: 'Continuar',
            margin: getMargin(top: 60),
            onTap: true
                ? null
                : () => Navigator.pushNamed(context, PreRegisterScreen.route)),
      ],
    );
  }
}
