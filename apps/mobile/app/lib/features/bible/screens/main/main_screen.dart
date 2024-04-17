import 'package:flutter/material.dart';
import 'package:mobile_app/shared/shared.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_export.dart';
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

      bibleService.getVersesByRange(startVerse, endVerse);
      bibleService.startVerse = startVerse;
      bibleService.endVerse = endVerse;

      bibleService.setLastPage();

      Navigator.of(context).pushNamed(BookViewerScreen.route,
          arguments: bibleService.selectedChapter.verses);
    }
  }

  @override
  Widget build(BuildContext context) {
    BibleService bibleService =
        Provider.of<BibleService>(context, listen: false);

    bibleService.getBooks();
    bibleService.resetState();

    final List<Map<String, dynamic>> actions = [
      // {
      //   'icon': ImageConstant.imgSearch,
      //   'action': () => {print('Search...')}
      // },
    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: 'La Biblia',
        backgroundColor: ColorConstant.gray50,
        iconButtonVariant: IconButtonVariant.FillGray300,
        actions: [...actions],
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
                    style: AppStyle.txtNunitoSansSemiBold13Gray200),
                Text(getLastPage(), style: AppStyle.txtNunitoSansSemiBold23),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => _handleTappedItem(),
                    child: Text('Continuar',
                        style: AppStyle.txtNunitoSansSemiBold16),
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
                        color: ColorConstant.gray800,
                        svgPath: ImageConstant.imgBookmark,
                      ),
                    ),
                    Text(
                      'Ver índice',
                      style: AppStyle.txtNunitoSansSemiBold23,
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
                        color: ColorConstant.gray800,
                        svgPath: ImageConstant.imgBookmarkGray800,
                      ),
                    ),
                    Text(
                      'Página guardadas',
                      style: AppStyle.txtNunitoSansSemiBold23,
                    ),
                  ],
                )),

            SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: 2,
          onChangeIndex: handleChangeBottomNavigationBar,
          bottomMenuList: BibleService.bottomMenuList),
    );
  }
}
