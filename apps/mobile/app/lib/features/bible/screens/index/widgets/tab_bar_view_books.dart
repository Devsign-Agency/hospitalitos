import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/app_export.dart';
import '../../../../../core/models/BookBible.dart';
import '../../../../../shared/shared.dart';
import '../../../../../themes/themes.dart';

class TabBarViewBooks extends StatelessWidget {
  final VoidCallback onChangeTab;
  final List<BookBible> books;
  const TabBarViewBooks({
    super.key,
    required this.onChangeTab,
    required this.books,
  });

  @override
  Widget build(BuildContext context) {
    BibleService bibleService =
        Provider.of<BibleService>(context, listen: true);
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkTheme = themeProvider.currentTheme == DarkTheme.theme;

    return Stack(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: books.length,
          itemBuilder: (_, index) => Padding(
            padding: getPadding(left: 16, top: 16, right: 16, bottom: 16),
            child: GestureDetector(
              onTap: () {
                bibleService.selectedBook = books[index];
                onChangeTab();
              },
              child: Container(
                padding: getPadding(all: 10.0),
                decoration: BoxDecoration(
                    color: books[index].name == bibleService.selectedBook.name
                        ? ColorConstant.yellow100.withOpacity(0.2)
                        : null,
                    border: books[index].name == bibleService.selectedBook.name
                        ? Border(
                            left: BorderSide(
                                width: 4.0, color: ColorConstant.yellow100))
                        : null),
                child: Text(
                  books[index].name,
                  style: isDarkTheme
                      ? AppStyle.txtNunitoSansRegular18WhiteA700
                      : AppStyle.txtNunitoSansRegular18Gray900,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
