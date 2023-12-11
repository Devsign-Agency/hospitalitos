import 'package:flutter/material.dart';

import '../../../core/app_export.dart';

class TabViewChapters extends StatelessWidget {
  const TabViewChapters({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          FutureBuilder(
            future: getComments(),
            builder: (_, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Si estamos cargando los datos, mostramos un indicador de carga
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                // Si hubo un error al cargar los datos, mostramos un mensaje de error
                return Center(child: Text('Error al cargar los datos'));
              } else {
                // Si los datos se cargaron correctamente, los mostramos en un ListView

                return Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (_, int index) {
                        final boxDecoration = BoxDecoration(
                            border: Border.all(
                                width: 1, color: ColorConstant.gray400),
                            borderRadius: BorderRadius.circular(12),
                            color: ColorConstant.whiteA700);

                        return Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          margin:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: boxDecoration,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Capítulo',
                                    style: AppStyle
                                        .txtNunitoSansSemiBold20Gray900),
                                Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                  style: AppStyle.txtNunitoSansRegular14,
                                )
                              ]),
                        );
                      },
                      separatorBuilder: (_, __) => SizedBox(height: 8),
                      itemCount: 5),
                );
              }
            },
          ),
          // Widget that displays a text bar to write a message
        ],
      ),
    );
  }

  Future<dynamic> getComments() {
    return Future.delayed(Duration(seconds: 2));
  }
}
