import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_app/core/models/list_view_favorite.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/app_export.dart';
import '../../../../shared/shared.dart';
import '../../../../widgets/widgets.dart';
import '../../../library/screens/courses/discover_screen.dart';
import '../../../liturgia/screens/screens.dart';
import '../../../main/pages/pages.dart';
import '../screens.dart';

class ChaptersScreen extends StatefulWidget {
  static const String route = 'chapters';
  const ChaptersScreen({Key? key}) : super(key: key);

  @override
  State<ChaptersScreen> createState() => _ChaptersScreenState();
}

class _ChaptersScreenState extends State<ChaptersScreen> {
  bool _isEditing = false;
  late List<Map<String, dynamic>> actions = [];
  FToast? fToast;

  @override
  void initState() {
    super.initState();
    _initActions();
  }

  void _changeModeView() {
    actions.clear();
    _isEditing = !_isEditing;
    if (!_isEditing) {
      _initActions();
    } else {
      actions = [
        {
          'icon': ImageConstant.imgCloseGray24x24,
          'action': () => {_changeModeView()}
        },
      ];
    }
    setState(() {});
  }

  void _initActions() {
    actions = [
      // {
      //   'icon': ImageConstant.imgSearch,
      //   'action': () => {print('Search...')}
      // },
      {
        'icon': ImageConstant.imgEdit,
        'action': () => {_changeModeView()}
      },
    ];
  }

  void _handleTappedItem(ListViewFavoriteModel item) {
    final List<String> paths = item.id.split('/');
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

    // bibleService.setLastPage();

    Navigator.of(context).pushNamed(BookViewerScreen.route,
        arguments: bibleService.selectedChapter.verses);
  }

  Future<void> share(String value) async {
    await Share.share(value);
  }

  void handleEventShare(ListViewFavoriteModel item) {
    String title = item.title;
    String verse = BibleService.getVerseByPath(item.id);

    share('$title\n$verse\n${item.description}');
  }

  void handleChangeBottomNavigationBar(int index) {
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

  @override
  Widget build(BuildContext context) {
    BibleService bibleService =
        Provider.of<BibleService>(context, listen: true);

    final List<ListViewFavoriteModel> chapterList = [];

    List<dynamic> pages = bibleService.getPageList();

    print('pages: $pages');

    for (var page in pages) {
      final List<String> values = page.split('/');
      final String titlePage = '${values[0]} ${values[1]}, ${values[2]}';

      chapterList.add(ListViewFavoriteModel(
          id: page, title: titlePage, date: values[4], description: values[3]));
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: !_isEditing ? 'Guardado' : 'Editar',
        iconButtonVariant: !_isEditing
            ? IconButtonVariant.FillGray300
            : IconButtonVariant.NoFill,
        actions: [...actions],
      ),
      body: Column(
        children: [
          // builds a list, but if it is empty it shows a notification message
          _buildMainContent(chapterList)
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: 3,
          onChangeIndex: handleChangeBottomNavigationBar,
          bottomMenuList: BibleService.bottomMenuList),
    );
  }

  Widget _buildMainContent(List<ListViewFavoriteModel> chapterList) {
    return chapterList.isNotEmpty
        ? Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: ListViewItemFavorite(
                activeShare: true,
                isEditing: _isEditing,
                items: chapterList,
                onShare: handleEventShare,
                onRemoveItem: (ListViewFavoriteModel item) {
                  BibleService bibleService =
                      Provider.of<BibleService>(context, listen: false);

                  bibleService.deletePage(item.id);
                  Fluttertoast.showToast(
                      msg: 'Marcador eliminado exitosamente');
                },
                onTappedItem: _handleTappedItem,
              ),
            ))
        : NotificationEmptyList(
            title: 'Parece que aún no has empezado',
            message:
                'Recuerda que puedes guardar los capítulos que quieras de la Biblia para tenerlos siempre a la mano.',
            label: 'Ir a la Biblia',
            onTapped: () => Navigator.pop(context),
          );
  }
}
