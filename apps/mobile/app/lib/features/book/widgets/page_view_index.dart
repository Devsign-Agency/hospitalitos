import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/features/book/pages/chapter.page.dart';

import '../../../core/app_export.dart';

class PageViewIndex extends StatelessWidget {
  final EpubBook book;
  final EpubChapter chapter;

  const PageViewIndex({super.key, required this.book, required this.chapter});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          itemCount: book.Chapters!.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Container(
                padding: getPadding(left: 5),
                decoration: BoxDecoration(
                    color: chapter.Title == book.Chapters![index].Title!
                        ? ColorConstant.yellow100.withOpacity(0.2)
                        : ColorConstant.transparent,
                    border: Border(
                      left: BorderSide(
                          color: ColorConstant.yellow100,
                          width: chapter.Title == book.Chapters![index].Title!
                              ? 4
                              : 0),
                    )),
                child: Text(
                  book.Chapters![index].Title!,
                  style: chapter.Title == book.Chapters![index].Title!
                      ? AppStyle.txtNunitoSansSemiBold20Indigo900
                      : AppStyle.txtNunitoSansSemiBold20Gray900,
                ),
              ),
              //subtitle: comparateIndexPos(index, pos) ?  Text(book.Chapters![index + 1].Title!) : Text(''),
              onTap: () {
                print(book);
                // Navigator.pop(context);
                Navigator.pushNamed(context, ChapterPage.route,
                    arguments: EpubArguments(
                        book: book, chapter: book.Chapters![index]));
              },
            );
          }),
    );
  }
}
