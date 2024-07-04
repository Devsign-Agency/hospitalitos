import 'package:flutter/material.dart';
import 'package:mobile_app/features/reading/screens/saint_detail/saint_detail.dart';
import 'package:provider/provider.dart';

import '../../../core/app_export.dart';
import '../../../shared/services/saints_service.dart';

class ListViewSaints extends StatelessWidget {
  const ListViewSaints({super.key});

  @override
  Widget build(BuildContext context) {
    SaintsService saintService =
        Provider.of<SaintsService>(context, listen: false);

    return FutureBuilder<List<Saint>>(
        future: saintService.getSaintsToday(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Si estamos cargando los datos, mostramos un indicador de carga
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Si hubo un error al cargar los datos, mostramos un mensaje de error
            return Center(child: Text('Error al cargar los datos'));
          } else {
            return snapshot.hasData && snapshot.data!.isNotEmpty
                ? SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (_, int index) {
                              return GestureDetector(
                                onTap: () => Navigator.pushNamed(
                                    context, SaintDetailsScreen.route,
                                    arguments: snapshot.data![index]),
                                child: Container(
                                  padding: getMargin(left: 16, right: 16),
                                  width: 200,
                                  height: 250,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 160,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            image: DecorationImage(
                                                image: AssetImage(snapshot
                                                            .data![index]
                                                            .image !=
                                                        ''
                                                    ? 'assets/images/saints/${snapshot.data![index].image}'
                                                    : 'assets/images/img_frame26085551.png'),
                                                fit: BoxFit.cover)),
                                        child: null,
                                      ),
                                      SizedBox(height: 10),
                                      ConstrainedBox(
                                        constraints:
                                            BoxConstraints(maxWidth: 180),
                                        child: Text(
                                          snapshot.data![index].name,
                                          style:
                                              AppStyle.txtNunitoSansSemiBold16,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: snapshot.data!.length,
                          ),
                        ],
                      ),
                    ),
                  )
                : Padding(
                    padding: getMargin(left: 16, right: 16),
                    child: Text(
                      'No se encontraron resultados',
                      style: AppStyle.txtNunitoSansSemiBold20,
                    ),
                  );
          }
        });
  }
}
