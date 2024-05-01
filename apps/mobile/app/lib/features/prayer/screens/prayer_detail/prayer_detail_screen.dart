import 'package:flutter/material.dart';
import 'package:mobile_app/core/app_export.dart';

import '../../../../widgets/widgets.dart';

class PrayerDetailScreen extends StatelessWidget {
  static const String route = 'prayer-detail-router';
  const PrayerDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Prayer prayer = ModalRoute.of(context)?.settings.arguments! as Prayer;

    return Scaffold(
      appBar: CustomAppBar(title: prayer.title),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child:
                  Text(prayer.prayer, style: AppStyle.txtNunitoSansSemiBold20),
            ),
          ),
        ),
      ),
    );
  }
}
