import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mobile_app/core/models/book.dart';
import 'package:mobile_app/core/models/pdf_viewer.dart';
import 'package:mobile_app/features/book/pages/pages.dart';
import 'package:vocsy_epub_viewer/epub_viewer.dart';

import '../../../core/app_export.dart';
import '../../../core/models/list_view_favorite.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/widgets.dart';
import '../../main/pages/home/widgets/widget.dart';

class ReadToolsPage extends StatelessWidget {
  static const String route = 'read-tools-route';
  const ReadToolsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;
    final Book book = arguments as Book;
    final boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: ColorConstant.whiteA700,
    );

    final borderRadius = BorderRadius.only(
        topLeft: Radius.circular(12), bottomLeft: Radius.circular(12));

    final List<ListViewFavoriteModel> items = [
      ListViewFavoriteModel(
          id: '1', title: 'Leer Libro', image: ImageConstant.imgBookmark),
      ListViewFavoriteModel(
          id: '2', title: 'Escuchar Libro', image: ImageConstant.imgMusic),
    ];

    const bool hasImage = true;

    void onTap(int index) async {
      print('ON Tap');
      switch (index) {
        case 0:
          VocsyEpub.setConfig(
            themeColor: Theme.of(context).primaryColor,
            identifier: "iosBook",
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
            'assets/epubs/${book.name}.epub',
            lastLocation: EpubLocator.fromJson({
              "bookId": "2239",
              "href": "/OEBPS/ch06.xhtml",
              "created": 1539934158390,
              "locations": {"cfi": "epubcfi(/0!/4/4[simple_book]/2/2/6)"}
            }),
          );
          break;
        case 1:
          Navigator.pushNamed(context, AudioPlayerScreen.route,
              arguments: book);
          break;
      }
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Método para memorizar textos bíblicos',
        backgroundColor: ColorConstant.indigo90033,
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
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: AssetImage('assets/images/${book.image}'),
                          fit: BoxFit.fill)),
                ),
              ],
            ),
            SizedBox(height: 20),
            //   CustomButton(
            //     margin: getMargin(left: 16, right: 16),
            //     fontStyle: ButtonFontStyle.NunitoSansSemiBold16,
            //     height: getVerticalSize(48),
            //     text: 'Continuar viendo',
            //     onTap: () {
            //       Navigator.pushNamed(context, 'book',
            //           arguments:
            //               EpubArguments(book: book, chapter: book!.Chapters![0]));
            //     }),
            // SizedBox(height: 16),
            CustomButton(
              width: 230,
              margin: getMargin(left: 16, right: 16),
              fontStyle: ButtonFontStyle.NunitoSansSemiBold16,
              height: getVerticalSize(48),
              variant: ButtonVariant.FillYellow,
              text: 'Leer Libro',
              onTap: () => {onTap(0)},
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
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     CustomIconButton(
            //       height: getSize(56),
            //       width: getSize(56),
            //       shape: IconButtonShape.CircleBorder28,
            //       variant: IconButtonVariant.FillGray400,
            //       onTap: () => {onTap(0)},
            //       child: CustomImageView(
            //         color: ColorConstant.red500,
            //         svgPath: ImageConstant.imgBookmark,
            //       ),
            //     ),
            //     SizedBox(width: 18),
            //     CustomIconButton(
            //       height: getSize(56),
            //       width: getSize(56),
            //       shape: IconButtonShape.CircleBorder28,
            //       variant: IconButtonVariant.FillAmber300,
            //       onTap: () => {onTap(1)},
            //       child: CustomImageView(
            //         color: ColorConstant.red500,
            //         svgPath: ImageConstant.imgMusic,
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(height: 30),
            // Column(
            //   children: [
            //     Padding(
            //         padding: EdgeInsets.only(left: 14.0),
            //         child: Align(
            //           alignment: Alignment.centerLeft,
            //           child: Text('Actividades diarias',
            //               style: TextStyle(fontSize: 18)),
            //         )),
            //     SizedBox(height: 14),
            //     Padding(
            //       padding:
            //           EdgeInsets.only(left: 14.0, right: 14.0, bottom: 14.0),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           ExpandedButton(
            //               icon: ImageConstant.imgButtonalerts,
            //               label: 'Lecturas'),
            //           SizedBox(width: 14.0),
            //           ExpandedButton(
            //               icon: ImageConstant.imgMusic, label: 'Oraciones'),
            //         ],
            //       ),
            //     )
            //   ],
            // ),
            // ListView.separated(
            //   shrinkWrap: true,
            //   itemBuilder: (_, int index) {
            //     final item = items[index];

            //     return GestureDetector(
            //       onTap: () => {onTap(index)},
            //       child: Container(
            //         margin: getMargin(left: 16, right: 16),
            //         width: double.infinity,
            //         height: getSize(88),
            //         decoration: boxDecoration,
            //         child: Row(
            //           children: [
            //             // Content
            //             Expanded(
            //               child: Padding(
            //                 padding: EdgeInsets.symmetric(horizontal: 16),
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     Text(
            //                       item.title,
            //                       style:
            //                           AppStyle.txtNunitoSansSemiBold20Black900,
            //                     ),
            //                     CustomIconButton(
            //                       height: getSize(48),
            //                       width: getSize(48),
            //                       variant: IconButtonVariant.FillIndigo90033,
            //                       child: CustomImageView(
            //                         color: ColorConstant.red500,
            //                         svgPath: item.image,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             )
            //           ],
            //         ),
            //       ),
            //     );
            //   },
            //   separatorBuilder: (_, __) => SizedBox(height: 8),
            //   itemCount: items.length,
            // )
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
          onTap: () => {onTap(1)},
          child: CustomImageView(
            color: ColorConstant.red500,
            svgPath: ImageConstant.imgMusic,
          ),
        ),
      ),
    );
  }
}
