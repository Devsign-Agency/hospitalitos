import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/core/models/filter.dart';
import 'package:mobile_app/widgets/filters_bar.dart';

import '../../../../core/app_export.dart';
import '../../../../widgets/widgets.dart';

class CoursesScreen extends StatefulWidget {
  static const route = 'courses';
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  int _selectedFilter = 0;
  String _routeName = '';
  void _handleActions() {
    print('You have clicked!');
  }

  Future<List<EpubBook>> fetchData() async {
    return EpubDocument.openAssetFolder('/epubs');
  }

  void changeSelected(int index) {
    print(index);
  }

  void changeSelectedFilterItem(int index) {
    _selectedFilter = index;
    switch (_selectedFilter) {
      case 0:
        _routeName = 'preview-video';
        break;
      case 1:
        _routeName = 'preview-book';
        break;
      case 2:
        _routeName = 'preview-podcast';
        break;
    }
  }

  onTap(context, EpubBook book) {
    Navigator.pushNamed(context, _routeName,
        arguments: EpubArguments(book: book, chapter: book.Chapters![0]));
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
              child: BarInputSearch(
                onChange: (String value) {},
              ),
            ),

            // Items filter
            Padding(
              padding: getPadding(bottom: 16),
              child: FiltersBar(
                  items: filtersData,
                  onChangeSelected: changeSelectedFilterItem),
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

            // Popular categories
            _ListItemScrollableHorizontal(
              title: 'Categorías Populares',
              hasFilter: true,
              filterItems: filtersData2,
              onTappedItem: onTap,
              onSelectedFilterItem: changeSelectedFilterItem,
              future: fetchData(),
            ),

            SizedBox(
              height: 24,
            ),

            // Recommended
            _ListItemScrollableHorizontal(
              title: 'Recomendados',
              onTappedItem: onTap,
              future: fetchData(),
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

class _ListItemScrollableHorizontal extends StatelessWidget {
  final String title;
  final bool? hasFilter;
  final List<FilterData>? filterItems;
  final void Function(int)? onSelectedFilterItem;
  final void Function(dynamic, EpubBook) onTappedItem;
  final Future<List<EpubBook>> future;

  const _ListItemScrollableHorizontal(
      {super.key,
      this.hasFilter = false,
      required this.onTappedItem,
      this.filterItems,
      required this.future,
      required this.title,
      this.onSelectedFilterItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: getPadding(left: 16, right: 16, bottom: 24),
            child: Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
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
                          style: AppStyle.txtNunitoSansSemiBold16Indigo900),
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
            if (hasFilter != null && hasFilter! && filterItems != null)
              FiltersBar(
                  items: filterItems!, onChangeSelected: onSelectedFilterItem!),
            CardPreviewItemList(future: future, onTappedItem: onTappedItem),
          ],
        ),
      ],
    );
  }
}
