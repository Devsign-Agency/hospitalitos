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
                
                 /* title: Text(
                    showTitle(book.Chapters![index].Title!, index, book!.Chapters!.length),
                    style: AppStyle.txtNunitoSansRegular14,
               
                  ),*/
                  subtitle: Text(book.Chapters![index].Title!),
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

  showTitle(String data, index, items){
    print('title---------------- $data $index $items');
    var textToShow = '';
  
  
    return data;
  }
}
