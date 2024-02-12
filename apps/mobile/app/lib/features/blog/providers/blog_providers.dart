import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_app/features/blog/screens/search/search_response.dart';

class BlogProvider {
  final _baseUrl = 'https://hospitalitosdelafe.org/wp-json/wp/v2';
  final endPointSearch = '/search/?search=';


Future<List<dynamic>>  searchPosts( String query) async{
    var url = Uri.https(_baseUrl, endPointSearch , {
      query : query
    });

    final response = await http.get(url);
    final searchResponse =  json.decode(response.body);

    return searchResponse;
  }
}