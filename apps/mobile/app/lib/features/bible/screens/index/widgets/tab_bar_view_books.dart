import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/app_export.dart';
import '../../../../../core/models/BookBible.dart';
import '../../../../../shared/shared.dart';
import '../../../../../widgets/custom_button.dart';

class TabBarViewBooks extends StatelessWidget {
  final VoidCallback onChangeTab;
  const TabBarViewBooks({
    super.key,
    required this.bookNames,
    required this.onChangeTab,
  });

  final List<String> bookNames;

  @override
  Widget build(BuildContext context) {
    BibleService bibleService =
        Provider.of<BibleService>(context, listen: true);

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
                      bibleService.selectedBook = snapshot.data![index];
                    },
                    child: Container(
                      padding: getPadding(all: 10.0),
                      decoration: BoxDecoration(
                          color: snapshot.data![index].name ==
                                  bibleService.selectedBook.name
                              ? ColorConstant.yellow100.withOpacity(0.2)
                              : null,
                          border: snapshot.data![index].name ==
                                  bibleService.selectedBook.name
                              ? Border(
                                  left: BorderSide(
                                      width: 4.0,
                                      color: ColorConstant.yellow100))
                              : null),
                      child: Text(
                        snapshot.data![index].name,
                        style: AppStyle.txtNunitoSansRegular18Gray900,
                      ),
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
          child: CustomButton(
              height: getVerticalSize(48),
              text: 'Siguiente',
              onTap: bibleService.selectedBook.name != '' ? onChangeTab : null),
        ),
      ],
    );
  }
}
