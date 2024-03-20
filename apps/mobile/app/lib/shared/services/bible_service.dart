import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_app/core/models/BookBible.dart';

class BibleService extends ChangeNotifier {
  static const List<String> tabBarItems = [
    'Libros',
    'Capítulos',
    'Versículos',
  ];
  static const List<String> bookNames = [];
  static const int amountOfChapters = 40;
  static const int amountOfVerses = 25;

  List<BookBible> books = [];
  BookBible _selectedBook = BookBible(name: '', chapters: []);
  Map<String, dynamic> _selectedVerses = {};
  Chapter _selectedChapter = Chapter(chapter: '', ctdverses: 0, verses: {});
  int verseNumber = 0;
  int startVerse = -1;
  int endVerse = -1;

  BookBible get selectedBook => _selectedBook;
  Chapter get selectedChapter => _selectedChapter;
  Map<String, dynamic> get selectedVerses => _selectedVerses;

  set selectedBook(BookBible book) {
    _selectedBook = book;

    notifyListeners();
  }

  set selectedChapter(Chapter chapter) {
    _selectedChapter = chapter;

    notifyListeners();
  }

  set selectedVerses(Map<String, dynamic> verses) {
    _selectedVerses = verses;

    notifyListeners();
  }

  setVerseNumber(int value) {
    verseNumber = value;

    notifyListeners();
  }

  Future<List<BookBible>> getBooks() async {
    String response = await rootBundle.loadString('assets/json/bible.json');
    final Map<dynamic, dynamic> data = json.decode(response);
    books = [];

    data.forEach((key, value) {
      BookBible book = BookBible.fromMap(value);
      book.name = key;

      books.add(book);
    });

    return books;
  }

  List<Chapter> getChaptersByBook(BookBible book) {
    return book.chapters;
  }

  Map<String, dynamic> getVersesByChapter(Chapter chapter) {
    return chapter.verses;
  }
}
