import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile_app/core/app_export.dart';

import '../../../widgets/widgets.dart';

// ignore: must_be_immutable
class ChipviewinputchipItemWidget extends StatelessWidget {
  final String text;
  final ValueChanged<bool>? onSelected;
  final ValueChanged<bool>? onDeleted;
  final Widget? avatar;
  bool selected;
  bool hasDeleteIcon;

  ChipviewinputchipItemWidget(
      {this.onSelected,
      this.selected = false,
      this.hasDeleteIcon = false,
      this.onDeleted,
      this.avatar,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: getPadding(left: 12, right: 12),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        text,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: ColorConstant.gray800,
          fontSize: getFontSize(16),
          fontFamily: 'Nunito Sans',
          fontWeight: FontWeight.w600,
        ),
      ),
      avatar: avatar,
      deleteIcon: hasDeleteIcon
          ? CustomImageView(
              color: ColorConstant.black900,
              svgPath: ImageConstant.imgCloseGray24x24,
            )
          : null,
      onDeleted: hasDeleteIcon ? () => onDeleted : null,
      selected: selected,
      backgroundColor: ColorConstant.gray300,
      selectedColor: ColorConstant.amber300,
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(
          getHorizontalSize(16),
        ),
      ),
      side: BorderSide.none,
      isEnabled: true,
      onSelected: onSelected,
    );
  }
}
