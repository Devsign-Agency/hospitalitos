import 'package:flutter/material.dart';
import 'package:mobile_app/features/reading/screens/widgets/list_view_reading.dart';
import 'package:provider/provider.dart';

import '../../../core/app_export.dart';
import '../../../shared/shared.dart';
import '../../../widgets/widgets.dart';

class ReadingScreen extends StatelessWidget {
  static const String route = 'reading-route';

  const ReadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DailyReadingService dailyReadingService =
        Provider.of<DailyReadingService>(context, listen: false);

    DailyReading reading = dailyReadingService.getDailyReadingSelected();
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Lecturas',
        backgroundColor: ColorConstant.gray50,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24),

            // Liturgy Reading Date
            CustomCard(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(reading.title,
                    style: AppStyle.txtNunitoSansSemiBold20Black900),
                CustomImageView(
                    width: 24,
                    height: 24,
                    color: ColorConstant.whiteA700,
                    svgPath: ImageConstant.imgEditIndigo900,
                    onTap: () {}),
              ],
            )),

            // Item List
            CustomCard(
                child: ListViewReading(
              readings: reading.readings,
            )),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
