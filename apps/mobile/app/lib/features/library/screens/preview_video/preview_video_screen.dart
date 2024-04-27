import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// Stateful widget to fetch and then display video content.
class PreviewVideoScreen extends StatefulWidget {
  static const String route = 'preview-video';
  const PreviewVideoScreen({super.key});

  @override
  _PreviewVideoScreenState createState() => _PreviewVideoScreenState();
}

class _PreviewVideoScreenState extends State<PreviewVideoScreen> {
  // late VideoPlayerController _controller;
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    String? videoId;
    videoId = YoutubePlayer.convertUrlToId(
        'https://www.youtube.com/watch?v=-GFdUGiRDaM');
    print(videoId); // BBAyRBTfsOU

    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    );

    super.initState();

    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   final arguments = ModalRoute.of(context)!.settings.arguments as String;
    //   String? videoId;

    //   _controller = YoutubePlayerController(
    //     initialVideoId: videoId!,
    //     flags: YoutubePlayerFlags(
    //       mute: false,
    //       autoPlay: true,
    //     ),
    //   );

    //   setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as String;
    String? videoId;

    videoId = YoutubePlayer.convertUrlToId(arguments);

    return YoutubePlayer(
      controller: YoutubePlayerController(
        initialVideoId: videoId!,
        flags: YoutubePlayerFlags(
          mute: false,
          autoPlay: true,
        ),
      ),
      showVideoProgressIndicator: true,
      onReady: () {
        print('Player is ready.');
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
