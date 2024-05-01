import 'package:flutter/material.dart';
import 'package:mobile_app/core/app_export.dart';
import 'package:mobile_app/widgets/widgets.dart';

class ReadingDetailScreen extends StatelessWidget {
  static const String route = 'reading-detail-route';
  const ReadingDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Reading reading = ModalRoute.of(context)?.settings.arguments! as Reading;

    return Scaffold(
      appBar: CustomAppBar(title: reading.title),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(reading.verses, style: AppStyle.txtNunitoSansSemiBold26),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    reading.description,
                    style: AppStyle.txtNunitoSansSemiBold20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
