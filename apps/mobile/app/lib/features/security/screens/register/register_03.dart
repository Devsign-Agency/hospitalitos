import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobile_app/core/app_export.dart';
import 'package:mobile_app/features/main/router/main.router.dart';
import 'package:mobile_app/features/security/widgets/widgets.dart';
import 'package:mobile_app/helpers/show_alert.dart';
import 'package:mobile_app/shared/shared.dart';
import 'package:mobile_app/widgets/custom_button.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

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
                header: _Header(onSkip: () {}),
                child: _Form())));
  }
}

class _Header extends StatelessWidget {
  final VoidCallback? onSkip;

  _Header({this.onSkip});

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
              onPressed: onSkip,
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
  final List<String> preferences = [];

  _Form();

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  late List<Category> categories = [];
  int maxQty = 0;

  @override
  initState() {
    _findCategories();
    super.initState();
  }

  @override
  void dispose() {
    categories.clear();
    super.dispose();
  }

  _findCategories() async {
    final categoryService =
        Provider.of<CategoryService>(context, listen: false);
    categories = await categoryService.getAll();
    maxQty = min(3, categories.length);
    setState(() {});
  }

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
                    categories.length,
                    (index) => ChipviewinputchipItemWidget(
                        text: categories[index].name,
                        onSelected: (value) {
                          if (value) {
                            widget.preferences.add(categories[index].id);
                          } else {
                            widget.preferences.remove(categories[index].id);
                          }
                          setState(() {});
                        },
                        selected: widget.preferences
                            .contains(categories[index].id))))),
        CustomButton(
            height: getVerticalSize(48),
            text: '${widget.preferences.length}/$maxQty Continuar',
            margin: getMargin(top: 60),
            onTap: widget.preferences.length != maxQty ? null : submit
        )
      ],
    );
  }

  void submit({bool skipPreferences = false}) async {
    final authService = Provider.of<AuthService>(context, listen: false);
    final storage = FlutterSecureStorage();
    final String? name = await storage.read(key: 'name');
    final String? email = await storage.read(key: 'email');
    final String? password = await storage.read(key: 'password');
    final List<String> preferences = [];

    if (widget.preferences.length == maxQty && !skipPreferences) {
      preferences.addAll(widget.preferences);
    }

    bool isValid = await authService.register(name!, email!, password!, preferences);
    if (isValid) {
      await storage.delete(key: 'name');
      await storage.delete(key: 'email');
      await storage.delete(key: 'password');
      preferences.clear();
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, RouterMain.initialRoute);
      }
    } else {
      // Mostrar alerta
      if (context.mounted) showAlert(context, 'Error', 'Error on register');
    }
  }
}
