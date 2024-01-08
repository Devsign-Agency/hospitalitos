import 'package:flutter/material.dart';

import '../../../../../core/app_export.dart';

class TabBarViewBooks extends StatelessWidget {
  const TabBarViewBooks({
    super.key,
    required this.bookNames,
  });

  final List<String> bookNames;

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

    return Stack(
      children: [
        ListView(
          shrinkWrap: true,
          children: [
            SizedBox(height: 19),
            ...bookNames.map((e) => Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    e,
                    style: AppStyle.txtNunitoSansRegular18Gray900,
                  ),
                ))
          ],
        ),
        Positioned(
          top: MediaQuery.of(context).size.height - 250,
          left: 0,
          right: 0,
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
                'Siguiente',
                style: AppStyle.txtNunitoSansSemiBold16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
