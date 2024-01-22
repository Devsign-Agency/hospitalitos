import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<dynamic>> fetchWpPosts() async {
  const url = 'https://hospitalitosdelafe.org/wp-json/wp/v2/posts?_embed';
  //const urlFetc =  `${this.url}`;

  final response = await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
   var convertDatatoJson = json.decode(response.body);
  return convertDatatoJson;
}
