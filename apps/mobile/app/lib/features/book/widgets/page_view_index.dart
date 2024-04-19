import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/features/book/pages/chapter.page.dart';

import '../../../core/app_export.dart';

class PageViewIndex extends StatelessWidget {
  final EpubBook book;
  final EpubChapter chapter;
  final bool isDarkMode;

  const PageViewIndex(
      {super.key,
      required this.book,
      required this.chapter,
      required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          itemCount: book!.Chapters!.length,
          itemBuilder: (context, index) {
            var title = (book?.Chapters![index].Title!).toString();
            var boxDecoration = BoxDecoration(
              border: Border(
                  left: BorderSide(
                color: ColorConstant.yellow100,
              )),
            );

            return title != ''
                ? Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: book.Chapters![index].SubChapters!.length > 0
                        ? ExpansionTile(
                            title: Container(
                              decoration: boxDecoration,
                              child: Text(
                                title,
                                style: AppStyle.txtNunitoSansSemiBold20Gray900,
                              ),
                            ),
                            children: [
                                ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    itemCount: book
                                        .Chapters![index].SubChapters!.length,
                                    itemBuilder: (BuildContext context, int i) {
                                      var subtititle = book.Chapters![index]
                                          .SubChapters![i].Title!
                                          .toString();
                                      return ListTile(
                                        onTap: () {
                                          var sub =
                                              book.Chapters![index].SubChapters;

                                          Navigator.popAndPushNamed(
                                              context, ChapterPage.route,
                                              arguments: EpubArguments(
                                                  book: book,
                                                  chapter: book.Chapters![index]
                                                      .SubChapters![i]));
                                        },
                                        title: Title(
                                            color: ColorConstant.amber300,
                                            child: Text(subtititle)),
                                      );
                                    })
                              ])
                        : ListTile(
                            title: Text(
                                (book?.Chapters![index].Title!).toString(),
                                style: AppStyle.txtNunitoSansSemiBold20Gray900),
                            onTap: () {
                              Navigator.popAndPushNamed(
                                  context, ChapterPage.route,
                                  arguments: EpubArguments(
                                      book: book,
                                      chapter: book?.Chapters![index]));
                            }),
                  )
                : Container();
          }),
    );
  }

  listSubMenuBook(subChapters) {
    if (subChapters.isEmpty) {
      return ListView.builder(
        itemCount: subChapters.length,
        itemBuilder: (BuildContext context, int index) {
          var title = subChapters[index].Title!;

          ListTile(title: title);
        },
      );
    }
  }
}
