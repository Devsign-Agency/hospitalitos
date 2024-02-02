import 'package:flutter/material.dart';
import 'package:mobile_app/core/models/book.dart';
import 'package:mobile_app/core/utils/size.utils.dart';

class CardPreviewBooksList extends StatelessWidget {
  final Future<List<Book>> future;
  final onTappedItem;
  const CardPreviewBooksList(
      {Key? key, required this.future, this.onTappedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
        height: 190.0,
        width: double.infinity,
        child: FutureBuilder<List<Book>>(
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
                shrinkWrap: true,
                itemCount: length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  // SfBook pdf = snapshot.data![index];
                  Book pdf = snapshot.data![index];
                  return _ViewedPreview(
                    onTap: () => onTappedItem(pdf),
                    backgroundImage: pdf.image,
                    progressValue: 0.0,
                    title: pdf.name,
                    id: pdf.id,
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
  final String id;

  const _ViewedPreview(
      {super.key,
      required this.backgroundImage,
      required this.onTap,
      this.title = 'No Title',
      this.progressValue = 0.0,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Hero(
        tag: id,
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
      ),
    );
  }
}
