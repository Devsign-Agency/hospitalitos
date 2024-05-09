import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/app_export.dart';
import '../../../../../shared/shared.dart';
import '../../../../../themes/themes.dart';

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
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkTheme = themeProvider.currentTheme == DarkTheme.theme;

    return Stack(
      children: [
        SingleChildScrollView(
          child: GridView.count(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 5,
            children: List.generate(amountOfChapters, (index) {
              return Center(
                child: GestureDetector(
                  onTap: () {
                    bibleService.selectedChapter =
                        bibleService.selectedBook.chapters[index];
                    bibleService.startVerse = -1;
                    onChangeTab();
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
                      style: isDarkTheme
                          ? AppStyle.txtNunitoSansRegular18WhiteA700
                          : AppStyle.txtNunitoSansRegular18Gray900,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
