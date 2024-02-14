import 'dart:convert';
import 'dart:io';

import 'package:epub_view/epub_view.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:html/parser.dart';
import 'package:mobile_app/core/constants/color.constant.dart';
import 'package:mobile_app/core/constants/image.constant.dart';
import 'package:mobile_app/core/models/pdf_viewer.dart';
import 'package:mobile_app/core/theme/app.style.dart';
import 'package:mobile_app/core/utils/size.utils.dart';
import 'package:mobile_app/features/profile/screens/edit_profile/edit_profile_screen.dart';
import 'package:mobile_app/features/profile/screens/help/help_screen.dart';
import 'package:mobile_app/features/profile/screens/interests/interests_screen.dart';
import 'package:mobile_app/widgets/custom_card.dart';
import 'package:mobile_app/widgets/custom_image_view.dart';
import 'package:mobile_app/widgets/download_file.dart';
import 'package:path_provider/path_provider.dart';

import 'package:dio/dio.dart';

class CardPreviewBookList extends StatelessWidget {
  final Future<List<PdfViewer>> future;
  final onTappedItem;
  const CardPreviewBookList({Key? key, required this.future, this.onTappedItem})
      : super(key: key);

  void displayDialogIOS(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('titulo'),
          );
        });
  }

  downloadBook() async {
    print('download');
    var url = 'hospitalitos/apps/mobile/app/assets/epubs/book.epub';
    var filename = 'book.epub';
    //download(url, filename);

    var test = await getimagefilefromassets('/epubs/book.epub');
    print('-------------');
    print(test);

//Save single pdf file
    //FileStorage.writeCounter(test.toString(), "geeksforgeeks.epub");
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

  Future<File> getimagefilefromassets(String path) async {
    final bytedata = await rootBundle.load('assets$path');
    final buffer = bytedata.buffer;
    Directory tempdir = await getTemporaryDirectory();
    String temppath = tempdir.path;
    var filepath =
        temppath + '/file_01.epub'; // file_01.tmp is dump file, can be anything
    return File(filepath).writeAsBytes(
        buffer.asUint8List(bytedata.offsetInBytes, bytedata.lengthInBytes));
  }

  MyContent(pdf) {
    final List<Map<String, dynamic>> menuOptions = [
      {
        'name': 'Leer libro',
        'icon': ImageConstant.imgButtonalerts,
        'route': pdf,
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
                  {onTappedItem(option['route'])}
                else if (index == 2)
                  {getTextFromEpubInstance()}
                else
                  {Navigator.of(context).pushNamed(option['route'])}
              },
            );
          }),
    );
  }

  void displayDialogAndroid(BuildContext context, pdf) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(10)),
            content: MyContent(pdf),
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

  @override
  Widget build(BuildContext context) {
    PdfViewer pdf;
    return Container(
        margin: EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
        height: 190.0,
        width: double.infinity,
        child: FutureBuilder<List<PdfViewer>>(
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
              int length = snapshot.data!.length;
              return ListView.builder(
                itemCount: length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  // SfPdfViewer pdf = snapshot.data![index];
                  pdf = snapshot.data![index];
                  return _ViewedPreview(
                    onTap: () => displayDialogAndroid(context, pdf),
                    //onTap: () => onTappedItem(pdf),
                    backgroundImage: pdf.image,
                    progressValue: 0.0,
                    title: pdf.name,
                  );
                },
              );
            }
          },
        ));
  }
}

class _ViewedPreview extends StatelessWidget {
  final String backgroundImage;
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
                        image: AssetImage('assets/images/$backgroundImage'),
                        fit: BoxFit.cover)),
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

  Future<File> downloadFile(String url, String? name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');
    Dio dio = Dio();
    final response = await Dio().get(url,
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            receiveTimeout: 0));

    final raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(response.data);
    await raf.close();

    return file;
  } 
}