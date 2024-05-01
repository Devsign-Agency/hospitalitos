import 'package:flutter/material.dart';
import 'package:mobile_app/features/prayer/screens/prayer_detail/prayer_detail_screen.dart';
import '../../../../../core/app_export.dart';

class ListViewPrayer extends StatelessWidget {
  final List<Prayer> prayers;

  const ListViewPrayer({super.key, required this.prayers});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (_, int index) {
        final Prayer item = prayers[index];
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, PrayerDetailScreen.route,
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
      itemCount: prayers.length,
    );
  }
}
