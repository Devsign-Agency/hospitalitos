import 'package:flutter/material.dart';

import '../../../../../core/app_export.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ColorConstant.black900.withOpacity(0.1),
      elevation: 0,
      onPressed: onTap,
      child: Icon(
        Icons.menu,
        color: ColorConstant.indigo900,
      ),
    );
  }
}
