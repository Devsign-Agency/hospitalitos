// ignore_for_file: constant_identifier_names

import 'package:mobile_app/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton(
      {this.shape,
      this.padding,
      this.variant,
      this.alignment,
      this.margin,
      this.width,
      this.height,
      this.child,
      this.onTap});

  final IconButtonShape? shape;
  final IconButtonPadding? padding;
  final IconButtonVariant? variant;
  final Alignment? alignment;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final Widget? child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildIconButtonWidget(),
          )
        : _buildIconButtonWidget();
  }

  _buildIconButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: IconButton(
        iconSize: getSize(height ?? 0),
        padding: EdgeInsets.all(0),
        icon: Container(
          alignment: Alignment.center,
          width: getSize(width ?? 0),
          height: getSize(height ?? 0),
          padding: _setPadding(),
          decoration: _buildDecoration(),
          child: child,
        ),
        onPressed: onTap,
      ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      color: _setColor(),
      borderRadius: _setBorderRadius(),
      boxShadow: _setBoxShadow(),
    );
  }

  _setPadding() {
    switch (padding) {
      case IconButtonPadding.PaddingAll14:
        return getPadding(
          all: 14,
        );
      default:
        return getPadding(
          all: 10,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case IconButtonVariant.NoFill:
        return ColorConstant.transparent;
      case IconButtonVariant.FillGray300:
        return ColorConstant.gray300;
      case IconButtonVariant.FillGray400:
        return ColorConstant.gray400;
      case IconButtonVariant.FillWhiteA700:
        return ColorConstant.whiteA700;
      case IconButtonVariant.FillRed50033:
        return ColorConstant.red50033;
      case IconButtonVariant.OutlineBlack9004c:
        return ColorConstant.deepPurple50;
      case IconButtonVariant.FillIndigo90033:
        return ColorConstant.indigo90033;
      case IconButtonVariant.FillDeeppurple5002:
        return ColorConstant.deepPurple5002;
      default:
        return ColorConstant.amber300;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case IconButtonShape.CircleBorder24:
        return BorderRadius.circular(
          getHorizontalSize(
            24.00,
          ),
        );
      case IconButtonShape.CircleBorder28:
        return BorderRadius.circular(
          getHorizontalSize(
            28.00,
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

  _setBoxShadow() {
    switch (variant) {
      case IconButtonVariant.OutlineBlack9004c:
        return [
          BoxShadow(
            color: ColorConstant.black9004c,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              1,
            ),
          )
        ];
      case IconButtonVariant.FillAmber300:
      case IconButtonVariant.FillGray300:
      case IconButtonVariant.FillGray400:
      case IconButtonVariant.FillWhiteA700:
      case IconButtonVariant.FillRed50033:
      case IconButtonVariant.FillIndigo90033:
      case IconButtonVariant.FillDeeppurple5002:
        return null;
      default:
        return null;
    }
  }
}

enum IconButtonShape {
  RoundedBorder12,
  CircleBorder24,
  CircleBorder28,
}
enum IconButtonPadding {
  PaddingAll10,
  PaddingAll14,
}
enum IconButtonVariant {
  NoFill,
  FillAmber300,
  FillGray300,
  FillGray400,
  FillWhiteA700,
  FillRed50033,
  OutlineBlack9004c,
  FillIndigo90033,
  FillDeeppurple5002,
}
