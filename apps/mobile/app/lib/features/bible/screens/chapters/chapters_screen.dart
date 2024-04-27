import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_app/core/models/BookBible.dart';
import 'package:mobile_app/core/models/list_view_favorite.dart';
import 'package:mobile_app/shared/services/ftoast_service.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/app_export.dart';
import '../../../../shared/shared.dart';
import '../../../../widgets/widgets.dart';
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
    // fToast = FToast();
    // fToast?.init(FtoastService.navigatorKey.currentContext!);
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

    // bibleService.setLastPage();

    Navigator.of(context).pushNamed(BookViewerScreen.route,
        arguments: bibleService.selectedChapter.verses);
  }

  void showCustomToast(String message) {
    Widget toast = Container(
      width: double.infinity,
      height: 48,
      padding: getPadding(left: 16, right: 16, top: 14, bottom: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: ColorConstant.black900ff,
      ),
      child: Text(
        message,
        style: AppStyle.txtRobotoRegular14Gray10002,
      ),
    );

    fToast?.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 3),
    );
  }

  Future<void> share(String value) async {
    await Share.share(value);
  }

  void handleEventShare(ListViewFavoriteModel item) {
    String title = item.title;
    String verse = BibleService.getVerseByPath(item.id);

    share('$title\n$verse\n${item.description}');
  }

  @override
  Widget build(BuildContext context) {
    BibleService bibleService =
        Provider.of<BibleService>(context, listen: true);

    final List<ListViewFavoriteModel> chapterList = [];

    List<dynamic> pages = bibleService.getPageList();

    for (var page in pages) {
      final List<String> values = page.split('/');
      final String titlePage = '${values[0]} ${values[1]}, ${values[2]}';

      chapterList.add(ListViewFavoriteModel(
          id: page, title: titlePage, date: values[4], description: values[3]));
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Marcadores',
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
          currentIndex: 2,
          onChangeIndex: (index) {},
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
