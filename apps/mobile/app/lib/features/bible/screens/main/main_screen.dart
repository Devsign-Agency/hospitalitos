import 'package:flutter/material.dart';
import 'package:mobile_app/features/library/screens/courses/discover_screen.dart';
import 'package:mobile_app/features/liturgia/screens/calendar/calendar_screen.dart';
import 'package:mobile_app/shared/shared.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_export.dart';
import '../../../../themes/themes.dart';
import '../../../../widgets/widgets.dart';
import '../../../main/pages/home/home.dart';
import '../screens.dart';

class BibleMain extends StatefulWidget {
  static const String route = 'bible-router';
  const BibleMain({Key? key}) : super(key: key);

  @override
  State<BibleMain> createState() => _BibleMainState();
}

class _BibleMainState extends State<BibleMain> {
  @override
  void dispose() {
    // STEP 3
    super.dispose();
  }

  handleChangeBottomNavigationBar(int index) {
    switch (index) {
      case 0:
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomePage()),
            (Route<dynamic> route) => false);
        break;
      case 1:
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => DiscoverScreen()),
            (Route<dynamic> route) => false);
        break;
      case 2:
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LiturgiaCalendarScreen()),
            (Route<dynamic> route) => false);
        break;
      case 3:
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => BibleMain()),
            (Route<dynamic> route) => false);
        break;
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

  // TODO: optimizar función
  void _handleTappedItem() {
    if (Preferences.lastPage.isNotEmpty) {
      final List<String> paths = Preferences.lastPage.split('/');
      final String bookName = paths[0];
      final int chapterIndex = int.parse(paths[1]);
      int startVerse = -1;
      int endVerse = -1;

      if (paths[2].split('-').length > 1) {
        startVerse = int.parse(paths[2].split('-')[0]);
        endVerse = int.parse(paths[2].split('-')[1]);
      } else {
        startVerse = endVerse = int.parse(paths[2]);
      }

      BibleService bibleService =
          Provider.of<BibleService>(context, listen: false);
      bibleService.getBookByName(bookName);
      bibleService.getChapterFromBook(bibleService.selectedBook, chapterIndex);
      bibleService.startVerse = startVerse;

      bibleService.setLastPage();

      Navigator.of(context)
          .pushNamed(BookViewerScreen.route,
              arguments: bibleService.selectedChapter.verses)
          .then((value) => setState(() {}));
    }
  }

  @override
  Widget build(BuildContext context) {
    BibleService bibleService =
        Provider.of<BibleService>(context, listen: false);
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkTheme = themeProvider.currentTheme == DarkTheme.theme;

    Color iconColor =
        isDarkTheme ? ColorConstant.whiteA700 : ColorConstant.gray800;

    bibleService.getBooks();
    // bibleService.resetState();

    // Preferences.removePageList();
    // Preferences.lastPage = '';
    // Preferences.removeMarkerList();

    return Scaffold(
      appBar: CustomAppBar(
        title: 'La Biblia',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24),

            // Liturgy Reading Date
            CustomCard(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Última Lectura',
                    style: AppStyle.txtNunitoSansSemiBold13Gray200.copyWith(
                        color: isDarkTheme
                            ? ColorConstant.whiteA700
                            : ColorConstant.gray200)),
                Text(getLastPage(),
                    style: AppStyle.txtNunitoSansSemiBold23.copyWith(
                        color: isDarkTheme
                            ? ColorConstant.whiteA700
                            : ColorConstant.gray900)),
                if (Preferences.lastPage.isNotEmpty)
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => _handleTappedItem(),
                      child: Text('Continuar',
                          style: AppStyle.txtNunitoSansSemiBold16.copyWith(
                              color: isDarkTheme
                                  ? ColorConstant.whiteA700
                                  : ColorConstant.indigo900)),
                    ),
                  ),
              ],
            )),

            // Index
            CustomCard(
                onTapped: () => Navigator.of(context)
                    .pushNamed(IndexScreen.route)
                    .then((value) => setState(() {})),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomIconButton(
                      height: getSize(48),
                      width: getSize(48),
                      variant: IconButtonVariant.NoFill,
                      child: CustomImageView(
                        color: iconColor,
                        svgPath: ImageConstant.imgBookmark,
                      ),
                    ),
                    Text(
                      'Ver índice',
                      style: AppStyle.txtNunitoSansSemiBold23.copyWith(
                          color: isDarkTheme
                              ? ColorConstant.whiteA700
                              : ColorConstant.gray900),
                    ),
                  ],
                )),

            // Saved pages
            CustomCard(
                onTapped: () => Navigator.of(context)
                    .pushNamed(ChaptersScreen.route)
                    .then((value) => setState(() {})),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomIconButton(
                      height: getSize(48),
                      width: getSize(48),
                      variant: IconButtonVariant.NoFill,
                      child: CustomImageView(
                        color: iconColor,
                        svgPath: ImageConstant.imgBookmarkGray800,
                      ),
                    ),
                    Text(
                      'Marcadores',
                      style: AppStyle.txtNunitoSansSemiBold23.copyWith(
                          color: isDarkTheme
                              ? ColorConstant.whiteA700
                              : ColorConstant.gray900),
                    ),
                  ],
                )),

            SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: 3,
          onChangeIndex: handleChangeBottomNavigationBar,
          bottomMenuList: BibleService.bottomMenuList),
    );
  }
}
