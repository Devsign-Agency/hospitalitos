import 'package:flutter/material.dart';

import '../../../../core/app_export.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text_form_field.dart';
import '../../../../widgets/widgets.dart';

class EditProfileScreen extends StatefulWidget {
  static const String route = 'edit-profile';
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool _isEditing = false;

  void _handleChangeMode() {
    _isEditing = !_isEditing;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          // AppBar
          _CustomAppBar(isEditing: _isEditing, onChangeMode: _handleChangeMode),

          SizedBox(height: 24),

          Padding(
            padding: getPadding(left: 16, right: 16),
            child: _Form(isEditing: !_isEditing),
          )
        ]),
      )),
    );
  }
}

class _Form extends StatefulWidget {
  final bool isEditing;
  const _Form({
    super.key,
    required this.isEditing,
  });

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    usernameController.text = 'juanita@email.com';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Cuenta
        Text('Cuenta', style: AppStyle.txtNunitoSansSemiBold23),

        _EditProfileFormField(
          enabled: !widget.isEditing,
          focusNode: FocusNode(),
          controller: usernameController,
          svgPath: ImageConstant.imgUser,
          placeHolder: 'Usuario',
        ),
        _EditProfileFormField(
          enabled: !widget.isEditing,
          focusNode: FocusNode(),
          isObscureText: true,
          margin: getMargin(top: 8),
          controller: usernameController,
          svgPath: ImageConstant.imgLock,
          placeHolder: 'Contraseña',
        ),

        SizedBox(height: 22),

        // Información Adicional
        Text('Información Adicional', style: AppStyle.txtNunitoSansSemiBold23),

        _EditProfileFormField(
          enabled: widget.isEditing,
          focusNode: FocusNode(),
          controller: usernameController,
          svgPath: ImageConstant.imgUser,
          placeHolder: 'Usuario',
        ),
        _EditProfileFormField(
          enabled: !widget.isEditing,
          focusNode: FocusNode(),
          isObscureText: true,
          margin: getMargin(top: 8),
          controller: usernameController,
          svgPath: ImageConstant.imgLock,
          placeHolder: 'Contraseña',
        ),
        CustomButton(
            height: getVerticalSize(48),
            text: 'Confirmar',
            margin: getMargin(top: 60),
            onTap: () {}),
      ],
    );
  }
}

class _EditProfileFormField extends StatelessWidget {
  final TextEditingController controller;
  final String placeHolder;
  final bool isObscureText;
  final String? svgPath;
  final bool? enabled;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? margin;

  _EditProfileFormField(
      {required this.controller,
      this.svgPath,
      this.enabled,
      this.focusNode,
      this.placeHolder = '',
      this.isObscureText = false,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
        enabled: enabled,
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

class _CustomAppBar extends StatelessWidget {
  final onChangeMode;
  final bool isEditing;

  const _CustomAppBar({
    super.key,
    required this.onChangeMode,
    required this.isEditing,
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
              svgPath: !isEditing
                  ? ImageConstant.imgArrowleftGray800
                  : ImageConstant.imgCloseGray24x24,
            ),
            onTap: () {
              isEditing ? onChangeMode() : Navigator.of(context).pop();
            },
          ),
          Expanded(
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(!isEditing ? 'Datos' : 'Editar',
                    style: AppStyle.txtNunitoSansSemiBold26)),
          ),
          if (!isEditing)
            CustomIconButton(
              height: getSize(48),
              width: getSize(48),
              variant: IconButtonVariant.FillGray300,
              child: CustomImageView(
                color: ColorConstant.gray800,
                svgPath: ImageConstant.imgEdit,
              ),
              onTap: () => onChangeMode(),
            ),
        ],
      ),
    );
  }
}
