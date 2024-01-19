import 'package:mobile_app/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {this.tkey,
      this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.width,
      this.margin,
      this.controller,
      this.enabled,
      this.focusNode,
      this.isObscureText = false,
      this.textInputAction = TextInputAction.next,
      this.textInputType = TextInputType.text,
      this.maxLines,
      this.hintText,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.suffixConstraints,
      this.validator,
      this.onChanged});

  Key? tkey;

  TextFormFieldShape? shape;

  TextFormFieldPadding? padding;

  TextFormFieldVariant? variant;

  TextFormFieldFontStyle? fontStyle;

  Alignment? alignment;

  double? width;

  EdgeInsetsGeometry? margin;

  TextEditingController? controller;

  bool? enabled;

  FocusNode? focusNode;

  bool? isObscureText;

  TextInputAction? textInputAction;

  TextInputType? textInputType;

  int? maxLines;

  String? hintText;

  Widget? prefix;

  BoxConstraints? prefixConstraints;

  Widget? suffix;

  BoxConstraints? suffixConstraints;

  FormFieldValidator<String>? validator;

  ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildTextFormFieldWidget(),
          )
        : _buildTextFormFieldWidget();
  }

  _buildTextFormFieldWidget() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(24, 39, 75, 0.08),
            blurRadius: 42,
            spreadRadius: -4.0,
            offset: const Offset(0, 12),
          ),
          BoxShadow(
            color: Color.fromRGBO(24, 39, 75, 0.08),
            blurRadius: 18,
            spreadRadius: -6.0,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      width: width ?? double.maxFinite,
      margin: margin,
      child: TextFormField(
        key: tkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: onChanged,
        controller: controller,
        focusNode: focusNode,
        enabled: enabled ?? true,
        style: _setFontStyle(),
        obscureText: isObscureText!,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        maxLines: maxLines ?? 1,
        decoration: _buildDecoration(),
        validator: validator,
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: hintText ?? '',
      hintStyle: _setFontStyle(),
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(),
      focusedBorder: _setBorderStyle(),
      disabledBorder: _setBorderStyle(),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
      fillColor: _setFillColor(),
      filled: _setFilled(),
      isDense: true,
      contentPadding: _setPadding(),
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      case TextFormFieldFontStyle.NunitoSansRegular18Red500:
        return TextStyle(
          color: ColorConstant.red500,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'Nunito Sans',
          fontWeight: FontWeight.w400,
          height: getVerticalSize(
            1.39,
          ),
        );
      case TextFormFieldFontStyle.NunitoSansSemiBold20:
        return TextStyle(
          color: ColorConstant.gray900,
          fontSize: getFontSize(
            20,
          ),
          fontFamily: 'Nunito Sans',
          fontWeight: FontWeight.w600,
          height: getVerticalSize(
            1.40,
          ),
        );
      case TextFormFieldFontStyle.RobotoRegular14:
        return TextStyle(
          color: ColorConstant.gray10001,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          height: getVerticalSize(
            1.21,
          ),
        );
      case TextFormFieldFontStyle.RobotoRegular14Bluegray900:
        return TextStyle(
          color: ColorConstant.blueGray900,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          height: getVerticalSize(
            1.21,
          ),
        );
      default:
        return TextStyle(
          color: ColorConstant.gray600,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'Nunito Sans',
          fontWeight: FontWeight.w400,
          height: getVerticalSize(
            1.39,
          ),
        );
    }
  }

  _setOutlineBorderRadius() {
    switch (shape) {
      case TextFormFieldShape.RoundedBorder4:
        return BorderRadius.circular(
          getHorizontalSize(
            4.00,
          ),
        );
      case TextFormFieldShape.RoundedBorder8:
        return BorderRadius.circular(
          getHorizontalSize(
            8.00,
          ),
        );
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            12.00,
          ),
        );
    }
  }

  _setBorderStyle() {
    switch (variant) {
      case TextFormFieldVariant.OutlineIndigo900:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.indigo900,
            width: 2,
          ),
        );
      case TextFormFieldVariant.OutlineRed500:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.red500,
            width: 2,
          ),
        );
      case TextFormFieldVariant.OutlineBluegray90014:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.OutlineBlack9004c:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.FillWhiteA700:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.OutlineBlack9004c_1:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.OutlineBlack9004c_2:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.OutlineGray300:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.gray300,
            width: 1,
          ),
        );
      case TextFormFieldVariant.None:
        return OutlineInputBorder(
            borderRadius: _setOutlineBorderRadius(),
            borderSide: BorderSide(
              color: ColorConstant.whiteA700,
              width: 1.0,
            ));
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.gray600,
            width: 2,
          ),
        );
    }
  }

  _setFillColor() {
    switch (variant) {
      case TextFormFieldVariant.OutlineIndigo900:
        return ColorConstant.whiteA700;
      case TextFormFieldVariant.OutlineRed500:
        return ColorConstant.whiteA700;
      case TextFormFieldVariant.OutlineBluegray90014:
        return ColorConstant.whiteA700;
      case TextFormFieldVariant.OutlineBlack9004c:
        return ColorConstant.blueGray900;
      case TextFormFieldVariant.FillWhiteA700:
        return ColorConstant.whiteA700;
      case TextFormFieldVariant.OutlineBlack9004c_1:
        return ColorConstant.gray30001;
      case TextFormFieldVariant.OutlineBlack9004c_2:
        return ColorConstant.gray900;
      default:
        return ColorConstant.whiteA700;
    }
  }

  _setFilled() {
    switch (variant) {
      case TextFormFieldVariant.OutlineIndigo900:
        return true;
      case TextFormFieldVariant.OutlineRed500:
        return true;
      case TextFormFieldVariant.OutlineBluegray90014:
        return true;
      case TextFormFieldVariant.OutlineBlack9004c:
        return true;
      case TextFormFieldVariant.FillWhiteA700:
        return true;
      case TextFormFieldVariant.OutlineBlack9004c_1:
        return true;
      case TextFormFieldVariant.OutlineBlack9004c_2:
        return true;
      case TextFormFieldVariant.OutlineGray300:
        return false;
      // case TextFormFieldVariant.None:
      //   return false;
      default:
        return true;
    }
  }

  _setPadding() {
    switch (padding) {
      case TextFormFieldPadding.PaddingT15_1:
        return getPadding(
          top: 15,
          bottom: 15,
        );
      case TextFormFieldPadding.PaddingAll15:
        return getPadding(
          all: 15,
        );
      case TextFormFieldPadding.PaddingT11:
        return getPadding(
          left: 8,
          top: 11,
          right: 8,
          bottom: 11,
        );
      case TextFormFieldPadding.PaddingT30:
        return getPadding(
          left: 16,
          top: 30,
          bottom: 30,
        );
      default:
        return getPadding(top: 15, right: 15, bottom: 15, left: 15);
    }
  }
}

enum TextFormFieldShape {
  RoundedBorder12,
  RoundedBorder4,
  RoundedBorder8,
}

enum TextFormFieldPadding {
  PaddingT15,
  PaddingT15_1,
  PaddingAll15,
  PaddingT11,
  PaddingT30,
}

enum TextFormFieldVariant {
  None,
  OutlineGray500,
  OutlineIndigo900,
  OutlineRed500,
  OutlineBluegray90014,
  OutlineBlack9004c,
  FillWhiteA700,
  OutlineBlack9004c_1,
  OutlineBlack9004c_2,
  OutlineGray300,
}

enum TextFormFieldFontStyle {
  NunitoSansRegular18,
  NunitoSansRegular18Red500,
  NunitoSansSemiBold20,
  RobotoRegular14,
  RobotoRegular14Bluegray900,
}

