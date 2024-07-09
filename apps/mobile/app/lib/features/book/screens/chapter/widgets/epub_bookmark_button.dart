import 'package:flutter/material.dart';

import '../../../../../core/app_export.dart';

class EpubBookmarkButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;

  const EpubBookmarkButton(
      {super.key, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 20,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(1.0, 2.0),
                      blurRadius: 0.2)
                ],
                color: ColorConstant.gray300.withOpacity(0.6),
                borderRadius: BorderRadius.circular(28)),
            child: Icon(
              icon,
              color: ColorConstant.indigo900.withOpacity(1.0),
            )),
      ),
    );
  }
}
