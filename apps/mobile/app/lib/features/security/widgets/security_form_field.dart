import 'package:flutter/material.dart';
import 'package:mobile_app/core/app_export.dart';
import 'package:mobile_app/widgets/custom_text_form_field.dart';
import 'package:mobile_app/widgets/widgets.dart';

class SecurityFormField extends StatelessWidget {
  Key? tkey;
  final TextEditingController controller;
  final String placeHolder;
  final bool isObscureText;
  final String? svgPath;
  FocusNode? focusNode;
  final EdgeInsetsGeometry? margin;
  final TextInputType? textInputType;
  ValueChanged<String>? onChanged;
  FormFieldValidator<String>? validator;

  SecurityFormField(
      { super.key,
      this.tkey,
      required this.controller,
      this.svgPath,
      this.focusNode,
      this.placeHolder = '',
      this.isObscureText = false,
      this.textInputType = TextInputType.text,
      this.margin,
      this.onChanged,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
        tkey: tkey,
        focusNode: focusNode,
        controller: controller,
        hintText: placeHolder,
        margin: margin ?? getMargin(top: 16),
        variant: TextFormFieldVariant.OutlineGray500,
        textInputType: TextInputType.text,
        textInputAction: TextInputAction.done,
        isObscureText: isObscureText,
        validator: validator,
        onChanged: onChanged,
        prefix: svgPath == null
            ? null
            : Container(
                margin: getMargin(left: 12, top: 16, right: 12, bottom: 16),
                child: CustomImageView(
                    svgPath: svgPath, color: ColorConstant.gray600)),
        prefixConstraints: BoxConstraints(maxHeight: getVerticalSize(56)));
  }
}