import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/widgets.dart';

class ScaffoldPreviewItemWidget extends StatefulWidget {
  final int tabLenght;
  final List<Widget> tabsView;

  const ScaffoldPreviewItemWidget(
      {super.key, required this.tabLenght, required this.tabsView});

  @override
  State<ScaffoldPreviewItemWidget> createState() =>
      _ScaffoldPreviewItemWidgetState();
}

class _ScaffoldPreviewItemWidgetState extends State<ScaffoldPreviewItemWidget> {
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
      length: widget.tabLenght,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            // _CustomAppBar(
            //   isExpanded: _isExpanded,
            // ),
          ],
          body: GestureDetector(
            child: TabBarView(children: [...widget.tabsView]),
          ),
        ),
      ),
    ));
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
            'Recomendados',
            style: AppStyle.txtNunitoSansSemiBold16Indigo900,
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
          svgPath: ImageConstant.imgFavorite,
          width: getSize(24),
          height: getSize(24),
          color: ColorConstant.indigo900,
        ),

        SizedBox(width: 32),
        CustomImageView(
          svgPath: ImageConstant.imgShare,
          width: getSize(24),
          height: getSize(24),
          color: ColorConstant.indigo900,
          onTap: () => showModalBottomSheet(
              backgroundColor: ColorConstant.gray50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              context: context,
              builder: (context) => ModalBottomSheet()),
        ),
        // Icon(
        //   Icons.share_outlined,
        //   color: ColorConstant.indigo900,
        // ),
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

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({required this.controller});

  static const List<Duration> _exampleCaptionOffsets = <Duration>[
    Duration(seconds: -10),
    Duration(seconds: -3),
    Duration(seconds: -1, milliseconds: -500),
    Duration(milliseconds: -250),
    Duration.zero,
    Duration(milliseconds: 250),
    Duration(seconds: 1, milliseconds: 500),
    Duration(seconds: 3),
    Duration(seconds: 10),
  ];
  static const List<double> _examplePlaybackRates = <double>[
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? const SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: const Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                      semanticLabel: 'Play',
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
        Align(
          alignment: Alignment.topLeft,
          child: PopupMenuButton<Duration>(
            initialValue: controller.value.captionOffset,
            tooltip: 'Caption Offset',
            onSelected: (Duration delay) {
              controller.setCaptionOffset(delay);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<Duration>>[
                for (final Duration offsetDuration in _exampleCaptionOffsets)
                  PopupMenuItem<Duration>(
                    value: offsetDuration,
                    child: Text('${offsetDuration.inMilliseconds}ms'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.captionOffset.inMilliseconds}ms'),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton<double>(
            initialValue: controller.value.playbackSpeed,
            tooltip: 'Playback speed',
            onSelected: (double speed) {
              controller.setPlaybackSpeed(speed);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<double>>[
                for (final double speed in _examplePlaybackRates)
                  PopupMenuItem<double>(
                    value: speed,
                    child: Text('${speed}x'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.playbackSpeed}x'),
            ),
          ),
        ),
      ],
    );
  }
}

class _FlexibleSpaceBarBackgroundState
    extends State<_FlexibleSpaceBarBackground> {
  late VideoPlayerController _controller;

  // Future<ClosedCaptionFile> _loadCaptions() async {
  //   final String fileContents = await DefaultAssetBundle.of(context)
  //       .loadString('assets/bumble_bee_captions.vtt');
  //   return WebVTTCaptionFile(
  //       fileContents); // For vtt files, use WebVTTCaptionFile
  // }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
      // closedCaptionFile: _loadCaptions(),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    )..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  void dispose() {
    // flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300.0,
      // color: Colors.red.withOpacity(0.3),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 224.0,
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        VideoPlayer(_controller),
                        _ControlsOverlay(controller: _controller),
                        VideoProgressIndicator(_controller,
                            allowScrubbing: true),
                      ],
                    ))
                : Container(),
          ),
          SizedBox(height: 16),
          CustomButton(
              margin: getMargin(left: 16, right: 16),
              fontStyle: ButtonFontStyle.NunitoSansSemiBold16,
              height: getVerticalSize(48),
              text: 'Continuar viendo',
              onTap: () {
                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });
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
