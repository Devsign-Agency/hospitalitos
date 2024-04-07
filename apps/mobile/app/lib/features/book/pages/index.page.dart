// import 'dart:typed_data';

// import 'package:epub_view/epub_view.dart';
// import 'package:flutter/material.dart';
// import 'package:image/image.dart';
// import 'package:mobile_app/core/app_export.dart';
// import 'package:mobile_app/features/book/pages/chapter.page.dart';
// import 'package:mobile_app/shared/services/index_service.dart';

// import '../../../widgets/widgets.dart';

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobile_app/features/book/pages/pages.dart';

import '../../../../core/app_export.dart';

import '../../../../widgets/widgets.dart';

import 'package:epub_view/epub_view.dart' hide Image;
import 'package:image/image.dart' hide Image;

import '../../../shared/shared.dart';

class IndexPage extends StatefulWidget {
  static const String route = 'book/index';
  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as EpubArguments;
    final book = arguments.book;
    var count = 0;
    Image image =
        Image.memory(Uint8List.fromList(encodePng(book!.CoverImage!)));
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(
        title: book?.Title!,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Tab items
              CustomTabBar(
                  tabController: tabController,
                  items: IndexService.tabBarItems),

              // TabBarView
              Container(
                margin: EdgeInsets.all(10),
                child: SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      // Books Tab
                      ListChaptersOfBook(book: book),
                  
                      SizedBox(
                        height: 100,
                        width: 600,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox.fromSize(
                                    size: Size.fromRadius(58), // Image radius
                                    child: Image.memory(
                                        Uint8List.fromList(
                                            encodePng(book.CoverImage!)),
                                        fit: BoxFit.cover),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                          SizedBox(
                                          width: 220,
                                          child: Text(
                                            'Titulo:',
                                            style: AppStyle
                                                .txtNunitoSansRegular18Gray9001,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 220,
                                          child: Text(
                                            book!.Title!,
                                            style: AppStyle
                                                .txtNunitoSansRegular18Gray9001,
                                          ),
                                        ),
                                         SizedBox(
                                          width:10,
                                          height: 10,
                                          
                                        ),
                                         SizedBox(
                                          width: 220,
                                          child: Text(
                                            'Autor:',
                                            style: AppStyle
                                                .txtNunitoSansRegular18Gray9001,
                                          ),
                                        ),
                                        SizedBox(
                                           width: 220,
                                          child: Text(
                                            book!.Author!,
                                            style: AppStyle
                                                .txtNunitoSansRegular18Gray9001,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showTitle(String data, index, items) {
    print('title---------------- $data $index $items');
    var textToShow = '';

    return data;
  }

  findOcurrenceChapterArr(book) {
    var band = true;
    var pos = [];
    for (var i = 0; i < book!.Chapters!.length; i++) {
      String mainString = book.Chapters![i].Title.toLowerCase();
      String substring = "capítulo";

      if (mainString.contains(substring)) {
        band = false;
        pos.add(i);
      }
    }

    return pos;
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

  changeTitle(book, index) {
    var title = book.Title;
    var band = true;
    print(title.toLowerCase().split(':')[0]);
    if ((title.toLowerCase().split(':')[0].contains('capítulo') ||
            title.toLowerCase().split(':')[0].contains('capitulo')) &&
        book.SubChapters!.isEmpty) {
      title = '';
      band = false;
    }

    print('title $title');

    return band;
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

  subChaptersMenu(data, book) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(
                data[index].Title!,
                style: AppStyle.txtNunitoSansRegular16,
              ),
              onTap: () {
                // Navigator.pop(context);
                Navigator.pushNamed(context, ChapterPage.route,
                    arguments: EpubArguments(
                        book: book, chapter: book.Chapter[index]));
              });
        },
        itemCount: data.length);
  }
}

class ListChaptersOfBook extends StatelessWidget {
  const ListChaptersOfBook({
    super.key,
    required this.book,
  });

  final book;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          itemCount: book!.Chapters!.length,
          itemBuilder: (context, index) {
            var title = (book?.Chapters![index].Title!).toString();
            return title != ''
                ? ListTile(
                    title: Text(
                      title,
                      style: AppStyle.txtNunitoSansSemiBold20Gray900,
                    ),
                    onTap: () {
                      // Navigator.pop(context);
                      Navigator.pushNamed(context, ChapterPage.route,
                          arguments: EpubArguments(
                              book: book, chapter: book?.Chapters![index]));
                    })
                : Container();
          }),
    );
  }
}
