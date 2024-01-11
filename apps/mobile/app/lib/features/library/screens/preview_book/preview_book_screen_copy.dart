import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/app_export.dart';
import '../../../../core/models/viewed_preview.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/widgets.dart';
import '../../widgets/tab_view_chapters.dart';
import '../../widgets/widgets.dart';
import 'package:image/image.dart' hide Image;
import 'package:mobile_app/core/app_export.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class PreviewBookScreen extends StatefulWidget {
  static const String route = 'preview-book';

  const PreviewBookScreen({super.key});

  @override
  State<PreviewBookScreen> createState() => _PreviewBookScreenState();
}

class _PreviewBookScreenState extends State<PreviewBookScreen> {
  var _scrollController = ScrollController();
  bool _isExpanded = false;
  @override
  void initState() {
    _scrollController.addListener(() {
      setState(() {
        _isExpanded = _isSliverAppBarExpanded;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            _CustomAppBar(
              isExpanded: _isExpanded,
            ),
          ],
          body: GestureDetector(
            child: TabBarView(children: [
              // Chapters
              TabViewChapters(),

              // Recommended
              TabViewRecommended(
                future: getBooks(),
                onItemTapped: () => Navigator.pushNamed(context, 'reader-book',
                    arguments: 'instance-book'),
              ),

              // Commentaries
              TabViewComments(),
            ]),
          ),
        ),
      ),
    ));
  }

  Future<List<ViewedPreviewItem>> getBooks() {
    List<ViewedPreviewItem> items = [
      ViewedPreviewItem(
          id: '1', title: 'Título', image: 'assets/images/img_5.png'),
      ViewedPreviewItem(
          id: '2', title: 'Título', image: 'assets/images/img_7.png'),
      ViewedPreviewItem(
          id: '3', title: 'Título', image: 'assets/images/img_8.png'),
      ViewedPreviewItem(
          id: '4', title: 'Título', image: 'assets/images/img_5.png'),
      ViewedPreviewItem(
          id: '5', title: 'Título', image: 'assets/images/img_img7.png'),
      ViewedPreviewItem(
          id: '5', title: 'Título', image: 'assets/images/img_8.png'),
      ViewedPreviewItem(
          id: '4', title: 'Título', image: 'assets/images/img_5.png'),
      ViewedPreviewItem(
          id: '5', title: 'Título', image: 'assets/images/img_img7.png'),
      ViewedPreviewItem(
          id: '5', title: 'Título', image: 'assets/images/img_8.png'),
    ];

    return Future.delayed(Duration(seconds: 1), () => items);
  }

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients && _scrollController.offset > (50);
  }
}

class _CustomAppBar extends StatelessWidget {
  final bool isExpanded;

  const _CustomAppBar({super.key, required this.isExpanded});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      expandedHeight: 480,
      floating: false,
      pinned: true,
      bottom: TabBar(
        labelColor: ColorConstant.indigo900,
        indicatorColor: ColorConstant.indigo900,
        indicatorSize: TabBarIndicatorSize.label,
        unselectedLabelColor: ColorConstant.gray200,
        tabAlignment: TabAlignment.fill,
        tabs: [
          Tab(
              child: Text(
            'Episodios',
            style: AppStyle.txtNunitoSansSemiBold16Indigo900,
          )),
          Tab(
              child: Text(
            'Recomendados',
          )),
          Tab(child: Text('Comentarios')),
        ],
      ),
      title: Text('Título', style: AppStyle.txtNunitoSansSemiBold26WhiteA700),
      flexibleSpace: FlexibleSpaceBar(
        // centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        background: _FlexibleSpaceBarBackground(),
      ),
      actions: [
        CustomImageView(
          svgPath: ImageConstant.imgFavWhite24x24,
          width: getSize(24),
          height: getSize(24),
          color: ColorConstant.whiteA700,
        ),
        SizedBox(width: 32),
        CustomImageView(
          svgPath: ImageConstant.imgShare,
          width: getSize(24),
          height: getSize(24),
          color: ColorConstant.whiteA700,
          onTap: () => showModalBottomSheet(
              backgroundColor: ColorConstant.gray50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              context: context,
              builder: (context) => ModalBottomSheet()),
        ),
        SizedBox(width: 16),
      ],
    );
  }
}

class _FlexibleSpaceBarBackground extends StatefulWidget {
  const _FlexibleSpaceBarBackground({
    super.key,
  });

  @override
  State<_FlexibleSpaceBarBackground> createState() =>
      _FlexibleSpaceBarBackgroundState();
}

class _FlexibleSpaceBarBackgroundState
    extends State<_FlexibleSpaceBarBackground> {
  late VideoPlayerController _controller;
  String? _fileName;
  String VIDEO_ONE =
      "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4";
// VideoPlayerController videoPlayerController1;
// ChewieController _chewieController1;
  Uint8List? imageBytes;

  @override
  void initState() {
    super.initState();
    _generateThumbnail();

    // final fileName = await VideoThumbnail.thumbnailFile(
    //   video:
    //       "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
    //   thumbnailPath: (await getTemporaryDirectory()).path,
    //   imageFormat: ImageFormat.WEBP,
    //   maxHeight:
    //       64, // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
    //   quality: 75,
    // );
    // _fileName = fileName!;
  }

  @override
  void dispose() {
    // flickManager.dispose();
    super.dispose();
  }

  _generateThumbnail() async {
    final byteData = await rootBundle.load("assets/videos/video_example.mp4");
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

    // String? fileName = await VideoThumbnail.thumbnailFile(
    //   video: VIDEO_ONE,
    //   thumbnailPath: (await getTemporaryDirectory()).path,
    //   imageFormat: ImageFormat.PNG,
    //   maxHeight:
    //       350, // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
    //   quality: 75,
    // );

    final file = File(fileName!);
    imageBytes = file.readAsBytesSync();
    print('----image--->>>$fileName');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as EpubArguments;
    final book = arguments.book;
    Image image =
        Image.memory(Uint8List.fromList(encodePng(book!.CoverImage!)));

    // final uint8list = VideoThumbnail.thumbnailData(
    //   video: 'assets/videos/video_test.mp4',
    //   imageFormat: ImageFormat.JPEG,
    //   maxWidth:
    //       128, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
    //   quality: 25,
    // );

    return SizedBox(
      width: double.infinity,
      height: 300.0,
      // color: Colors.red.withOpacity(0.3),
      child: Column(
        children: [
          if (imageBytes != null)
            Container(
              height: 350,
              width: MediaQuery.of(context).size.width,
              child: Image.memory(
                imageBytes!,
                height: 350,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          SizedBox(height: 16),
          CustomButton(
              margin: getMargin(left: 16, right: 16),
              fontStyle: ButtonFontStyle.NunitoSansSemiBold16,
              height: getVerticalSize(48),
              text: 'Continuar viendo',
              onTap: () {
                Navigator.pushNamed(context, 'book',
                    arguments:
                        EpubArguments(book: book, chapter: book!.Chapters![0]));
              }),
          SizedBox(height: 16),
          CustomButton(
              margin: getMargin(left: 16, right: 16),
              fontStyle: ButtonFontStyle.NunitoSansSemiBold16,
              height: getVerticalSize(48),
              variant: ButtonVariant.OutlineIndigo900,
              text: 'Descargar',
              onTap: () {}),
          SizedBox(height: 16),
          Padding(
            padding: getPadding(left: 16, right: 16),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore',
              style: AppStyle.txtNunitoSansRegular14,
            ),
          )
        ],
      ),
    );
  }
}
