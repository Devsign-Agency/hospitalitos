import 'package:flutter/material.dart';
import 'package:mobile_app/features/blog/screens/search/search_delegate.dart';
import 'package:mobile_app/features/blog/widgets/wp-api.dart';

import '../../../../core/app_export.dart';

import '../../../../widgets/widgets.dart';
import '../../widgets/article_card.dart';

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
      print('posts: $posts');

      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Blog',
          actions: [
            {
              'icon': ImageConstant.imgSearch,
              'action': () => {
                    showSearch(
                        context: context, delegate: PostsSearchDelegate())
                  }
            },
          ],
        ),
        body: Column(
          children: [_ArticlesList(posts: posts)],
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
        child: posts.isNotEmpty
            ? ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: posts.length,
                separatorBuilder: (_, __) => SizedBox(height: 20),
                itemBuilder: (_, int index) {
                  final item = posts[index];
                  Map<dynamic, dynamic> wppost = item;

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
