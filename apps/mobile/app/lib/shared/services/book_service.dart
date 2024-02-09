import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_app/core/models/book.dart';

class BookService with ChangeNotifier {
  Future<List<Book>> getBooksFromJson() async {
    String response = await rootBundle.loadString('assets/json/books.json');
    final Map<dynamic, dynamic> data = json.decode(response);

    final List<dynamic> items = data['books'];

    List<Book> bookList = items.map((item) {
      return Book.fromMap(item);
    }).toList();

    return bookList;
  }
}
