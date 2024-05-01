import 'package:flutter/material.dart';
import 'package:mobile_app/features/prayer/screens/prayers/prayers_screen.dart';
import 'package:mobile_app/features/reading/screens/reading_detail/reading_detail_screen.dart';

import '../../../../core/app_export.dart';

class ListViewReading extends StatelessWidget {
  final List<Reading> readings;

  const ListViewReading({super.key, required this.readings});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (_, int index) {
        final Reading item = readings[index];
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, ReadingDetailScreen.route,
              arguments: item),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  item.title,
                  style: AppStyle.txtNunitoSansSemiBold20Black900,
                ),
              ]),
              Text(
                item.verses,
                style: AppStyle.txtNunitoSansRegular14Black900,
              )
            ],
          ),
        );
      },
      separatorBuilder: (_, __) => Container(
        width: double.infinity,
        height: 1,
        margin: getMargin(top: 16, bottom: 16),
        color: ColorConstant.gray400,
      ),
      itemCount: readings.length,
    );
  }
}
