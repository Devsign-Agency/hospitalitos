import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/app_export.dart';
import '../../../../../shared/shared.dart';
import '../../../../../themes/themes.dart';
import '../../../../../widgets/widgets.dart';
import '../../screens.dart';

class CardLastReading extends StatelessWidget {
  const CardLastReading({super.key});

  // TODO: optimizar función
  void _handleTappedItem(BuildContext context) {
    if (Preferences.lastPage.isNotEmpty) {
      final List<String> paths = Preferences.lastPage.split('/');
      final String bookName = paths[0];
      final int chapterIndex = int.parse(paths[1]);
      int startVerse = -1;

      if (paths[2].split('-').length > 1) {
        startVerse = int.parse(paths[2].split('-')[0]);
      } else {
        startVerse = int.parse(paths[2]);
      }

      BibleService bibleService =
          Provider.of<BibleService>(context, listen: false);
      bibleService.getBookByName(bookName);
      bibleService.getChapterFromBook(bibleService.selectedBook, chapterIndex);
      bibleService.startVerse = startVerse;

      bibleService.setLastPage();

      Navigator.of(context).pushNamed(BookViewerScreen.route,
          arguments: bibleService.selectedChapter.verses);
    }
  }

  String getLastPage() {
    String lastPage = '- - - - - -';
    if (Preferences.lastPage.isNotEmpty) {
      final List<String> paths = Preferences.lastPage.split('/');

      lastPage = '${paths[0]} ${paths[1]}, ${paths[2]}';
    }

    return lastPage;
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkTheme = themeProvider.currentTheme == DarkTheme.theme;

    TextStyle txtNunitoSansSemiBold23 = AppStyle.txtNunitoSansSemiBold23
        .copyWith(
            color:
                isDarkTheme ? ColorConstant.whiteA700 : ColorConstant.gray900);
    return Consumer<BibleService>(
        builder: (_, bibleService, __) => CustomCard(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Última Lectura',
                    style: AppStyle.txtNunitoSansSemiBold13Gray200.copyWith(
                        color: isDarkTheme
                            ? ColorConstant.whiteA700
                            : ColorConstant.gray200)),
                Text(getLastPage(), style: txtNunitoSansSemiBold23),
                if (Preferences.lastPage.isNotEmpty)
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => _handleTappedItem(context),
                      child: Text('Continuar',
                          style: AppStyle.txtNunitoSansSemiBold16.copyWith(
                              color: isDarkTheme
                                  ? ColorConstant.whiteA700
                                  : ColorConstant.indigo900)),
                    ),
                  ),
              ],
            )));
  }
}
