import 'dart:convert';

import 'package:flutter/material.dart' hide Page;
import 'package:http/http.dart' as http;
import 'package:mobile_app/core/app_export.dart';

class CategoryService with ChangeNotifier {
  final apiUrl = Constants.apiUrl;
  late List<Category> categories;

  Future<List<Category>> getAll() async {
    List<Category> categories = [];
    print('obteniendo categorias');
    try {
      final url = Uri.parse('$apiUrl/category');
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
        }
      );
      print('categorias obtenidas $response');
      
      if (response.statusCode == 200) {
        final Page<Category> pageCategory = Page.fromJson(jsonDecode(response.body));
        categories = pageCategory.data;
      }
    } catch (e) {
        print(e);
    }
    return categories;
  }
}
