import 'package:flutter/material.dart';

import '../core/app_export.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final Function? onTapped;

  const CustomCard({super.key, required this.child, this.onTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped != null
          ? () {
              onTapped!();
            }
          : null,
      child: Container(
          width: double.infinity,
          padding: getPadding(all: 16),
          margin: getMargin(top: 8, left: 16, right: 16),
          decoration: AppDecoration.fillWhiteA700BoxShadow,
          child: child),
    );
  }
}
