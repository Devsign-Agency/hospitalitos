import 'package:flutter/material.dart';
import 'package:mobile_app/shared/services/bible_service.dart';
import 'package:provider/provider.dart';

import '../../../../../core/app_export.dart';
import '../../../../../widgets/custom_button.dart';

class TabBarViewChapters extends StatelessWidget {
  final VoidCallback onChangeTab;
  const TabBarViewChapters({
    super.key,
    required this.amountOfChapters,
    required this.onChangeTab,
  });

  final int amountOfChapters;

  @override
  Widget build(BuildContext context) {
    BibleService bibleService =
        Provider.of<BibleService>(context, listen: true);

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
                    bibleService.selectedChapter =
                        bibleService.selectedBook.chapters[index];
                  },
                  child: Container(
                    padding: getPadding(all: 10.0),
                    decoration: BoxDecoration(
                      color: bibleService.selectedChapter.chapter ==
                              (index + 1).toString()
                          ? ColorConstant.yellow100.withOpacity(0.2)
                          : null,
                    ),
                    child: Text(
                      '${index + 1}',
                      style: AppStyle.txtNunitoSansRegular18Gray900,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height - 350,
          left: 0,
          right: 0,
          child: CustomButton(
              height: getVerticalSize(48),
              text: 'Siguiente',
              onTap: bibleService.selectedChapter.chapter != ''
                  ? onChangeTab
                  : null),
        )
      ],
    );
  }
}
