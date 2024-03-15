import 'package:flutter/material.dart';
import 'package:mobile_app/shared/services/bible_service.dart';
import 'package:provider/provider.dart';

import '../../../../../core/app_export.dart';

class TabBarViewChapters extends StatelessWidget {
  const TabBarViewChapters({
    super.key,
    required this.amountOfChapters,
  });

  final int amountOfChapters;

  @override
  Widget build(BuildContext context) {
    BibleService bibleService =
        Provider.of<BibleService>(context, listen: false);

    print(bibleService.selectedBook.name);
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
        SingleChildScrollView(
          child: GridView.count(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 5,
            children: List.generate(bibleService.selectedBook.chapters.length,
                (index) {
              return Center(
                child: GestureDetector(
                  onTap: () {
                    bibleService.setSelectedVerses(
                        bibleService.selectedBook.chapters[index].verses);
                  },
                  child: Text('$index',
                      style: AppStyle.txtNunitoSansRegular18Gray900),
                ),
              );
            }),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height - 350,
          left: 0,
          right: 0,
          child: GestureDetector(
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
                  'Siguiente',
                  style: AppStyle.txtNunitoSansSemiBold16,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
