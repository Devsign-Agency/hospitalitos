import 'package:flutter/material.dart';
import 'package:mobile_app/core/app_export.dart';
import 'package:mobile_app/features/book/pages/chapter.page.dart';

import '../../../widgets/widgets.dart';

class IndexPage extends StatelessWidget {
  static const String route = 'book/index';

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as EpubArguments;
    final book = arguments.book;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Índiceeeee',
      ),
      body: Center(
        child: ListView.builder(
            itemCount: book!.Chapters!.length,
            itemBuilder: (context, index) {
              // Enumerating chapters
              book.Chapters?.forEach((chapter) {
                // HTML content of current chapter
                String? chapterHtmlContent = chapter.HtmlContent;
              });
              print('hey ${book.Chapters![index]}');
              return findOcurrenceChapterArr(book, index)
                  ? ListTile(
                      trailing: Icon(Icons.more_vert),
                      title: Text(
                        book.Chapters![index].Title!,
                        style: AppStyle.txtNunitoSansRegular16,
                      ),
                      //subtitle: comparateIndexPos(index, pos) ?  Text(book.Chapters![index + 1].Title!) : Text(''),
                      onTap: () {
                        print(book);
                        // Navigator.pop(context);
                        Navigator.pushNamed(context, ChapterPage.route,
                            arguments: EpubArguments(
                                book: book, chapter: book.Chapters![index]));
                      },
                    )
                  : Container();
            }),
      ),
    );
  }

  showTitle(String data, index, items) {
    print('title---------------- $data $index $items');
    var textToShow = '';

    return data;
  }

  findOcurrenceChapterArr(book, index) {
    var band = false;
    var pos = [];

    String mainString = book.Chapters[index].Title.toLowerCase();
    String substring = "capítulo";

    if (!mainString.contains(substring)) {
      band = true;
    }
    if (index > 0) {
      var word = book.Chapters[index - 1].Title.toLowerCase().split(' ')[0];
      print('epaleee $word');
      if (word == 'capítulo') {
        book.Title = 'Capítulo: ' + book.Title;
      }
    }

    return band;
  }

  makeDataToShow(book) {
    var band = true;
    var pos = [];
    for (var i = 0; i < book!.Chapters!.length; i++) {
      String mainString = book.Chapters![i].Title.toLowerCase();
      String substring = "capítulo";

      if (mainString.contains(substring)) {
        band = false;
        //book.Chapters![i].Title = book.Chapters![i].Title + '\n'+ book.Chapters![i + 1].Title;
      }
    }

    return pos;
  }

  comparateIndexPos(index, items) {
    var band = false;
    for (var i = 0; i < items.length; i++) {
      if (items[i] == index) {
        band = true;
      }
    }

    return band;
  }

  valueArrMenor(index, items) {
    var band = false;
    for (var i = 0; i < items.length; i++) {
      if (items[i] < index) {
        band = true;
      }
    }

    return band;
  }

  valueArrMax(index, items) {
    var band = false;
    for (var i = 0; i < items.length; i++) {
      if (items[i] > index) {
        band = true;
      }
    }

    return band;
  }
}
