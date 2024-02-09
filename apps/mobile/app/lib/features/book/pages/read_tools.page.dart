import 'package:flutter/material.dart';
import 'package:mobile_app/core/models/book.dart';
import 'package:mobile_app/features/book/pages/pages.dart';
import 'package:vocsy_epub_viewer/epub_viewer.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/widgets.dart';

class ReadToolsPage extends StatelessWidget {
  static const String route = 'read-tools-route';
  const ReadToolsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;
    final Book book = arguments as Book;

    void openEpubBook() async {
      String path = 'assets/epubs/${book.path}.epub';

      VocsyEpub.setConfig(
        themeColor: Theme.of(context).primaryColor,
        identifier: 'iosBook',
        scrollDirection: EpubScrollDirection.ALLDIRECTIONS,
        allowSharing: true,
        enableTts: true,
        nightMode: false,
      );

      // get current locator
      VocsyEpub.locatorStream.listen((locator) {
        print('LOCATOR: $locator');
      });

      await VocsyEpub.openAsset(
        path,
        lastLocation: EpubLocator.fromJson({
          'bookId': '2239',
          'href': '/OEBPS/ch06.xhtml',
          'created': 1539934158390,
          'locations': {'cfi': 'epubcfi(/0!/4/4[simple_book]/2/2/6)'}
        }),
      );
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: book.name,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 230,
                  height: 295.0,
                  decoration: BoxDecoration(
                      color: ColorConstant.indigo90033,
                      boxShadow: [
                        BoxShadow(
                          color: ColorConstant.purple50,
                          spreadRadius: 8,
                          blurRadius: 10,
                          offset: Offset(0, 0),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: AssetImage('assets/images/${book.image}'),
                          fit: BoxFit.fill)),
                ),
              ],
            ),
            SizedBox(height: 20),
            CustomButton(
              width: 230,
              margin: getMargin(left: 16, right: 16),
              fontStyle: ButtonFontStyle.NunitoSansSemiBold16,
              height: getVerticalSize(48),
              variant: ButtonVariant.FillYellow,
              text: 'Leer Libro',
              onTap: () => {openEpubBook()},
            ),
            SizedBox(height: 18),
            CustomButton(
                width: 230,
                margin: getMargin(left: 16, right: 16),
                fontStyle: ButtonFontStyle.NunitoSansSemiBold16,
                height: getVerticalSize(48),
                variant: ButtonVariant.OutlineIndigo900,
                text: 'Descargar',
                onTap: () {}),
            SizedBox(height: 30),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: CustomIconButton(
          height: getSize(56),
          width: getSize(56),
          shape: IconButtonShape.CircleBorder28,
          variant: IconButtonVariant.FillGray400,
          onTap: () => Navigator.pushNamed(context, AudioPlayerScreen.route,
              arguments: book),
          child: CustomImageView(
            color: ColorConstant.indigo900,
            svgPath: ImageConstant.imgMusic,
          ),
        ),
      ),
    );
  }
}
