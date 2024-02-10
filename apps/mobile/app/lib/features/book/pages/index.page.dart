import 'package:flutter/material.dart';
import 'package:mobile_app/core/app_export.dart';
import 'package:mobile_app/features/book/pages/chapter.page.dart';
import 'package:mobile_app/features/book/pages/chapter2.page.dart';
import 'package:mobile_app/widgets/app_bar/appbar_image.dart';
import 'package:mobile_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:mobile_app/widgets/app_bar/custom_app_bar.dart';

class IndexPage extends StatelessWidget {
  static const String route = 'book/index';

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as EpubArguments;
    final book = arguments.book;

    return Scaffold(
      body: Center(
        child: ListView.builder(
            itemCount: book!.Chapters!.length,
            itemBuilder: (context, index) => ListTile(
                  title: Text(
                    book.Chapters![index].Title!,
                    style: AppStyle.txtNunitoSansRegular16,
                  ),
                  onTap: () {
                    print(book);
                    Navigator.pop(context);
                    Navigator.popAndPushNamed(context, ChapterPage.route,
                        arguments: EpubArguments(
                            book: book, chapter: book.Chapters![index]));
                  },
                )),
      ),
    );
  }
}
