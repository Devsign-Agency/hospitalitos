import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_app/features/book/screens/screens.dart';
import 'package:provider/provider.dart';
import '../../../../core/app_export.dart';
import '../../../../shared/shared.dart';
import '../../../../themes/themes.dart';
import '../../../../widgets/widgets.dart';
import 'package:epub_view/epub_view.dart' hide Image;
import 'package:image/image.dart' hide Image;

class EpubIndexScreen extends StatefulWidget {
  static const String route = 'book/index';
  @override
  State<EpubIndexScreen> createState() => _IndexPageState();
}

class _IndexPageState extends State<EpubIndexScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  FToast? fToast;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    fToast = FToast();
    fToast?.init(context);
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as EpubArguments;
    final book = arguments.book;

    return Scaffold(
      appBar: CustomAppBar(title: book?.Title!),
      body: Column(
        children: [
          CustomTabBar(
              labelColor: ColorConstant.black9004c,
              tabController: tabController,
              items: IndexService.tabBarItems),

          // TabBarView
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                // Books Tab
                _ListChaptersOfBook(book: book),
                _ChapterDetail(book: book),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChapterDetail extends StatelessWidget {
  const _ChapterDetail({
    super.key,
    required this.book,
  });

  final EpubBook? book;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkTheme = themeProvider.currentTheme == DarkTheme.theme;
    TextStyle textStyle = AppStyle.txtNunitoSansRegular18Gray900.copyWith(
        color: isDarkTheme ? ColorConstant.whiteA700 : ColorConstant.gray900);
    return SizedBox(
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
                      Uint8List.fromList(encodePng(book!.CoverImage!)),
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
                          style: textStyle,
                        ),
                      ),
                      SizedBox(
                        width: 220,
                        child: Text(
                          book!.Title!,
                          style: textStyle,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      SizedBox(
                        width: 220,
                        child: Text(
                          'Autor:',
                          style: textStyle,
                        ),
                      ),
                      SizedBox(
                        width: 220,
                        child: Text(
                          book!.Author!,
                          style: textStyle,
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
    );
  }
}

class _ListChaptersOfBook extends StatelessWidget {
  const _ListChaptersOfBook({
    super.key,
    required this.book,
  });

  final book;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    BookService bookService = Provider.of<BookService>(context, listen: false);

    bool isDarkTheme = themeProvider.currentTheme == DarkTheme.theme;

    return ListView.builder(
        shrinkWrap: true,
        //physics: const NeverScrollableScrollPhysics(),
        //scrollDirection: Axis.vertical,
        itemCount: book!.Chapters!.length,
        itemBuilder: (context, index) {
          var title = (book?.Chapters![index].Title!).toString();

          return title != ''
              ? Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: book?.Chapters![index].SubChapters.length > 0
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
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      book.Chapters![index].SubChapters.length,
                                  itemBuilder: (BuildContext context, int i) {
                                    var subtititle = book
                                        .Chapters![index].SubChapters[i].Title!
                                        .toString();

                                    return ListTile(
                                      onTap: () {
                                        bookService.chapterTitle = title;
                                        var sub =
                                            book.Chapters![index].SubChapters;
                                        bookService.chapterIndex = index;
                                        bookService.subchapterIndex = i;
                                        bookService.subchapterSelected = book
                                            .Chapters![index].SubChapters[i];
                                        Navigator.pushNamed(
                                            context, ChapterScreen.route,
                                            arguments: EpubArguments(
                                                book: book,
                                                chapter: book.Chapters![index]
                                                    .SubChapters[i]));
                                      },
                                      title: Title(
                                          color: isDarkTheme
                                              ? ColorConstant.whiteA700
                                              : ColorConstant.amber300,
                                          child: Text(subtititle)),
                                    );
                                  })
                            ])
                      : ListTile(
                          title: Text(
                              (book?.Chapters![index].Title!).toString(),
                              style: AppStyle.txtNunitoSansSemiBold20Gray900
                                  .copyWith(
                                      color: isDarkTheme
                                          ? ColorConstant.whiteA700
                                          : ColorConstant.gray900)),
                          onTap: () {
                            bookService.subchapterSelected =
                                book?.Chapters![index];
                            bookService.chapterIndex = index;
                            bookService.subchapterIndex = 0;
                            bookService.chapterTitle = title;

                            Navigator.pushNamed(context, ChapterScreen.route,
                                arguments: EpubArguments(
                                    book: book,
                                    chapter: book?.Chapters![index]));
                          }),
                )
              : Container();
        });
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
