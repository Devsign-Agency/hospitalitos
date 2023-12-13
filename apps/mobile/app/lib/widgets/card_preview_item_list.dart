import 'dart:typed_data';

import 'package:epub_view/epub_view.dart' hide Image;
import 'package:flutter/material.dart';
import 'package:image/image.dart' hide Image;
import 'package:mobile_app/core/app_export.dart';

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
                    Image image = Image.memory(
                        Uint8List.fromList(encodePng(book.CoverImage!)));

                    String title = book.Title!.trim();
                    return _ViewedPreview(
                      onTap: () => {onTappedItem(context, book)},
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
    print(book);
    Navigator.pushNamed(context, 'book',
        arguments: EpubArguments(book: book, chapter: book.Chapters![0]));
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
