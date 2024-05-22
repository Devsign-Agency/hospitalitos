import 'package:flutter/material.dart';

import '../core/app_export.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onPressed;

  const CustomAlertDialog(
      {super.key,
      required this.title,
      required this.message,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorConstant.whiteA700,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      elevation: 5,
      title: Text(title, style: AppStyle.txtNunitoSansSemiBold23),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10),
          Text(message, style: AppStyle.txtNunitoSansRegular16Gray900)
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancelar', style: AppStyle.txtNunitoSansSemiBold16)),
        TextButton(
            onPressed: onPressed,
            child: Text('Aceptar', style: AppStyle.txtNunitoSansSemiBold16)),
      ],
    );
  }
}
