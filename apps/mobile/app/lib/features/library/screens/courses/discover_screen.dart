import 'package:flutter/material.dart';
import 'package:mobile_app/features/library/widgets/preview_list_video.dart';
import 'package:mobile_app/widgets/custom_app_bar.dart';
import 'package:youtube_api/youtube_api.dart';

import '../../../../core/app_export.dart';
import '../../../../core/models/chip_item.dart';
import '../../../../core/models/viewed_preview.dart';
import '../../../../widgets/filters_bar.dart';
import '../../widgets/widgets.dart';

class DiscoverScreen extends StatefulWidget {
  static const String route = 'discover-route';

  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  static String api_key = "AIzaSyB4lAIBNuHW_QsWBIW-KOl8MnqhRW8D3_g";
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

  callApi() async {
    try {
      results = await youtubeAPI
          .search('EWTNespanol '); //searching for videos related to HD Music
      listVideos = results;
      return results;
    } catch (e) {
      print(
          e); //in case of any exception like no internet or problem with API log it to console
    }
  }

  @override
  Widget build(BuildContext context) {
    void changeSelectedFilterItem(int index) {}

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

      return youtubeAPI.search('EWTNespanol ');
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

              SizedBox(height: 100)
            ],
          ),
        ));
  }
}
