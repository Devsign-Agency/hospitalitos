import 'package:flutter/material.dart';
import 'package:mobile_app/features/prayer/screens/prayers/widgets/list_view_prayer.dart';
import 'package:mobile_app/shared/services/prayer_service.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_export.dart';
import '../../../../widgets/widgets.dart';

class PrayersScreen extends StatelessWidget {
  static const String route = 'prayers-router';
  const PrayersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PrayerService prayerService =
        Provider.of<PrayerService>(context, listen: false);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Oraciones',
        backgroundColor: ColorConstant.gray50,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24),

            // Item List
            CustomCard(
                child: ListViewPrayer(
              prayers: prayerService.prayers,
            )),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
