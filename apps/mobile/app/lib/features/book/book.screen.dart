import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/core/app_export.dart';
import 'package:mobile_app/features/book/pages/pages.dart';
import 'package:mobile_app/globals/states/app.state.dart';
import 'package:mobile_app/shared/shared.dart';
import 'package:mobile_app/widgets/app_bar/appbar_image.dart';
import 'package:mobile_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:mobile_app/widgets/app_bar/custom_app_bar.dart';
import 'package:mobile_app/widgets/book_bottom_bar.dart';
import 'package:mobile_app/widgets/widgets.dart';
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
  final TextToSpeech tts = TextToSpeech();
  bool playing = false;

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
            actions: [(
              playing ? 
              CustomIconButton(
                      height: 38,
                      width: 38,
                      alignment: Alignment.center,
                      padding: IconButtonPadding.PaddingAll5,
                      variant: IconButtonVariant.FillGray300,
                      onTap: () => _stopText(),
                      child: CustomImageView(
                        color: ColorConstant.gray800,
                        svgPath: ImageConstant.imgMusic,
                      ),
                    )
              : 
              AppbarImage(
                  height: getSize(24),
                  width: getSize(24),
                  svgPath: ImageConstant.imgMusic,
                  color: ColorConstant.gray900,
                  margin: getMargin(left: 7, right: 14),
                  onTap: () => _playText(chapter),
              )),
              AppbarImage(
                  height: getSize(24),
                  width: getSize(24),
                  svgPath: ImageConstant.imgOverflowmenu,
                  color: ColorConstant.gray900,
                  margin: getMargin(left: 0, right: 14)
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

  _playText(EpubChapter? chapter) async {
    if (chapter != null) {
      String? content = chapter.HtmlContent;
      if (content != null) {
        setState(() { playing = true; });
        await tts.play(content);
      }
    }
  }

  _pauseText() async {
    await tts.pause();
    setState(() { playing = false; });
  }

  _stopText() async {
    await tts.pause();
    setState(() { playing = false; });
  }

  onTapArrowleft12(BuildContext context) {
    Navigator.pop(context);
  }
}
