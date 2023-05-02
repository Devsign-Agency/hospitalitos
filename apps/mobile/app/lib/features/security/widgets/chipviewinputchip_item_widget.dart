import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile_app/core/app_export.dart';

// ignore: must_be_immutable
class ChipviewinputchipItemWidget extends StatelessWidget {
  final String text;
  final ValueChanged<bool>? onSelected;
  bool selected;

  ChipviewinputchipItemWidget({
    this.onSelected,
    this.selected = false,
    required this.text
  });

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
      selected: selected,
      backgroundColor: ColorConstant.gray300,
      selectedColor: ColorConstant.amber300,
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(
          getHorizontalSize(16),
        ),
      ),
      isEnabled: true,
      onSelected: onSelected,
    );
  }
}
