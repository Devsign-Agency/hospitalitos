import 'package:flutter/material.dart';
import 'package:mobile_app/features/blog/providers/blog_providers.dart';
import 'package:mobile_app/features/blog/screens/search/search_response.dart';
import 'package:mobile_app/features/blog/widgets/article_card.dart';
import 'package:mobile_app/features/blog/widgets/wp-api.dart';
import 'package:provider/provider.dart';

class PostsSearchDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Buscar';

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    //throw UnimplementedError();

    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    //throw UnimplementedError();

     if (query.isEmpty) {
      return _emptyContainer();
    } else {
      return FutureBuilder(
          future: searchPostsWp(query),
          builder: (_, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              final posts = snapshot.data;
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
                            print(wppost['_embedded']['wp:featuredmedia'][0]
                                ['source_url']);
                            // var imageurl = wppost['_embedded']['wp:featuredmedia'][0];
                            return ArticleCard(
                                imgUrl: wppost['_embedded']['wp:featuredmedia']
                                    [0]['source_url'],
                                post: item);
                          })
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [Text('No se encontraron coincidencias')],
                            ),
                          ],
                        ),
                ),
              );
              ;
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          });
    }
  }

  Widget _emptyContainer() {
    return Center(
        child: Icon(Icons.article_outlined, color: Colors.black38, size: 100));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    //throw UnimplementedError();

    if (query.isEmpty) {
      return _emptyContainer();
    } else {
      return FutureBuilder(
          future: searchPostsWp(query),
          builder: (_, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              final posts = snapshot.data;
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
                            print(wppost['_embedded']['wp:featuredmedia'][0]
                                ['source_url']);
                            var imageCard = 'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg';
                            
                            return ArticleCard(
                                imgUrl: wppost['_embedded']['wp:featuredmedia']
                                    [0]['source_url'],
                                post: item);
                          })
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [Text('No se encontraron coincidencias')],
                            ),
                          ],
                        ),
                ),
              );
              ;
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          });
    }
    /* final searchProvider = Provider.of<BlogProvider>(context, listen: false);
  
*/

 
  }
}
