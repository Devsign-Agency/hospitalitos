import 'dart:typed_data';

import 'package:epub_view/epub_view.dart' hide Image;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' hide Image;
import 'package:mobile_app/core/app_export.dart';
import 'package:mobile_app/features/book/pages/chapter.page.dart';
import 'package:provider/provider.dart';
import '../../../shared/shared.dart';
import '../../../themes/themes.dart';

class DrawerContent extends StatelessWidget {
  final EpubBook book;
  final EpubChapter chapter;
  final bool isDarkMode;

  const DrawerContent(
      {super.key,
      required this.book,
      required this.chapter,
      required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    Image image = Image.memory(Uint8List.fromList(encodePng(book.CoverImage!)));

    return SizedBox(
      height: height,
      child: Column(
        children: [
          _DrawerHeader(image: image, book: book),
          _DrawerTableContent(book: book)
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    super.key,
    required this.image,
    required this.book,
  });

  final Image image;
  final EpubBook book;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 220.0,
          decoration: BoxDecoration(
              image: DecorationImage(image: image.image, fit: BoxFit.cover)),
        ),
        Positioned(
          bottom: 40,
          left: 0,
          child: Padding(
            padding: getPadding(left: 12),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 300,
              ),
              child: Text(
                book.Title!,
                style: AppStyle.txtNunitoSansSemiBold23WhiteA700,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 0,
          child: Padding(
            padding: getPadding(left: 12, right: 12),
            child: Text(
              book.AuthorList![0]!,
              style: AppStyle.txtNunitoSansSemiBold16WhiteA700,
            ),
          ),
        ),
      ],
    );
  }
}

class _DrawerTableContent extends StatelessWidget {
  final EpubBook book;

  const _DrawerTableContent({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkTheme = themeProvider.currentTheme == DarkTheme.theme;

    BookService bookService = Provider.of<BookService>(context, listen: false);

    return Flexible(
      child: ListView.builder(
          padding: getPadding(top: 0),
          shrinkWrap: true,
          itemCount: book!.Chapters!.length,
          itemBuilder: (context, index) {
            var title = (book?.Chapters![index].Title!).toString();

            return title != ''
                ? book.Chapters![index].SubChapters!.isNotEmpty
                    ? ExpansionTile(
                        title: Text(
                          title,
                          style: AppStyle.txtNunitoSansSemiBold20Gray900
                              .copyWith(
                                  color: isDarkTheme
                                      ? ColorConstant.whiteA700
                                      : ColorConstant.gray900),
                        ),
                        children: [
                            ListView.builder(
                                padding: getPadding(top: 0),
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    book.Chapters![index].SubChapters?.length,
                                itemBuilder: (BuildContext context, int i) {
                                  var subtititle = book
                                      .Chapters![index].SubChapters?[i].Title!
                                      .toString();

                                  return ListTile(
                                    onTap: () {
                                      bookService.chapterTitle = title;
                                      var sub =
                                          book.Chapters![index].SubChapters;
                                      bookService.chapterIndex = index;
                                      bookService.subchapterIndex = i;
                                      bookService.subchapterSelected =
                                          book.Chapters![index].SubChapters![i];
                                      Navigator.pop(context);
                                      Navigator.popAndPushNamed(
                                          context, ChapterPage.route,
                                          arguments: EpubArguments(
                                              book: book,
                                              chapter: book.Chapters![index]
                                                  .SubChapters?[i]));
                                    },
                                    title: Title(
                                        color: isDarkTheme
                                            ? ColorConstant.whiteA700
                                            : ColorConstant.amber300,
                                        child: Text(subtititle!)),
                                  );
                                })
                          ])
                    : ListTile(
                        title: Text((book?.Chapters![index].Title!).toString(),
                            style: AppStyle.txtNunitoSansSemiBold20Gray900
                                .copyWith(
                                    color: isDarkTheme
                                        ? ColorConstant.whiteA700
                                        : ColorConstant.gray900)),
                        onTap: () {
                          bookService.subchapterSelected =
                              book.Chapters![index];
                          bookService.chapterIndex = index;
                          bookService.subchapterIndex = 0;
                          bookService.chapterTitle = title;
                          Navigator.pop(context);

                          Navigator.popAndPushNamed(context, ChapterPage.route,
                              arguments: EpubArguments(
                                  book: book, chapter: book?.Chapters![index]));
                        })
                : SizedBox();
          }),
    );
  }
}
