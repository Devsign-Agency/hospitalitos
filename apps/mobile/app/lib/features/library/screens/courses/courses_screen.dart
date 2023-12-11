import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/core/models/filter.dart';
import 'package:mobile_app/widgets/filters_bar.dart';

import '../../../../core/app_export.dart';
import '../../../../widgets/widgets.dart';

class CoursesScreen extends StatelessWidget {
  static const route = 'courses';
  const CoursesScreen({Key? key}) : super(key: key);

  void _handleActions() {
    print('You have clicked!');
  }

  Future<List<EpubBook>> fetchData() async {
    return EpubDocument.openAssetFolder('/epubs');
  }

  void changeSelected(int index) {
    print(index);
  }

  @override
  Widget build(BuildContext context) {
    List<FilterData> filtersData = [
      FilterData(id: 1, name: 'Video', icon: ImageConstant.imgMusic),
      FilterData(id: 2, name: 'Libro', icon: ImageConstant.imgBookmark),
      FilterData(id: 3, name: 'Podcast', icon: ImageConstant.imgSignal),
      FilterData(id: 1, name: 'Video', icon: ImageConstant.imgMusic),
      FilterData(id: 2, name: 'Libro', icon: ImageConstant.imgMusic),
      FilterData(id: 3, name: 'Podcast', icon: ImageConstant.imgMusic),
    ];

    List<FilterData> filtersData2 = [
      FilterData(id: 1, name: 'Bullying'),
      FilterData(id: 2, name: 'Doctrinas'),
      FilterData(id: 3, name: 'Estrés'),
      FilterData(id: 1, name: 'Fe'),
      FilterData(id: 2, name: 'Libro'),
      FilterData(id: 3, name: 'Podcast'),
    ];

    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            // AppBar
            _CustomAppBar(),

            // Search Input
            Padding(
              padding: getPadding(bottom: 16),
              child: BarInputSearch(),
            ),

            /// Filters
            Padding(
              padding: getPadding(bottom: 16),
              child: FiltersBar(
                  items: filtersData, onChangeSelected: changeSelected),
            ),

            // Preview Image
            Container(
              padding: getPadding(left: 16),
              margin: getMargin(bottom: 24.0),
              width: double.infinity,
              height: 160.0,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, int index) {
                    return Container(
                      height: double.infinity,
                      width: 244.0,
                      decoration: BoxDecoration(
                          color: ColorConstant.blueGray10002,
                          borderRadius: BorderRadius.circular(10.0)),
                    );
                  },
                  separatorBuilder: (_, __) => SizedBox(width: 8),
                  itemCount: 5),
            ),

            // Recently viewed
            Column(
              children: [
                Padding(
                    padding: getPadding(left: 16, right: 16, bottom: 24),
                    child: Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Categorías Populares',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtNunitoSansSemiBold23,
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            children: [
                              Text('Ver más',
                                  style: AppStyle
                                      .txtNunitoSansSemiBold16Indigo900),
                              CustomImageView(
                                svgPath: ImageConstant.imgArrowrightIndigo900,
                                width: getSize(24),
                                height: getSize(24),
                                color: ColorConstant.indigo900,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                Column(
                  children: [
                    FiltersBar(
                        items: filtersData2, onChangeSelected: changeSelected),
                    CardPreviewItem(future: fetchData()),
                  ],
                ),
              ],
            ),

            SizedBox(
              height: 24,
            ),

            // Recommended
            Column(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.0),
                    child: Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Recomendados',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtNunitoSansSemiBold23,
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            children: [
                              Text('Ver más',
                                  style: AppStyle
                                      .txtNunitoSansSemiBold16Indigo900),
                              CustomImageView(
                                svgPath: ImageConstant.imgArrowrightIndigo900,
                                width: getSize(24),
                                height: getSize(24),
                                color: ColorConstant.indigo900,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                CardPreviewItem(future: fetchData()),
              ],
            ),
          ],
        ),
      )),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
          left: 14.0, right: 14.0, top: 8.0, bottom: 24.0),
      child: Row(
        children: [
          Expanded(
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Descubre todo nuestro contenido',
                    style: AppStyle.txtNunitoSansSemiBold26)),
          ),
        ],
      ),
    );
  }
}
