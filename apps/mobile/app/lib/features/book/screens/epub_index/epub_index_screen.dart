import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_app/features/book/screens/screens.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import '../../../../core/app_export.dart';
import '../../../../core/models/viewed_preview.dart';
import '../../../../shared/shared.dart';
import '../../../../themes/themes.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/widgets.dart';
import 'package:epub_view/epub_view.dart' hide Image;
import 'package:image/image.dart' hide Image;

import '../../../library/widgets/tab_view_chapters.dart';
import '../../../library/widgets/widgets.dart';

class EpubIndexScreen extends StatefulWidget {
  static const String route = 'book/index';

  const EpubIndexScreen({super.key});

  @override
  State<EpubIndexScreen> createState() => _PreviewBookScreenState();
}

class _PreviewBookScreenState extends State<EpubIndexScreen> {
  var _scrollController = ScrollController();
  bool _isExpanded = false;
  @override
  void initState() {
    _scrollController.addListener(() {
      setState(() {
        _isExpanded = _isSliverAppBarExpanded;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as EpubArguments;
    final book = arguments.book;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            _CustomAppBar(
              title: book!.Title!,
              isExpanded: _isExpanded,
            ),
          ],
          body: GestureDetector(
            child: TabBarView(children: [
              // Chapters
              _ListChaptersOfBook(book: book),

              // Recommended
              _ChapterDetail(book: book),

              // Commentaries
              TabViewComments(),
            ]),
          ),
        ),
      ),
    );
  }

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients && _scrollController.offset > (50);
  }
}

class _CustomAppBar extends StatelessWidget {
  final String title;
  final bool isExpanded;

  const _CustomAppBar(
      {super.key, required this.isExpanded, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      expandedHeight: 360,
      floating: false,
      // pinned: true,
      // title: Text(title, style: AppStyle.txtNunitoSansSemiBold23WhiteA700),
      title: LayoutBuilder(builder: (context, constraints) {
        print(constraints);
        return Text(
          'My title',
          style: constraints.maxHeight > 150
              ? AppStyle.txtNunitoSansSemiBold23WhiteA700
              : AppStyle.txtNunitoSansSemiBold20Black900,
        );
      }),
      bottom: TabBar(
        labelColor: ColorConstant.indigo900,
        indicatorColor: ColorConstant.indigo900,
        indicatorSize: TabBarIndicatorSize.label,
        unselectedLabelColor: ColorConstant.gray200,
        tabAlignment: TabAlignment.fill,
        tabs: [
          Tab(
              child: Text(
            'Indice',
            style: AppStyle.txtNunitoSansSemiBold16Indigo900,
          )),
          Tab(
              child: Text(
            'Recomendados',
          )),
          Tab(child: Text('Comentarios')),
        ],
      ),
      flexibleSpace: FlexibleSpaceBar(
        // centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        background: _FlexibleSpaceBarBackground(),
      ),
      actions: [
        CustomImageView(
          svgPath: ImageConstant.imgFavWhite24x24,
          width: getSize(24),
          height: getSize(24),
          color: ColorConstant.whiteA700,
        ),
        SizedBox(width: 32),
        CustomImageView(
          svgPath: ImageConstant.imgShare,
          width: getSize(24),
          height: getSize(24),
          color: ColorConstant.whiteA700,
          onTap: () => showModalBottomSheet(
              backgroundColor: ColorConstant.gray50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              context: context,
              builder: (context) => Text('test')),
        ),
        SizedBox(width: 16),
      ],
    );
  }
}

class _FlexibleSpaceBarBackground extends StatefulWidget {
  const _FlexibleSpaceBarBackground({
    super.key,
  });

  @override
  State<_FlexibleSpaceBarBackground> createState() =>
      _FlexibleSpaceBarBackgroundState();
}

class _FlexibleSpaceBarBackgroundState
    extends State<_FlexibleSpaceBarBackground> {
  late VideoPlayerController _controller;
  late String _fileName;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as EpubArguments;
    final book = arguments.book;
    Image image =
        Image.memory(Uint8List.fromList(encodePng(book!.CoverImage!)));

    return SizedBox(
      width: double.infinity,
      height: 180.0,
      // color: Colors.red.withOpacity(0.3),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 220.0,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: image.image, fit: BoxFit.cover)),
              ),
              Positioned(
                  right: 20,
                  bottom: 14,
                  child: Text(
                    book.AuthorList![0]!,
                    style: AppStyle.txtNunitoSansSemiBold16WhiteA700,
                  ))
            ],
          ),
          SizedBox(height: 16),
          CustomButton(
              margin: getMargin(left: 16, right: 16),
              fontStyle: ButtonFontStyle.NunitoSansSemiBold16,
              height: getVerticalSize(48),
              text: 'Continuar viendo',
              onTap: () {
                Navigator.pushNamed(context, 'book',
                    arguments:
                        EpubArguments(book: book, chapter: book!.Chapters![0]));
              }),
          SizedBox(height: 16),
          CustomButton(
              margin: getMargin(left: 16, right: 16),
              fontStyle: ButtonFontStyle.NunitoSansSemiBold16,
              height: getVerticalSize(48),
              variant: ButtonVariant.OutlineIndigo900,
              text: 'Descargar',
              onTap: () {}),
        ],
      ),
    );
  }
}

// class EpubIndexScreen extends StatefulWidget {
//   static const String route = '';
//   @override
//   State<EpubIndexScreen> createState() => _IndexPageState();
// }

// class _IndexPageState extends State<EpubIndexScreen>
//     with TickerProviderStateMixin {
//   late TabController tabController;

//   FToast? fToast;

//   @override
//   void initState() {
//     super.initState();
//     tabController = TabController(length: 2, vsync: this);
//     fToast = FToast();
//     fToast?.init(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final arguments =
//         ModalRoute.of(context)!.settings.arguments as EpubArguments;
//     final book = arguments.book;

//     return Scaffold(
//       appBar: CustomAppBar(title: book?.Title!),
//       body: Column(
//         children: [
//           CustomTabBar(
//               labelColor: ColorConstant.black9004c,
//               tabController: tabController,
//               items: IndexService.tabBarItems),

//           // TabBarView
//           Expanded(
//             child: TabBarView(
//               controller: tabController,
//               children: [
//                 // Books Tab
//                 _ListChaptersOfBook(book: book),
//                 _ChapterDetail(book: book),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

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
        padding: getPadding(top: 0),
        shrinkWrap: true,
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
                                  padding: getPadding(top: 0),
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
}
