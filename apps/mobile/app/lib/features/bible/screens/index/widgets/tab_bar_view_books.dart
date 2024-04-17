import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/app_export.dart';
import '../../../../../core/models/BookBible.dart';
import '../../../../../shared/shared.dart';

class TabBarViewBooks extends StatelessWidget {
  final VoidCallback onChangeTab;
  final Future<List<BookBible>>? future;
  const TabBarViewBooks({
    super.key,
    required this.onChangeTab,
    required this.future,
  });

  @override
  Widget build(BuildContext context) {
    BibleService bibleService =
        Provider.of<BibleService>(context, listen: true);
    bool isDarkTheme = bibleService.isDarkTheme;

    return Stack(
      children: [
        FutureBuilder<List<BookBible>>(
          future: future,
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
                      onChangeTab();
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
                        style: isDarkTheme
                            ? AppStyle.txtNunitoSansRegular18WhiteA700
                            : AppStyle.txtNunitoSansRegular18Gray900,
                      ),
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
