import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/core/app_export.dart';
import 'package:mobile_app/features/book/pages/pages.dart';
import 'package:mobile_app/globals/states/app.state.dart';
import 'package:mobile_app/widgets/app_bar/appbar_image.dart';
import 'package:mobile_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:mobile_app/widgets/app_bar/custom_app_bar.dart';
import 'package:mobile_app/widgets/book_bottom_bar.dart';
import 'package:provider/provider.dart';

class BookScreen extends StatefulWidget {
  static const String route = 'book';

  BookScreen({Key? key, int? selectedIndex, ScrollController? mainController})
      : super(key: key);

  @override
  State<BookScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<BookScreen> {
  int selectedIndex = 0;
  final ScrollController mainController = ScrollController();

  void _onItemTapped(int index, BuildContext context, EpubBook book) {
    switch (index) {
      case 2:
        Navigator.pushNamed(context, 'book/index', arguments: EpubArguments(book: book));
        break;
      default:
        setState(() {
          selectedIndex = index;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as EpubArguments;
    final book = arguments.book;
    final chapter = arguments.chapter;

    Widget page;
    switch (selectedIndex) {
      case 0:
        page = Placeholder();
        break;
      case 1:
        page = Placeholder();
        break;
      case 2:
        page = IndexPage();
        break;
      case 3:
        page = Placeholder();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: CustomAppBar(
            height: getVerticalSize(48),
            leadingWidth: 31,
            leading: AppbarImage(
                height: getSize(20),
                width: getSize(20),
                svgPath: ImageConstant.imgArrowleftGray900,
                color: ColorConstant.gray900,
                margin: getMargin(left: 7),
                onTap: () => onTapArrowleft12(context)),
            title:
                AppbarSubtitle(text: book!.Title!, margin: getMargin(left: 7)),
            actions: [
              AppbarImage(
                  height: getSize(24),
                  width: getSize(24),
                  svgPath: ImageConstant.imgMusic,
                  color: ColorConstant.gray900,
                  margin: getMargin(left: 7, right: 7)
              ),
              AppbarImage(
                  height: getSize(24),
                  width: getSize(24),
                  svgPath: ImageConstant.imgOverflowmenu,
                  color: ColorConstant.gray900,
                  margin: getMargin(left: 7, right: 14)
              )
            ],
            styleType: Style.bgFillWhiteA700),
        bottomNavigationBar: BookBottomBar(
            onChanged: (index) => _onItemTapped(index, context, book)),
        body: ChapterPage(book: book, chapter: chapter!),
      ),
      //   child: EpubReader()
    );
  }

  onTapArrowleft12(BuildContext context) {
    Navigator.pop(context);
  }
}
