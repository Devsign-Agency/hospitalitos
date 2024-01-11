import 'dart:io';

import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_app/widgets/card_preview_item_list%20copy.dart';
import 'package:mobile_app/widgets/filters_bar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../../../core/app_export.dart';
import '../../../../core/models/chip_item.dart';
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
  List<Uint8List> path = [];

  void _handleActions() {
    print('You have clicked!');
  }

  @override
  initState() {
    super.initState();
    getThumbnail();

    // // retur
  }

  getThumbnail() async {
    List<String> pathsName = [
      'assets/videos/video_example.mp4',
      'assets/videos/video_example2.mp4',
      'assets/videos/video_test.mp4'
    ];

    // ignore: avoid_function_literals_in_foreach_calls
    pathsName.forEach((element) async {
      print(element);
      final byteData = await rootBundle.load(element);
      Directory tempDir = await getTemporaryDirectory();

      File tempVideo = File("${tempDir.path}/assets/my_video.mp4")
        ..createSync(recursive: true)
        ..writeAsBytesSync(byteData.buffer
            .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
      final fileName = await VideoThumbnail.thumbnailFile(
        video: tempVideo.path,
        thumbnailPath: (await getTemporaryDirectory()).path,
        imageFormat: ImageFormat.PNG,
        quality: 100,
      );

      final file = File(fileName!);
      Uint8List imageBytes = file.readAsBytesSync();
      path.add(imageBytes);
      print('size ------ > ${path.length}');
      // setState(() {});
    });

    print('Paths-------');
    print(path);
    return path;
  }

  Future<List<EpubBook>> fetchData() async {
    return EpubDocument.openAssetFolder('/epubs');
  }

  Future<List<dynamic>> fetchVideoPaths() async {
    // return getThumbnail();
    return [
      'assets/videos/video_example.mp4',
      'assets/videos/video_example2.mp4',
      'assets/videos/video_test.mp4'
    ];
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
    List<ChipItem> filtersData = [
      ChipItem(id: 1, name: 'Video', icon: ImageConstant.imgVideo24x24),
      ChipItem(id: 2, name: 'Libro', icon: ImageConstant.imgBookmark),
      ChipItem(id: 3, name: 'Podcast', icon: ImageConstant.imgPodcast24x24),
      ChipItem(id: 1, name: 'Video', icon: ImageConstant.imgMusic),
      ChipItem(id: 2, name: 'Libro', icon: ImageConstant.imgMusic),
      ChipItem(id: 3, name: 'Podcast', icon: ImageConstant.imgMusic),
    ];

    List<ChipItem> filtersData2 = [
      ChipItem(id: 1, name: 'Bullying'),
      ChipItem(id: 2, name: 'Doctrinas'),
      ChipItem(id: 3, name: 'Estrés'),
      ChipItem(id: 1, name: 'Fe'),
      ChipItem(id: 2, name: 'Libro'),
      ChipItem(id: 3, name: 'Podcast'),
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

            CardThumbnailVideoItemList(
              future: fetchVideoPaths(),
              onTappedItem: null,
              paths: path,
              pathsName: [
                'assets/videos/video_example.mp4',
                'assets/videos/video_test.mp4',
                'assets/videos/video_example2.mp4',
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

class _ListItemScrollableHorizontal extends StatelessWidget {
  final String title;
  final bool? hasFilter;
  final List<ChipItem>? filterItems;
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
