import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../core/app_export.dart';
import '../../../../../core/models/list_view_favorite.dart';
import '../../../../../shared/shared.dart';
import '../../../../../widgets/widgets.dart';
import '../../screens.dart';

class ListViewBookmarks extends StatelessWidget {
  final List<BibleBookMark> bookmarks;
  final bool isEditing;

  const ListViewBookmarks(
      {super.key, required this.bookmarks, required this.isEditing});

  List<ListViewFavoriteModel> mapToListViewFavoriteModel(
      List<BibleBookMark> bibleBookMark) {
    final List<ListViewFavoriteModel> bookmarks = [];

    for (var element in bibleBookMark) {
      String bookName = element.bookName;
      int chapter = element.chapter;
      int verse = element.verse;

      bookmarks.add(ListViewFavoriteModel(
          id: '$bookName/$chapter/$verse/${element.id}',
          title: '$bookName $chapter, $verse',
          date:
              '${element.date.day.toString()}/${element.date.month.toString()}/${element.date.year}',
          description: element.comment));
    }

    return bookmarks;
  }

  void _handleTappedItem(ListViewFavoriteModel item, BuildContext context) {
    List<String> splited = item.id.split('/');

    String bookName = splited[0];
    String chapter = splited[1];

    BibleService bibleService =
        Provider.of<BibleService>(context, listen: false);
    bibleService.getBookByName(bookName);
    bibleService.getChapterFromBook(
        bibleService.selectedBook, int.parse(chapter));

    bibleService.startVerse = int.parse(splited[2]);

    Navigator.of(context).pushNamed(BookViewerScreen.route,
        arguments: bibleService.selectedChapter.verses);
  }

  void _handleEventShare(ListViewFavoriteModel item) async {
    String title = item.title;
    String verse = BibleService.getVerseByPath(item.id);

    await Share.share('$title\n$verse\n${item.description}');
  }

  void _handleEventDelete(ListViewFavoriteModel item, BuildContext context) {
    BibleBookMarkService bibleBookMarkService =
        Provider.of<BibleBookMarkService>(context, listen: false);

    List<String> splited = item.id.split('/');
    String id = splited[splited.length - 1];
    bibleBookMarkService.deleteBookMark(id);
    Fluttertoast.showToast(msg: 'Marcador eliminado exitosamente');
  }

  @override
  Widget build(BuildContext context) {
    List<ListViewFavoriteModel> chapterList =
        mapToListViewFavoriteModel(bookmarks);

    return chapterList.isNotEmpty
        ? Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: ListViewItemFavorite(
                activeShare: true,
                isEditing: isEditing,
                items: chapterList,
                onShare: _handleEventShare,
                onRemoveItem: (item) => _handleEventDelete(item, context),
                onTappedItem: (item) => _handleTappedItem(item, context),
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
