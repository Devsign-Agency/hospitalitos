import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/app_export.dart';
import '../../../../../core/models/BookBible.dart';
import '../../../../../shared/shared.dart';

class TabBarViewBooks extends StatelessWidget {
  const TabBarViewBooks({
    super.key,
    required this.bookNames,
  });

  final List<String> bookNames;

  @override
  Widget build(BuildContext context) {
    BibleService bibleService =
        Provider.of<BibleService>(context, listen: false);

    final boxShadow = [
      BoxShadow(
        color: Color.fromRGBO(24, 39, 75, 0.08),
        offset: const Offset(0.0, 12.0),
        blurRadius: 32.0,
        spreadRadius: -4.0,
      ), //BoxSha
      BoxShadow(
        color: Color.fromRGBO(24, 39, 75, 0.08),
        offset: const Offset(0.0, 8.0),
        blurRadius: 18.0,
        spreadRadius: -6.0,
      ), //BoxShadow
    ];

    return Stack(
      children: [
        FutureBuilder(
          future: bibleService.getBooks(),
          builder:
              (BuildContext context, AsyncSnapshot<List<BookBible>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Si estamos cargando los datos, mostramos un indicador de carga
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // Si hubo un error al cargar los datos, mostramos un mensaje de error
              return Center(child: Text('Error al cargar los datos'));
            } else {
              // Si los datos se cargaron correctamente, los mostramos en un ListView
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Padding(
                  padding: getPadding(left: 16, top: 16, right: 16, bottom: 16),
                  child: GestureDetector(
                    onTap: () {
                      bibleService.setSelectedBook(snapshot.data![index]);
                    },
                    child: Text(
                      snapshot.data![index].name,
                      style: AppStyle.txtNunitoSansRegular18Gray900,
                    ),
                  ),
                ),
              );
            }
          },
        ),
        Positioned(
          top: MediaQuery.of(context).size.height - 350,
          left: 0,
          right: 0,
          child: Container(
            width: double.infinity,
            height: getSize(48),
            decoration: BoxDecoration(
                color: ColorConstant.yellow100,
                borderRadius: BorderRadius.circular(12),
                boxShadow: boxShadow),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Siguiente',
                style: AppStyle.txtNunitoSansSemiBold16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
