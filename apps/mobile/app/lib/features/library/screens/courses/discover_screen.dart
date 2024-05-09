import 'package:flutter/material.dart';
import 'package:mobile_app/features/library/widgets/preview_list_video.dart';
import 'package:mobile_app/widgets/custom_app_bar.dart';
import 'package:youtube_api/youtube_api.dart';
import 'package:youtube_data_api/models/channel.dart';
import 'package:youtube_data_api/models/playlist.dart';
import 'package:youtube_data_api/models/video.dart';
import 'package:youtube_data_api/models/video_data.dart';
import 'package:youtube_data_api/youtube_data_api.dart';
import '../../../../core/app_export.dart';
import '../../../../core/models/chip_item.dart';
import '../../../../core/models/viewed_preview.dart';
import '../../../../shared/shared.dart';
import '../../../../widgets/filters_bar.dart';
import '../../../../widgets/widgets.dart';
import '../../../bible/screens/screens.dart';
import '../../../liturgia/screens/screens.dart';
import '../../../main/pages/pages.dart';
import '../../widgets/widgets.dart';

class DiscoverScreen extends StatefulWidget {
  static const String route = 'discover-route';

  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  static String api_key = "AIzaSyBi8ZJG4p_s2erVElA6Q-_5s9s6oe0y8wc";
  YoutubeAPI youtubeAPI = YoutubeAPI(api_key, maxResults: 20, type: "video");
  List<dynamic> results = []; //list to store the results
  var listVideos = [];

  List<ChipItem> filtersData = [
    ChipItem(id: 1, name: 'Video', icon: ImageConstant.imgVideo24x24),
    ChipItem(id: 2, name: 'Libro', icon: ImageConstant.imgBookmark),
  ];

  @override
  initState() {
    super.initState();

    callApi().then((value) {
      setState(() {});
    });
    //callApi();
    // // retur
  }

  handleChangeBottomNavigationBar(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomePage()),
            (Route<dynamic> route) => false);
        break;
      case 1:
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => DiscoverScreen()),
            (Route<dynamic> route) => false);
        break;
      case 2:
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LiturgiaCalendarScreen()),
            (Route<dynamic> route) => false);
        break;
      case 3:
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => BibleMain()),
            (Route<dynamic> route) => false);
        break;
    }
  }

  callApi() async {
    // YoutubeDataApi youtubeDataApi = YoutubeDataApi();

    String query = "Wegz";
    YoutubeDataApi youtubeDataApi = YoutubeDataApi();
    // List videoResult = await youtubeDataApi.fetchSearchVideo(
    //     query, "AIzaSyB4lAIBNuHW_QsWBIW-KOl8MnqhRW8D3_g");
    // videoResult.forEach((element) {
    //   if (element is Video) {
    //     Video video = element;
    //   } else if (element is Channel) {
    //     Channel channel = element;
    //   } else if (element is PlayList) {
    //     PlayList playList = element;
    //   }
    // });

    // print(videoResult);
//             VideoData? videoData = await youtubeDataApi.fetchVideoData(videoId);
// String? videoTitle = videoData?.video?.title;
// String? videoChannelName = videoData?.video?.username;
// String? viewsCount = videoData?.video?.viewCount;
// String? likeCount = videoData?.video?.likeCount;
// String? channelThumbnail = videoData?.video?.channelThumb;
// String? channelId = videoData?.video?.channelId;
// String? subscribeCount = videoData?.video?.subscribeCount;
// List<Video?>? relatedVideos = videoData?.videosList;

    // await youtubeAPI.channel('UCBJni9poQ67aCVmW6bA9wRg').then((value) {
    //   print(value);
    // });

    try {
      results = await youtubeAPI.search(
          'Hospitalitos de la fe '); //searching for videos related to HD Music
      listVideos = results;

      return results;
    } catch (e) {
      print(
          e); //in case of any exception like no internet or problem with API log it to console
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<List<YouTubeVideo>> getBooks() {
      List<ViewedPreviewItem> items = [
        ViewedPreviewItem(
            id: '1', title: 'Título', image: 'assets/images/img_5.png'),
        ViewedPreviewItem(
            id: '2', title: 'Título', image: 'assets/images/img_7.png'),
        ViewedPreviewItem(
            id: '3', title: 'Título', image: 'assets/images/img_8.png'),
        ViewedPreviewItem(
            id: '4', title: 'Título', image: 'assets/images/img_5.png'),
      ];

      return youtubeAPI.channel('UCBJni9poQ67aCVmW6bA9wRg');
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Descubre',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: getPadding(bottom: 16),
            //   child: FiltersBar(
            //       items: filtersData,
            //       onChangeSelected: changeSelectedFilterItem),
            // ),

            // Recommended
            PreviewListVideo(
              future: getBooks(),
              onItemTapped: () => Navigator.pushNamed(context, 'reader-book',
                  arguments: 'instance-book'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: 1,
          onChangeIndex: (int index) =>
              handleChangeBottomNavigationBar(index, context),
          bottomMenuList: BibleService.bottomMenuList),
    );
  }
}
