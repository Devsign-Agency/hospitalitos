import 'package:flutter/material.dart';
import 'package:mobile_app/features/profile/screens/interests/interests_screen.dart';
import 'package:mobile_app/widgets/custom_button.dart';

import '../core/app_export.dart';

class NotificationEmptyList extends StatelessWidget {
  final String title;
  final String message;
  final String label;
  final VoidCallback onTapped;

  const NotificationEmptyList({
    super.key,
    required this.title,
    required this.message,
    required this.label,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(left: 16, right: 16),
      margin: getMargin(top: 115),
      width: double.infinity,
      height: getSize(400),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppStyle.txtNunitoSansSemiBold26,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Expanded(
              child: SizedBox(
            width: getSize(340),
            child: Text(
              message,
              style: AppStyle.txtNunitoSansRegular18Gray800,
              textAlign: TextAlign.center,
            ),
          )),
          CustomButton(
              height: getVerticalSize(48), text: label, onTap: onTapped),
        ],
      ),
    );
  }
}
