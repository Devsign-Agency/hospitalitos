import 'package:flutter/material.dart';
import 'package:mobile_app/core/models/pdf_viewer.dart';
import 'package:mobile_app/core/utils/size.utils.dart';

class CardPreviewBookList extends StatelessWidget {
  final Future<List<PdfViewer>> future;
  final onTappedItem;
  const CardPreviewBookList({Key? key, required this.future, this.onTappedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  PdfViewer pdf = snapshot.data![index];
                  return _ViewedPreview(
                    onTap: () => onTappedItem(pdf),
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
}
