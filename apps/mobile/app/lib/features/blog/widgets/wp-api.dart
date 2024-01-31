import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<dynamic>> fetchWpPosts() async {
  const url = 'https://hospitalitosdelafe.org/wp-json/wp/v2/posts?_embed';
  final response = await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
   var convertDatatoJson = json.decode(response.body);
  return convertDatatoJson;
}

Future<List<dynamic>> searchPostsWp(String query) async {
  final url = 'https://hospitalitosdelafe.org/wp-json/wp/v2/posts?_embed&fields=title,content.rendered&search=';
  final response = await http.get(Uri.parse(url+query), headers: {"Accept": "application/json"}, );
  var convertDatatoJson = json.decode(response.body);
  return convertDatatoJson;
}