import 'package:flutter/material.dart';
import 'package:mobile_app/features/prayer/screens/prayer_detail/prayer_detail_screen.dart';
import 'package:mobile_app/shared/services/prayer_service.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_export.dart';
import '../../../../core/models/list_view_favorite.dart';
import '../../../../widgets/viewed_preview.dart';
import '../../../../widgets/widgets.dart';

class PrayersScreen extends StatelessWidget {
  static const String route = 'prayers-router';
  const PrayersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PrayerService prayerService =
        Provider.of<PrayerService>(context, listen: false);

    List<ListViewFavoriteModel> favorites = [];

    for (var prayer in prayerService.prayers) {
      favorites.add(ListViewFavoriteModel(
          id: prayer.title, title: prayer.title, image: prayer.img));
    }

    print(favorites);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Oraciones',
        backgroundColor: ColorConstant.gray50,
      ),
      body: Padding(
        padding: getPadding(left: 16, right: 16, top: 24),
        child: Wrap(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                height: height * 0.90,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  shrinkWrap: true,
                  itemBuilder: (_, int index) => _CardImagePreview(
                      title: favorites[index].title,
                      image: Image.asset(
                          'assets/images/${favorites[index].image!}'),
                      onTap: () {
                        Navigator.pushNamed(context, PrayerDetailScreen.route,
                            arguments: prayerService.prayers[index]);
                      }),
                  itemCount: favorites.length,
                  // separatorBuilder: (_, __) => SizedBox(width: 8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardImagePreview extends StatelessWidget {
  final Image image;
  final String? title;
  final VoidCallback onTap;

  const _CardImagePreview({
    this.title,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: (width - 40) / 2,
      height: 180,
      child: ViewedPreview(
          title: title ?? 'no title', backgroundImage: image, onTap: onTap),
    );
  }
}
