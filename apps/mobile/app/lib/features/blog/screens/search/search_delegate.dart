import 'package:flutter/material.dart';

class PostsSearchDelegate extends SearchDelegate {

  @override
  String get searchFieldLabel => 'Buscar';

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [ IconButton(
      icon: Icon( Icons.clear), 
      onPressed: () { 
        query = '';
       },
    )];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    //throw UnimplementedError();

      return IconButton(
      icon: Icon( Icons.arrow_back), 
      onPressed: () { 
        close(context, null);
       },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    //throw UnimplementedError();

        return Text('build results');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    //throw UnimplementedError();

    if( query.isEmpty ){
      return Center(child: Icon( Icons.article_outlined , color: Colors.black38, size: 100));
    }

    return Container();
  }

}