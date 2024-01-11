import 'dart:io';
import 'dart:typed_data';

import 'package:epub_view/epub_view.dart' hide Image;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' hide Image;
import 'package:mobile_app/core/app_export.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class CardThumbnailVideoItemList extends StatelessWidget {
  final Future<List<dynamic>> future;
  final List<Uint8List> paths;
  final List<String> pathsName;
  final onTappedItem;
  const CardThumbnailVideoItemList(
      {super.key,
      required this.future,
      required this.onTappedItem,
      required this.paths,
      required this.pathsName});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 14.0),
        // padding: EdgeInsets.symmetric(horizontal: 14),
        height: 160.0,
        width: double.infinity,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: pathsName.length,
          itemBuilder: (context, index) {
            VideoPlayerController controller = VideoPlayerController.asset(
              pathsName[index],
            )..initialize().then((_) {});

            // controller.play();

            return GestureDetector(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Container(
                  width: 150,
                  height: 120.0,
                  margin: EdgeInsets.symmetric(vertical: 14),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(18)),
                  child: AspectRatio(
                    aspectRatio: 1 / 0.5,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12)),
                        child: VideoPlayer(controller)),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 8.0);
          },
        ));
    // return Container(
    //   margin: EdgeInsets.symmetric(vertical: 14.0),
    //   height: 190.0,
    //   width: double.infinity,
    //   child: FutureBuilder(
    //       future: getThumbnails(pathsName),
    //       builder: (_, AsyncSnapshot snapshot) {
    //         if (snapshot.connectionState == ConnectionState.waiting) {
    //           //           // Si estamos cargando los datos, mostramos un indicador de carga
    //           return Center(child: CircularProgressIndicator());
    //         } else if (snapshot.hasError) {
    //           // Si hubo un error al cargar los datos, mostramos un mensaje de error
    //           return Center(child: Text('Error al cargar los datos'));
    //         } else {
    //           // Si los datos se cargaron correctamente, los mostramos en un ListView
    //           int length = snapshot.data!.length;
    //           print('Lenth ------> $length');

    //           return ListView(
    //             scrollDirection: Axis.horizontal,
    //             children: [...snapshot.data],
    //           );
    //         }
    //       }),
    // );
    // return Container(
    //   margin: EdgeInsets.symmetric(vertical: 14.0),
    //   height: 190.0,
    //   width: double.infinity,
    //   child: ListView.builder(
    //     scrollDirection: Axis.horizontal,
    //     itemBuilder: (_, int index) {
    //       final value = pathsName[index];
    //       print('antes de entrar: $value');
    //       return FutureBuilder(
    //           future: _generateThumbnail(value),
    //           builder: (_, AsyncSnapshot snapshot) {
    //             if (snapshot.connectionState == ConnectionState.waiting) {
    //               //           // Si estamos cargando los datos, mostramos un indicador de carga
    //               return Center(child: CircularProgressIndicator());
    //             } else if (snapshot.hasError) {
    //               // Si hubo un error al cargar los datos, mostramos un mensaje de error
    //               return Center(child: Text('Error al cargar los datos'));
    //             } else {
    //               return snapshot.data;
    //             }
    //           });
    //     },
    //     itemCount: pathsName.length,
    //   ),
    // );
    // return Container(
    //     margin: EdgeInsets.symmetric(vertical: 14.0),
    //     height: 190.0,
    //     width: double.infinity,
    //     child: FutureBuilder<List<dynamic>>(
    //       future: future,
    //       builder: (context, snapshot) {
    //         print('holaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    //         if (snapshot.connectionState == ConnectionState.waiting) {
    //           // Si estamos cargando los datos, mostramos un indicador de carga
    //           return Center(child: CircularProgressIndicator());
    //         } else if (snapshot.hasError) {
    //           // Si hubo un error al cargar los datos, mostramos un mensaje de error
    //           return Center(child: Text('Error al cargar los datos'));
    //         } else {
    //           // Si los datos se cargaron correctamente, los mostramos en un ListView
    //           int length = snapshot.data!.length;
    //           print(length);

    //           return snapshot.data.map((e) => {
    //             return
    //           });
    //           // return ListView.builder(
    //           //     itemCount: paths.length,
    //           //     scrollDirection: Axis.horizontal,
    //           //     itemBuilder: (context, index) {
    //           //       print('List view: $index');
    //           //       // print(snapshot.data);
    //           //       return _ViewedPreview(
    //           //         onTap: () => {},
    //           //         backgroundImage: paths[index],
    //           //         progressValue: 0.0,
    //           //         title: '',
    //           //       );
    //           //       // String imagePath = snapshot.data![index];

    //           //       // // return Container(
    //           //       // //   height: 350,
    //           //       // //   width: 200,
    //           //       // //   child: Text('Hola mundo'),
    //           //       // // );
    //           //       // print(imagePath);
    //           //       // return FutureBuilder(
    //           //       //     future: _generateThumbnail(snapshot.data![index]),
    //           //       //     builder: (context, snapshot) {
    //           //       //       return snapshot.data!;
    //           //       //     });
    //           //     }
    //           //     // Image image = Image.memory(
    //           //     //     Uint8List.fromList(encodePng(book.CoverImage!)));

    //           //     // String title = book.Title!.trim();
    //           //     // return _ViewedPreview(
    //           //     //   onTap: () => {},
    //           //     //   backgroundImage: imageBytes,
    //           //     //   progressValue: 0.0,
    //           //     //   title: '',
    //           //     // );

    //           //     );
    //         }
    //       },
    //     ));
  }

  Future<List<Widget>> getThumbnails(List<String> pathsName) {
    List<Widget> list = [];

    // ignore: await_only_futures
    pathsName.forEach((element) async {
      print('entrooooooooooooooooo, $element');
      final byteData = await rootBundle.load(element);
      Directory tempDir = await getTemporaryDirectory();

      File tempVideo = File("${tempDir.path}/assets/my_video.mp4")
        ..createSync(recursive: true)
        ..writeAsBytesSync(byteData.buffer
            .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

      final fileName = await VideoThumbnail.thumbnailFile(
        video: tempVideo.path,
        thumbnailPath: (await getTemporaryDirectory()).path,
        imageFormat: ImageFormat.PNG,
        quality: 100,
      );

      final file = File(fileName!);

      list.add(_ViewedPreview(
        onTap: () => {},
        backgroundImage: file.readAsBytesSync(),
        progressValue: 0.0,
        title: '',
      ));
    });
    print('Listado resultado: $list');
    return Future.delayed(
        Duration(
          milliseconds: 2000,
        ),
        () => list);
  }

  Future<Widget> _generateThumbnail(String pathName) async {
    print('_generateThumbnail $pathName');
    final byteData = await rootBundle.load(pathName);
    Directory tempDir = await getTemporaryDirectory();

    File tempVideo = File("${tempDir.path}/assets/my_video.mp4")
      ..createSync(recursive: true)
      ..writeAsBytesSync(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    final fileName = await VideoThumbnail.thumbnailFile(
      video: tempVideo.path,
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.PNG,
      quality: 100,
    );

    final file = File(fileName!);
    // // return file.readAsBytesSync();
    // print('HOLLLLLLA munnnnndoooooooo');
    return _ViewedPreview(
      onTap: () => {},
      backgroundImage: file.readAsBytesSync(),
      progressValue: 0.0,
      title: '',
    );

    // return Container(
    //   height: 350,
    //   width: 200,
    //   child: Text('Hola mundo'),
    // );
  }

  // onTap(context, EpubBook book) {
  //   Navigator.pushNamed(context, 'preview-book');
  // }

  onTap(context, EpubBook book) {
    print(book);
    Navigator.pushNamed(context, 'book',
        arguments: EpubArguments(book: book, chapter: book.Chapters![0]));
  }
}

class _ViewedPreview extends StatelessWidget {
  final Uint8List backgroundImage;
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
    print('ViewedPreview');
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
                height: 144.0,
                width: double.infinity,
                child: Image.memory(
                  backgroundImage,
                  height: 136,
                  width: double.infinity,
                ),
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
