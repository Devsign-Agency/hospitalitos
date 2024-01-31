import 'dart:typed_data';

import 'package:epub_view/epub_view.dart' hide Image;
import 'package:flutter/material.dart';
import 'package:image/image.dart' hide Image;
import 'package:mobile_app/core/app_export.dart';
import 'package:mobile_app/widgets/pdf_image.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class CardPreviewPdfList extends StatelessWidget {
  final Future<List<SfPdfViewer>> future;
  final onTappedItem;
  const CardPreviewPdfList(
      {super.key, required this.future, required this.onTappedItem});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
        height: 190.0,
        width: double.infinity,
        child: FutureBuilder<List<SfPdfViewer>>(
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
                  print(snapshot.data!);
                  return _ViewedPreview(
                    onTap: () => {print('Tapped pdf')},
                    progressValue: 0.0,
                    title: '',
                    pdf: _buidPdf(snapshot, index),
                  );
                },
              );
            }
          },
        ));
  }

  SfPdfViewer _buidPdf(snapshot, index) => snapshot.data![index];

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
  final String title;
  final double progressValue;
  final VoidCallback onTap;
  final SfPdfViewer pdf;

  const _ViewedPreview(
      {super.key,
      required this.onTap,
      this.title = 'No Title',
      this.progressValue = 0.0,
      required this.pdf});

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
              Stack(
                children: [
                  PdfImage(pdf: pdf),
                  Container(
                    width: 144.0,
                    height: 160.0,
                    color: Colors.transparent,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Esto es una prueba',
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
