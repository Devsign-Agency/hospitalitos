import 'dart:typed_data';

import 'package:epub_view/epub_view.dart' hide Image;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' hide Image;
import 'package:mobile_app/core/app_export.dart';
import 'package:provider/provider.dart';
import '../../../shared/shared.dart';
import '../../../themes/themes.dart';
import '../../../widgets/widgets.dart';
import '../screens/screens.dart';

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
          top: 38,
          right: 10,
          child: CustomIconButton(
            margin: getMargin(left: 8),
            height: getSize(32),
            width: getSize(32),
            shape: IconButtonShape.CircleBorder24,
            variant: IconButtonVariant.FillTransparent,
            onTap: () => Navigator.pop(context),
            child: CustomImageView(
              svgPath: ImageConstant.imgClose,
              color: ColorConstant.whiteA700,
            ),
          ),
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

class _DrawerTableContent extends StatefulWidget {
  final EpubBook book;

  const _DrawerTableContent({super.key, required this.book});

  @override
  State<_DrawerTableContent> createState() => _DrawerTableContentState();
}

class _DrawerTableContentState extends State<_DrawerTableContent> {
  double offsetScroll = 0;
  ScrollController scrollController =
      ScrollController(initialScrollOffset: 0.0);

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      DrawerService drawerService =
          Provider.of<DrawerService>(context, listen: false);
      scrollController.addListener(() {
        drawerService.offset = scrollController.position.pixels;
      });

      if (scrollController.hasClients) {
        await scrollController.animateTo(drawerService.offset,
            duration: Duration(milliseconds: 100), curve: Curves.bounceIn);
      }

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkTheme = themeProvider.currentTheme == DarkTheme.theme;

    BookService bookService = Provider.of<BookService>(context, listen: false);

    return Flexible(
      child: ListView.builder(
          controller: scrollController,
          padding: getPadding(top: 0),
          shrinkWrap: true,
          itemCount: widget.book!.Chapters!.length,
          itemBuilder: (context, index) {
            var title = (widget.book?.Chapters![index].Title!).toString();

            return title != ''
                ? widget.book.Chapters![index].SubChapters!.isNotEmpty
                    ? ExpansionTile(
                        initiallyExpanded: bookService.chapterIndex == index,
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
                                itemCount: widget
                                    .book.Chapters![index].SubChapters?.length,
                                itemBuilder: (BuildContext context, int i) {
                                  var subtititle = widget.book.Chapters![index]
                                      .SubChapters?[i].Title!
                                      .toString();

                                  return ListTile(
                                    contentPadding: getPadding(all: 0),
                                    onTap: () {
                                      bookService.chapterTitle = title;
                                      bookService.chapterIndex = index;
                                      bookService.subchapterIndex = i;
                                      bookService.subchapterSelected = widget
                                          .book
                                          .Chapters![index]
                                          .SubChapters![i];
                                      Navigator.pop(context);
                                      Navigator.popAndPushNamed(
                                          context, ChapterScreen.route,
                                          arguments: EpubArguments(
                                              book: widget.book,
                                              chapter: widget
                                                  .book
                                                  .Chapters![index]
                                                  .SubChapters?[i]));
                                    },
                                    title: Container(
                                      padding: getPadding(left: 20),
                                      color: bookService.chapterIndex ==
                                                  index &&
                                              bookService.subchapterIndex == i
                                          ? ColorConstant.yellow100
                                              .withOpacity(0.2)
                                          : null,
                                      child: Title(
                                          color: isDarkTheme
                                              ? ColorConstant.whiteA700
                                              : ColorConstant.amber300,
                                          child: Text(
                                            subtititle!,
                                          )),
                                    ),
                                  );
                                })
                          ])
                    : ListTile(
                        contentPadding: getPadding(all: 0),
                        title: Container(
                          padding: getPadding(left: 20),
                          color: bookService.chapterIndex == index
                              ? ColorConstant.yellow100.withOpacity(0.2)
                              : null,
                          child: Text(
                            (widget.book.Chapters![index].Title!).toString(),
                            style: AppStyle.txtNunitoSansSemiBold20Gray900
                                .copyWith(
                                    color: isDarkTheme
                                        ? ColorConstant.whiteA700
                                        : ColorConstant.gray900),
                          ),
                        ),
                        onTap: () {
                          bookService.subchapterSelected =
                              widget.book.Chapters![index];
                          bookService.chapterIndex = index;
                          bookService.subchapterIndex = 0;
                          bookService.chapterTitle = title;
                          Navigator.pop(context);

                          Navigator.popAndPushNamed(
                              context, ChapterScreen.route,
                              arguments: EpubArguments(
                                  book: widget.book,
                                  chapter: widget.book?.Chapters![index]));
                        })
                : SizedBox();
          }),
    );
  }
}
