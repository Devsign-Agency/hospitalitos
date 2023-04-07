import 'package:flutter/material.dart';
import 'package:mobile_app/core/app_export.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.margin,
      this.onTap,
      this.width,
      this.height,
      this.text,
      this.prefixWidget,
      this.suffixWidget});

  final ButtonShape? shape;
  final ButtonPadding? padding;
  final ButtonVariant? variant;
  final ButtonFontStyle? fontStyle;
  final Alignment? alignment;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final String? text;
  final Widget? prefixWidget;
  final Widget? suffixWidget;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: TextButton(
        onPressed: onTap,
        style: _buildTextButtonStyle(),
        child: _buildButtonChildWidget(),
      ),
    );
  }

  _buildButtonChildWidget() {
    if (checkGradient()) {
      return Container(
        width: width ?? double.maxFinite,
        padding: _setPadding(),
        decoration: _buildDecoration(),
        child: _buildButtonWithOrWithoutIcon(),
      );
    } else {
      return _buildButtonWithOrWithoutIcon();
    }
  }

  _buildButtonWithOrWithoutIcon() {
    if (prefixWidget != null || suffixWidget != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixWidget ?? SizedBox(),
          Text(
            text ?? "",
            textAlign: TextAlign.center,
            style: _setFontStyle(),
          ),
          suffixWidget ?? SizedBox(),
        ],
      );
    } else {
      return Text(
        text ?? "",
        textAlign: TextAlign.center,
        style: _setFontStyle(),
      );
    }
  }

  _buildDecoration() {
    return BoxDecoration(
      border: _setBorder(),
      borderRadius: _setBorderRadius(),
      gradient: _setGradient(),
      boxShadow: _setBoxShadow(),
    );
  }

  _buildTextButtonStyle() {
    if (checkGradient()) {
      return TextButton.styleFrom(
        padding: EdgeInsets.zero,
      );
    } else {
      return TextButton.styleFrom(
        fixedSize: Size(
          width ?? double.maxFinite,
          height ?? getVerticalSize(40),
        ),
        padding: _setPadding(),
        backgroundColor: _setColor(),
        side: _setTextButtonBorder(),
        shadowColor: _setTextButtonShadowColor(),
        shape: RoundedRectangleBorder(
          borderRadius: _setBorderRadius(),
        ),
      );
    }
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingAll6:
        return getPadding(
          all: 6,
        );
      case ButtonPadding.PaddingAll9:
        return getPadding(
          all: 9,
        );
      case ButtonPadding.PaddingT5:
        return getPadding(
          top: 5,
          right: 5,
          bottom: 5,
        );
      default:
        return getPadding(
          all: 13,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.OutlineBluegray90014_1:
        return ColorConstant.gray300;
      case ButtonVariant.OutlineBluegray90014_2:
        return ColorConstant.red500;
      case ButtonVariant.FillAmber300:
        return ColorConstant.amber300;
      case ButtonVariant.OutlineIndigo900:
        return ColorConstant.whiteA700;
      case ButtonVariant.OutlineGray300:
        return ColorConstant.whiteA700;
      case ButtonVariant.FillIndigo900:
        return ColorConstant.indigo900;
      case ButtonVariant.Outline:
        return null;
      default:
        return ColorConstant.amber300;
    }
  }

  _setTextButtonBorder() {
    switch (variant) {
      case ButtonVariant.OutlineIndigo900:
        return BorderSide(
          color: ColorConstant.indigo900,
          width: getHorizontalSize(
            2.00,
          ),
        );
      case ButtonVariant.OutlineGray300:
        return BorderSide(
          color: ColorConstant.gray300,
          width: getHorizontalSize(
            1.00,
          ),
        );
      default:
        return null;
    }
  }

  _setTextButtonShadowColor() {
    switch (variant) {
      case ButtonVariant.OutlineBluegray90014_1:
        return ColorConstant.blueGray90014;
      case ButtonVariant.OutlineBluegray90014_2:
        return ColorConstant.blueGray90014;
      case ButtonVariant.Outline:
      case ButtonVariant.FillAmber300:
      case ButtonVariant.OutlineIndigo900:
      case ButtonVariant.OutlineGray300:
      case ButtonVariant.FillIndigo900:
        return null;
      default:
        return ColorConstant.blueGray90014;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.RoundedBorder8:
        return BorderRadius.circular(
          getHorizontalSize(
            8.00,
          ),
        );
      case ButtonShape.CircleBorder18:
        return BorderRadius.circular(
          getHorizontalSize(
            18.00,
          ),
        );
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            12.00,
          ),
        );
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.NunitoSansSemiBold20:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            20,
          ),
          fontFamily: 'Nunito Sans',
          fontWeight: FontWeight.w600,
          height: getVerticalSize(
            1.40,
          ),
        );
      case ButtonFontStyle.NunitoSansSemiBold16Gray700:
        return TextStyle(
          color: ColorConstant.gray800,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Nunito Sans',
          fontWeight: FontWeight.w600,
          height: getVerticalSize(
            1.38,
          ),
        );
      case ButtonFontStyle.NunitoSansRegular14:
        return TextStyle(
          color: ColorConstant.indigo900,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Nunito Sans',
          fontWeight: FontWeight.w400,
          height: getVerticalSize(
            1.43,
          ),
        );
      case ButtonFontStyle.NunitoSansSemiBold16WhiteA700:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Nunito Sans',
          fontWeight: FontWeight.w600,
          height: getVerticalSize(
            1.38,
          ),
        );
      default:
        return TextStyle(
          color: ColorConstant.indigo900,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Nunito Sans',
          fontWeight: FontWeight.w600,
          height: getVerticalSize(
            1.38,
          ),
        );
    }
  }

  _setBorder() {
    switch (variant) {
      case ButtonVariant.OutlineIndigo900:
        return Border.all(
          color: ColorConstant.indigo900,
          width: getHorizontalSize(
            2.00,
          ),
        );
      case ButtonVariant.OutlineGray300:
        return Border.all(
          color: ColorConstant.gray300,
          width: getHorizontalSize(
            1.00,
          ),
        );
      default:
        return null;
    }
  }

  checkGradient() {
    switch (variant) {
      case ButtonVariant.Outline:
        return true;
      default:
        return false;
    }
  }

  _setGradient() {
    switch (variant) {
      case ButtonVariant.Outline:
        return LinearGradient(
          begin: Alignment(
            1.02,
            1,
          ),
          end: Alignment(
            0,
            -0.15,
          ),
          colors: [
            ColorConstant.gray10075,
            ColorConstant.gray10002,
            ColorConstant.gray10002,
          ],
        );
      default:
        return null;
    }
  }

  _setBoxShadow() {
    switch (variant) {
      case ButtonVariant.OutlineBluegray90014_1:
        return [
          BoxShadow(
            color: ColorConstant.blueGray90014,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              12,
            ),
          )
        ];
      case ButtonVariant.OutlineBluegray90014_2:
        return [
          BoxShadow(
            color: ColorConstant.blueGray90014,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              12,
            ),
          )
        ];
      case ButtonVariant.Outline:
      case ButtonVariant.FillAmber300:
      case ButtonVariant.OutlineIndigo900:
      case ButtonVariant.OutlineGray300:
      case ButtonVariant.FillIndigo900:
        return null;
      default:
        return [
          BoxShadow(
            color: ColorConstant.blueGray90014,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              12,
            ),
          )
        ];
    }
  }
}

enum ButtonShape {
  Square,
  RoundedBorder12,
  RoundedBorder8,
  CircleBorder18,
}
enum ButtonPadding {
  PaddingAll13,
  PaddingAll6,
  PaddingAll9,
  PaddingT5,
}
enum ButtonVariant {
  OutlineBluegray90014,
  Outline,
  OutlineBluegray90014_1,
  OutlineBluegray90014_2,
  FillAmber300,
  OutlineIndigo900,
  OutlineGray300,
  FillIndigo900,
}
enum ButtonFontStyle {
  NunitoSansSemiBold16,
  NunitoSansSemiBold20,
  NunitoSansSemiBold16Gray700,
  NunitoSansRegular14,
  NunitoSansSemiBold16WhiteA700,
}
