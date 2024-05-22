import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../core/app_export.dart';
import '../../../shared/shared.dart';
import '../../../themes/themes.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/widgets.dart';
import '../widgets/list_view_bookmarks.dart';

class BookmarksScreen extends StatelessWidget {
  final EpubBook book;

  const BookmarksScreen({super.key, required this.book});

  List<Bookmark> getBookmarks(MarkerService markerService) {
    List<Bookmark> bookmarkList = [];
    final Map<dynamic, dynamic> bookmarks =
        markerService.getBookmarkByBook(book.Title!);

    if (bookmarks.isNotEmpty) {
      bookmarks['chapters'].forEach((item) {
        if (item.isNotEmpty) {
          item['markers'].forEach((bookmark) {
            bookmarkList.add(Bookmark(
                id: bookmark['id'],
                bookName: bookmarks['title'],
                chapterName: item['title'],
                text: bookmark['text'],
                date: DateTime.parse(bookmark['id']),
                offset: bookmark['offset'].toString()));
          });
        }
      });
    }

    return bookmarkList;
  }

  void handleEventTap(Bookmark bookmark, BuildContext context) {
    BookService bookService = Provider.of<BookService>(context, listen: false);

    EpubChapter epubChapter = EpubChapter();

    int chapterIndex = 0;
    book.Chapters?.forEach((chapter) {
      if (chapter.SubChapters != null && chapter.SubChapters!.isNotEmpty) {
        int? index = chapter.SubChapters?.indexWhere(
            (subchapter) => subchapter.Title == bookmark.chapterName);

        if (index != null && index > -1) {
          epubChapter = chapter.SubChapters![index];
          bookService.chapterIndex = chapterIndex;
          bookService.subchapterIndex = index;
        }
      } else {
        if (chapter.Title == bookmark.chapterName) {
          epubChapter = chapter;
          bookService.chapterIndex = 0;
          bookService.subchapterIndex = 0;
        }
      }
      chapterIndex++;
    });

    bookService.subchapterSelected = epubChapter;

    Navigator.pop(
        context,
        EpubArguments(
            book: book,
            chapter: epubChapter,
            offset: double.parse(bookmark.offset)));
  }

  void deleteBookmark(
      Bookmark bookmark, MarkerService markerService, BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return CustomAlertDialog(
              title: 'Eliminar marcador',
              message: '¿Seguro que desea eliminar el marcador?',
              onPressed: () {
                markerService.deleteMarker(
                    bookmark.bookName, bookmark.chapterName, bookmark.id);
                Fluttertoast.showToast(msg: 'Marcador eliminado con éxito');
                Navigator.pop(context);
              });
        });
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkTheme = themeProvider.currentTheme == DarkTheme.theme;

    MarkerService markerService =
        Provider.of<MarkerService>(context, listen: true);

    List<Bookmark> bookmarkList = getBookmarks(markerService);

    return Scaffold(
      appBar: CustomAppBar(
        hasCustomTitle: true,
        customTitle: Row(
          children: [
            Text(
              'Marcadores',
              style: AppStyle.txtNunitoSansSemiBold28.copyWith(
                  color: isDarkTheme
                      ? ColorConstant.whiteA700
                      : ColorConstant.black900),
            ),
            SizedBox(width: 10),
            Text('(${bookmarkList.length})',
                style: TextStyle(
                    color: isDarkTheme
                        ? ColorConstant.whiteA700
                        : ColorConstant.black900))
          ],
        ),
      ),
      body: Padding(
        padding: getPadding(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(book.Title!, style: AppStyle.txtNunitoSansSemiBold20),

            SizedBox(height: 30),

            // bookmark list
            if (bookmarkList.isNotEmpty)
              ListViewBookmark(
                  bookmarks: bookmarkList,
                  onTap: (Bookmark bookmark) =>
                      handleEventTap(bookmark, context),
                  onDelete: (Bookmark bookmark) =>
                      deleteBookmark(bookmark, markerService, context)),

            if (bookmarkList.isEmpty)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No hay marcadores guardados...',
                      style: AppStyle.txtNunitoSansSemiBold26.copyWith(
                          color: isDarkTheme
                              ? ColorConstant.whiteA700
                              : ColorConstant.black900),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30),
                    CustomButton(
                        height: getVerticalSize(48),
                        text: 'Ir al capítulo',
                        onTap: () => Navigator.pop(context)),
                  ],
                ),
              ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
