import 'package:flutter/material.dart';

import 'package:mobile_app/features/bible/screens/book_viewer/book_viewer_screen.dart';
import 'package:provider/provider.dart';

import '../../../../../core/app_export.dart';
import '../../../../../shared/shared.dart';
import '../../../../../themes/themes.dart';

class TabBarViewVerses extends StatelessWidget {
  final Function onChangeTab;
  final int amountOfVerses;
  const TabBarViewVerses({
    super.key,
    required this.amountOfVerses,
    required this.onChangeTab,
  });

  @override
  Widget build(BuildContext context) {
    BibleService bibleService =
        Provider.of<BibleService>(context, listen: true);
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkTheme = themeProvider.currentTheme == DarkTheme.theme;

    bool getColor(int index) =>
        index >= bibleService.startVerse && index <= bibleService.startVerse;

    void handleTappedItem(int index) {
      bibleService.startVerse = index;
      Navigator.of(context).pushNamed(BookViewerScreen.route,
          arguments: bibleService.selectedChapter.verses);
      // bibleService.setLastPage();
    }

    return Stack(
      children: [
        SingleChildScrollView(
          child: GridView.count(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 5,
            children: List.generate(amountOfVerses, (index) {
              return Center(
                child: GestureDetector(
                  onTap: () => handleTappedItem(index + 1),
                  child: Container(
                    padding: getPadding(all: 10.0),
                    decoration: BoxDecoration(
                      color: getColor(index + 1)
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
