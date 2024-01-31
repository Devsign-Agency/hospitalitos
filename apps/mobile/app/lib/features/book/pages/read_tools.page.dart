import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mobile_app/core/models/pdf_viewer.dart';
import 'package:mobile_app/features/book/pages/pages.dart';
import 'package:vocsy_epub_viewer/epub_viewer.dart';

import '../../../core/app_export.dart';
import '../../../core/models/list_view_favorite.dart';
import '../../../widgets/widgets.dart';

class ReadToolsPage extends StatelessWidget {
  static const String route = 'read-tools-route';
  const ReadToolsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: ColorConstant.whiteA700,
    );

    final borderRadius = BorderRadius.only(
        topLeft: Radius.circular(12), bottomLeft: Radius.circular(12));

    final List<ListViewFavoriteModel> items = [
      ListViewFavoriteModel(id: '1', title: 'Leer Libro'),
      ListViewFavoriteModel(id: '2', title: 'Escuchar Libro'),
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
            'assets/epubs/G.A.E.epub',
            lastLocation: EpubLocator.fromJson({
              "bookId": "2239",
              "href": "/OEBPS/ch06.xhtml",
              "created": 1539934158390,
              "locations": {"cfi": "epubcfi(/0!/4/4[simple_book]/2/2/6)"}
            }),
          );
          break;
        case 1:
          Navigator.pushNamed(context, AudioPlayerScreen.route);
          break;
      }
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (_, int index) {
                final item = items[index];

                return GestureDetector(
                  onTap: () => {onTap(index)},
                  child: Container(
                    margin: getMargin(left: 16, right: 16),
                    width: double.infinity,
                    height: getSize(88),
                    decoration: boxDecoration,
                    child: Row(
                      children: [
                        // Content
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item.title,
                                  style:
                                      AppStyle.txtNunitoSansSemiBold20Black900,
                                ),
                                CustomIconButton(
                                  height: getSize(48),
                                  width: getSize(48),
                                  variant: IconButtonVariant.FillRed50033,
                                  child: CustomImageView(
                                    color: ColorConstant.red500,
                                    svgPath: ImageConstant.imgTrashRed500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (_, __) => SizedBox(height: 8),
              itemCount: items.length,
            )
          ],
        ),
      ),
    );
  }
}
