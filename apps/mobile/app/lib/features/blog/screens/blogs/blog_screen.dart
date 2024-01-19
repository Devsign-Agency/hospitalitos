import 'package:flutter/material.dart';
import 'package:mobile_app/features/blog/widgets/wp-api.dart';

import '../../../../core/app_export.dart';
import '../../../../widgets/widgets.dart';
import '../../widgets/widgets.dart';



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
    fetchWpPosts().then ((value) {
              posts = value;
              print('respuesta llego');
              print(value);

              setState(() {
                
              });
    });

     super.initState();
  }


   @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [_ArticlesHeader(), _ArticlesList(posts: posts)],
      ),
    ));
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
        child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: posts.length,
            separatorBuilder: (_, __) => SizedBox(height: 20),
            itemBuilder: (_, int index) {
              final item = posts[index];
              print(index);
              Map<dynamic, dynamic> wppost = item;

              print(wppost['_embedded']['wp:featuredmedia'][0]['source_url']);
              // var imageurl = wppost['_embedded']['wp:featuredmedia'][0];
              return ArticleCard(imgUrl: wppost['_embedded']['wp:featuredmedia'][0]['source_url'], post: item);
            }),
      ),
    );
  }
}

class _ArticlesHeader extends StatelessWidget {
  const _ArticlesHeader({
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
          CustomIconButton(
            height: 48,
            width: 48,
            variant: IconButtonVariant.NoFill,
            child: CustomImageView(
              color: ColorConstant.whiteA700,
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
            child: CustomImageView(
              color: ColorConstant.gray800,
              svgPath: ImageConstant.imgSearch,
            ),
          ),
        ],
      ),
    );
  }
}

