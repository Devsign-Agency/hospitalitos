import 'dart:io';

import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:html/parser.dart';
import 'package:mobile_app/features/blog/screens/search/search_delegate.dart';
import 'package:mobile_app/features/blog/widgets/wp-api.dart';
import 'package:mobile_app/features/main/router/main.router.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../core/app_export.dart';
import '../../../../widgets/widgets.dart';
import '../../widgets/widgets.dart';
import 'package:dio/dio.dart';

class BlogScreen extends StatefulWidget {
  static const String route = 'blog';
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  List<dynamic> posts = [];

  @override
  void initState() {
    fetchWpPosts().then((value) {
      posts = value;
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [_ArticlesHeader(), _ArticlesList(posts: posts)],
    )));
  }
}

class _ArticlesList extends StatelessWidget {
  final List<dynamic> posts;

  const _ArticlesList({
    super.key,
    required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: posts.isNotEmpty
            ? ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: posts.length,
                separatorBuilder: (_, __) => SizedBox(height: 20),
                itemBuilder: (_, int index) {
                  final item = posts[index];
                  print(index);
                  Map<dynamic, dynamic> wppost = item;
                  print(
                      wppost['_embedded']['wp:featuredmedia'][0]['source_url']);
                  // var imageurl = wppost['_embedded']['wp:featuredmedia'][0];

                  return ArticleCard(
                      imgUrl: wppost['_embedded']['wp:featuredmedia'][0]
                          ['source_url'],
                      post: item);
                })
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Text('Cargando posts')],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: CircularProgressIndicator(),
                      )
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}

class _ArticlesHeader extends StatefulWidget {
  const _ArticlesHeader({
    super.key,
  });

  @override
  State<_ArticlesHeader> createState() => _ArticlesHeaderState();
}

class _ArticlesHeaderState extends State<_ArticlesHeader> {
  final imgUrl =
      "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4";
  bool downloading = false;
  var progressString = "";
  final platform = MethodChannel('my_channel');
  bool loading = false;
  Dio dio = Dio();
  String filePath = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
          left: 14.0, right: 14.0, top: 8.0, bottom: 24.0),
      child: Row(
        children: [
          CustomIconButton(
            height: 48,
            width: 48,
            variant: IconButtonVariant.NoFill,
            onTap: () {
              Navigator.pop(context);
            },
            child: CustomImageView(
              color: ColorConstant.gray800,
              svgPath: ImageConstant.imgArrowleftGray800,
            ),
          ),
          Expanded(
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Blog', style: AppStyle.txtNunitoSansSemiBold26)),
          ),
          CustomIconButton(
            height: 48,
            width: 48,
            variant: IconButtonVariant.FillGray300,
            onTap: () {
              showSearch(context: context, delegate: PostsSearchDelegate());
            },
            child: CustomImageView(
              color: ColorConstant.gray800,
              svgPath: ImageConstant.imgSearch,
            ),
          ),
          /*sCustomIconButton(
            height: 48,
            width: 48,
            variant: IconButtonVariant.FillGray300,
            onTap: () async {
              print('download');
              var url = 'hospitalitos/apps/mobile/app/assets/epubs/book.epub';
              var filename = 'book.epub';
              

              var test = await getimagefilefromassets('/epubs/book.epub');
              print('-------------');
              print(test);
            },
            child: CustomImageView(
              color: ColorConstant.gray800,
              svgPath: ImageConstant.imgArrowdown,
            ),
          ),*/
        ],
      ),
    );
  }

  Future download(String url, String filename) async {
    /*rootBundle.loadString('assets/epubs/book.epub').then((String contents) {
      print('--------------- $contents');
    });*/

    var savePath = '/storage/emulated/0/Download/$filename';
    var dio = Dio();
    dio.interceptors.add(LogInterceptor());

    try {
      var response = await dio.get(
        url,
        onReceiveProgress: showDownloadProgress,
        //Received data with List<int>
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: 0,
        ),
      );
      var file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      // response.data is List<int> type
      raf.writeFromSync(response.data);
      await raf.close();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      debugPrint((received / total * 100).toStringAsFixed(0) + '%');
    }
  }

  Future<File> getimagefilefromassets(String path) async {
    final bytedata = await rootBundle.load('assets$path');
    final buffer = bytedata.buffer;
    Directory tempdir = await getTemporaryDirectory();
    String temppath = tempdir.path;
    var filepath =
        temppath + '/file_01.tmp'; // file_01.tmp is dump file, can be anything
    return File(filepath).writeAsBytes(
        buffer.asUint8List(bytedata.offsetInBytes, bytedata.lengthInBytes));
  }
}
