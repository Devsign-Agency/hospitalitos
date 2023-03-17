import 'dart:typed_data';

import 'package:epub_view/epub_view.dart' hide Image;
import 'package:flutter/material.dart';
import 'package:image/image.dart' hide Image;
import 'package:mobile_app/core/models/epub.arguments.dart';

class PreviewItemList extends StatelessWidget {
  final Future<List<EpubBook>> future;

  const PreviewItemList({super.key, required this.future});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 14.0),
        height: 136.0,
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
                    Image image = Image.memory(Uint8List.fromList(
                        encodePng(book.CoverImage!)));

                    String title = book.Title!.trim();
                    return ViewedPreview(
                      onTap: () => onTap(context, book),
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

  onTap(context, EpubBook book) {
    Navigator.pushNamed(context, 'book', arguments: EpubArguments(
        book: book,
        chapter: book.Chapters![0]
    ));
  }
}

class ViewedPreview extends StatelessWidget {
  final Image backgroundImage;
  final String title;
  final double progressValue;
  final VoidCallback onTap;

  const ViewedPreview(
      {super.key,
      required this.backgroundImage,
      required this.onTap,
      this.title = 'No Title',
      this.progressValue = 0.0});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 150.0,
        margin: EdgeInsets.only(right: 8),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(14))),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    image: DecorationImage(
                        opacity: 0.52,
                        image: backgroundImage.image,
                        fit: BoxFit.cover)),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 14.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Text(''),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(title,
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                    SizedBox(height: 8.0),
                    LinearProgressIndicator(
                      backgroundColor: Colors.white54,
                      value: progressValue,
                      color: Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
