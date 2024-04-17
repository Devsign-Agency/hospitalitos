import 'package:http/http.dart' as http;


import 'dart:convert';


Future<List<dynamic>> fetchWpPosts() async {

  const url = 'https://hospitalitosdelafe.org/wp-json/wp/v2/posts?_embed';

  final response =
      await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
  var convertDatatoJson = json.decode(response.body);

  return convertDatatoJson;

}

Future<List<Map<String, dynamic>>> searchPostsWp(String query) async {
  final url = 'https://hospitalitosdelafe.org/wp-json/wp/v2/posts?_embed&fields=title,content.rendered&search=';

  final urlTest = 'https://hospitalitosdelafe.org/wp-json/wp/v2/posts?_embed';
  final response = await http.get(Uri.parse(urlTest), headers: {"Accept": "application/json"}, );
  var convertDatatoJson = json.decode(response.body);

  var listData = List<Map<String, dynamic>> .empty(growable: true);;
   convertDatatoJson.forEach((userDetail) {
    print('useDetail------- ${userDetail['title']['rendered']} ${userDetail['title']['rendered'].toString().contains(query)}');
      if (userDetail['title']['rendered'].toLowerCase().contains(query.toLowerCase())){
        listData.add(userDetail);
      }
        
    });
  return listData;
}
