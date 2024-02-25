import 'dart:io';
import 'dart:typed_data';

import 'package:epub_view/epub_view.dart' hide Image;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' hide Image;
import 'package:mobile_app/core/app_export.dart';
import 'package:mobile_app/features/book/pages/pages.dart';
import 'package:mobile_app/widgets/custom_card.dart';
import 'package:mobile_app/widgets/custom_image_view.dart';
import 'package:mobile_app/widgets/modal_bottom_sheet.dart';
import 'package:path_provider/path_provider.dart';

import '../features/book/pages/index.page.dart';
import 'modal_bottom_actiosn_epub.dart';

class CardPreviewItemList extends StatelessWidget {
  final Future<List<EpubBook>> future;
  final onTappedItem;
  const CardPreviewItemList(
      {super.key, required this.future, required this.onTappedItem});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 14.0),
        height: 190.0,
        width: double.infinity,
        child: FutureBuilder<List<EpubBook>>(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Si estamos cargando los datos, mostramos un indicador de carga
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // Si hubo un error al cargar los datos, mostramos un mensaje de error
              return Center(child: Text('Error al cargar los datos'));
            } else {
              // Si los datos se cargaron correctamente, los mostramos en un ListView
              int length = snapshot.data!.length + 2;
              return ListView.builder(
                itemCount: length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return SizedBox(width: 14);
                  } else if (index == length - 1) {
                    return SizedBox(width: 6);
                  } else {
                    EpubBook book = snapshot.data![index - 1];
                    print(book);
                    Image image = Image.memory(
                        Uint8List.fromList(encodePng(book.CoverImage!)));

                    String title = book.Title!.trim();
                    print(title);

                    final List<Map<String, dynamic>> menuOptions = [
                      {
                        'name': 'Leer libro',
                        'icon': ImageConstant.imgButtonalerts,
                        'link': book,
                      },
                      {
                        'name': 'Escuchar libro',
                        'icon': ImageConstant.imgMusic,
                        'route': '',
                      },
                      {
                        'name': 'Descargar',
                        'icon': ImageConstant.imgDownloadGray30024x24,
                        'route': '',
                      },
                    ];
                    return _ViewedPreview(
                      onTap: () => {onTap(context, book)},
                      /* onTap: () => {
                        showModalBottomSheet(
                            backgroundColor: ColorConstant.gray50,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0)),
                            context: context,
                            builder: (context) => ModalBottomActions(items:menuOptions))
                      },
                      */
                      backgroundImage: image,
                      progressValue: 0.0,
                      title: title,
                    );
                  }
                },
              );
            }
          },
        ));
  }

  // onTap(context, EpubBook book) {
  //   Navigator.pushNamed(context, 'preview-book');
  // }

  onTap(context, EpubBook book) {
    Navigator.pushNamed(context, IndexPage.route,
        arguments: EpubArguments(book: book, chapter: book.Chapters![0]));
  }

  MyContent(epub) {
    final List<Map<String, dynamic>> menuOptions = [
      {
        'name': 'Leer libro',
        'icon': ImageConstant.imgButtonalerts,
        'route': epub,
      },
      {
        'name': 'Escuchar libro',
        'icon': ImageConstant.imgMusic,
        'route': '',
      },
      {
        'name': 'Descargar',
        'icon': ImageConstant.imgDownloadGray30024x24,
        'route': '',
      },
    ];
    return SizedBox(
      width: 200,
      height: 200,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: menuOptions.length,
          itemBuilder: (context, index) {
            final option = menuOptions[index];

            return CustomCard(
              margin: getMargin(top: 0),
              child: Row(
                children: [
                  CustomImageView(
                    width: 24,
                    height: 24,
                    color: ColorConstant.whiteA70019,
                    svgPath: option['icon'],
                  ),
                  SizedBox(width: 12),
                  Text('${option['name']}',
                      style: AppStyle.txtNunitoSansSemiBold20Black900)
                ],
              ),
              onTapped: () => {
                if (index == 0)
                  {onTap(context, option['route'])}
                else if (index == 2)
                  {getTextFromEpubInstance()}
                else
                  {Navigator.of(context).pushNamed(option['route'])}
              },
            );
          }),
    );
  }

  Future<File> loadAsset(String fileName) async {
    final data = await rootBundle.load('assets/epubs/book.epub');
    final bytes = data.buffer.asUint8List();

    return _storeFile('book.epub', bytes);
  }

  static Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = url;
    final dir = await getApplicationDocumentsDirectory();

    final file = File('${dir.path}/$filename');
    return await file.writeAsBytes(bytes, flush: true);
  }

  Future<File> writeToFile(ByteData data) async {
    final buffer = data.buffer;
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    var filePath =
        tempPath + '/file_01.tmp'; // file_01.tmp is dump file, can be anything
    return new File(filePath).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  getTextFromEpubInstance() async {
    var url = 'https://sample-videos.com/video123/mp4';

    var nameFile = 'book.epub';

    var response = await loadAsset('book.epub');

    print('fileeeeeeeeeee======== $response');
    var savePath = '/storage/emulated/0/Download/$nameFile';
    var file = File(savePath);
    var raf = file.openSync(mode: FileMode.write);
    // response.data is List<int> type
    final data = await rootBundle.load('assets/epubs/book.epub');
    final bytes = data.buffer.asUint8List();
    raf.writeFromSync(bytes);
  }

  void displayDialogAndroid(BuildContext context, epub) {
    print('Hola mundo');

    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(10)),
            content: MyContent(epub),
            /*actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancelar'))
            ],*/
          );
        });
  }
}

class _ViewedPreview extends StatelessWidget {
  final Image backgroundImage;
  final String title;
  final double progressValue;
  final VoidCallback onTap;

  const _ViewedPreview(
      {super.key,
      required this.backgroundImage,
      required this.onTap,
      this.title = 'No Title',
      this.progressValue = 0.0});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 144.0,
          height: 160.0,
          margin: getMargin(right: 8),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 136.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: backgroundImage.image, fit: BoxFit.cover)),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
