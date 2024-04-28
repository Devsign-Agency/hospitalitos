import 'package:flutter/material.dart';
import 'package:mobile_app/core/app_export.dart';

class ButtonNavigationChapter extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;

  const ButtonNavigationChapter({
    super.key,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: 40,
          height: 60,
          decoration: BoxDecoration(
              color: ColorConstant.black900.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10)),
          child: Icon(
            icon,
            color: ColorConstant.black900.withOpacity(0.4),
          )),
    );
  }
}
