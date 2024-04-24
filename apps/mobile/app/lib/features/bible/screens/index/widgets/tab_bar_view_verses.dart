import 'package:flutter/material.dart';
import 'dart:math';

import 'package:mobile_app/features/bible/screens/book_viewer/book_viewer_screen.dart';
import 'package:provider/provider.dart';

import '../../../../../core/app_export.dart';
import '../../../../../shared/shared.dart';
import '../../../../../themes/themes.dart';
import '../../../../../widgets/custom_button.dart';

class TabBarViewVerses extends StatefulWidget {
  final Function onChangeTab;
  final int amountOfVerses;
  const TabBarViewVerses({
    super.key,
    required this.amountOfVerses,
    required this.onChangeTab,
  });

  @override
  State<TabBarViewVerses> createState() => _TabBarViewVersesState();
}

class _TabBarViewVersesState extends State<TabBarViewVerses> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    BibleService bibleService =
        Provider.of<BibleService>(context, listen: true);
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkTheme = themeProvider.currentTheme == DarkTheme.theme;

    bool getColor(int index) =>
        index >= bibleService.startVerse && index <= bibleService.endVerse;

    void next() {
      bibleService.getVersesByRange(
          bibleService.startVerse, bibleService.endVerse);
      Navigator.of(context).pushNamed(BookViewerScreen.route,
          arguments: bibleService.selectedChapter.verses);
    }

    void handleTappedItem(int index) {
      int startVerse = bibleService.startVerse;
      int endVerse = bibleService.endVerse;
      i = i + 1;

      if (i == 1) {
        startVerse = index;
        endVerse = bibleService.selectedChapter.verses.length;
      } else {
        int aux = min(startVerse, index);
        endVerse = max(startVerse, index);
        startVerse = aux;

        i = 0;
      }

      bibleService.startVerse = startVerse;
      bibleService.endVerse = endVerse;

      bibleService.setLastPage();
    }

    return Stack(
      children: [
        SingleChildScrollView(
          child: GridView.count(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 5,
            children: List.generate(widget.amountOfVerses, (index) {
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
        Positioned(
          top: MediaQuery.of(context).size.height - 350,
          left: 0,
          right: 0,
          child: CustomButton(
              height: getVerticalSize(48),
              text: 'Aceptar',
              onTap: bibleService.startVerse > 0 ? next : null),
        )
      ],
    );
  }
}
