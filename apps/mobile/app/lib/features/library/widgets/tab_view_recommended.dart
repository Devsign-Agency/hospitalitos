import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../core/models/viewed_preview.dart';
import '../../../widgets/viewed_preview.dart';

class TabViewRecommended extends StatelessWidget {
  final Future<dynamic> future;
  final VoidCallback onTapItem;

  const TabViewRecommended({
    super.key,
    required this.future,
    required this.onTapItem,
  });

  @override
  Widget build(BuildContext context) {
    List<ViewedPreviewItem> items = [
      ViewedPreviewItem(
          id: '1', title: 'Título', image: 'assets/images/img_image12.png'),
      ViewedPreviewItem(
          id: '2', title: 'Título', image: 'assets/images/img_image11.png'),
      ViewedPreviewItem(
          id: '3', title: 'Título', image: 'assets/images/img_image10.png'),
      ViewedPreviewItem(
          id: '4', title: 'Título', image: 'assets/images/img_image9.png'),
      ViewedPreviewItem(
          id: '5', title: 'Título', image: 'assets/images/img_image12.png'),
      ViewedPreviewItem(
          id: '5', title: 'Título', image: 'assets/images/img_image11.png'),
    ];

    return FutureBuilder<dynamic>(
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

            return Padding(
              padding: getPadding(left: 16, right: 16, top: 24),
              child: Wrap(
                children: [
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    shrinkWrap: true,
                    itemBuilder: (_, int index) => _CardImagePreview(
                        title: items[index].title,
                        image: Image.asset(items[index].image),
                        onTap: onTapItem),
                    itemCount: items.length,
                    // separatorBuilder: (_, __) => SizedBox(width: 8),
                  ),
                ],
              ),
            );
          }
        });
  }
}

class _CardImagePreview extends StatelessWidget {
  final Image image;
  final String? title;
  final VoidCallback onTap;

  const _CardImagePreview({
    this.title,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: (width - 40) / 2,
      height: 180,
      child: ViewedPreview(
          title: title ?? 'no title', backgroundImage: image, onTap: onTap),
    );
  }
}
