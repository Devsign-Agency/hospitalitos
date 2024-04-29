import 'package:flutter/material.dart';

import '../core/app_export.dart';

class FttToast extends StatelessWidget {
  final String text;

  const FttToast({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: validLongText(text),
      padding: getPadding(left: 16, right: 16, top: 14, bottom: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: ColorConstant.black900ff,
      ),
      child: Text(
        text,
        style: AppStyle.txtRobotoRegular14Gray10002,
      ),
    );
  }

  double validLongText(text){
    return text.length > 20 ? 200.0 : 48.0;
  }
}
