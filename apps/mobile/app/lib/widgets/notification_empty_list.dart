import 'package:flutter/material.dart';

import '../core/app_export.dart';

class NotificationEmptyList extends StatelessWidget {
  final String title;
  final String message;
  final String label;

  const NotificationEmptyList({
    super.key,
    required this.title,
    required this.message,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final boxShadow = [
      BoxShadow(
        color: Color.fromRGBO(24, 39, 75, 0.08),
        offset: const Offset(0.0, 12.0),
        blurRadius: 32.0,
        spreadRadius: -4.0,
      ), //BoxSha
      BoxShadow(
        color: Color.fromRGBO(24, 39, 75, 0.08),
        offset: const Offset(0.0, 8.0),
        blurRadius: 18.0,
        spreadRadius: -6.0,
      ), //BoxShadow
    ];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      margin: EdgeInsets.only(top: 115),
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
          GestureDetector(
            // TODO: Sugerencia, usar un customIconButton
            onTap: () {},
            child: Container(
              width: double.infinity,
              height: getSize(48),
              decoration: BoxDecoration(
                  color: ColorConstant.yellow100,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: boxShadow),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  label,
                  style: AppStyle.txtNunitoSansSemiBold16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
