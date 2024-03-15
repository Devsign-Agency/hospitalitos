import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_app/core/models/BookBible.dart';

class BibleService extends ChangeNotifier {
  static const List<String> tabBarItems = [
    'Libros',
    'Capítulos',
    'Versículos',
    'Tab'
  ];
  static const List<String> bookNames = [
    'Génesis',
    'Éxodo',
    'Levítico',
    'Números',
    'Deuteronomio',
    'Josué',
    'Jueces',
    'Rut',
    'Samuel I',
    'Reyes I',
    'Rut',
    'Samuel I',
    'Reyes I',
    'Rut',
    'Samuel I',
    'Reyes I',
  ];
  static const int amountOfChapters = 40;
  static const int amountOfVerses = 25;
  List<BookBible> books = [];
  late BookBible selectedBook;
  late Map<String, dynamic> selectedVerses = {};

  Future<List<BookBible>> getBooks() async {
    String response = await rootBundle.loadString('assets/json/bible.json');
    final Map<dynamic, dynamic> data = json.decode(response);
    books = [];

    data.forEach((key, value) {
      BookBible book = BookBible.fromMap(value);
      book.name = key;

      books.add(book);
    });
    print('libros: ${books.length}');

    return books;
  }

  List<Chapter> getChaptersByBook(BookBible book) {
    return book.chapters;
  }

  Map<String, dynamic> getVersesByChapter(Chapter chapter) {
    return chapter.verses;
  }

  setSelectedBook(BookBible book) {
    selectedBook = book;

    notifyListeners();
  }

  setSelectedVerses(Map<String, dynamic> verses) {
    selectedVerses = verses;

    print(selectedVerses.length);

    notifyListeners();
  }
}
