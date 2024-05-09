import 'dart:convert';

import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_app/core/models/book.dart';

class BookService extends ChangeNotifier {
  EpubBook selectedBook = EpubBook();
  int chapterIndex = 0;
  int subchapterIndex = 0;
  String chapterTitle = '';
  EpubChapter subchapterSelected = EpubChapter();

  // EpubBook get selectedBook => _selectedBook;

  // int get chapterIndex => _chapterIndex;

  // int get subchapterIndex => _subchapterIndex;

  // EpubChapter get subchapterSelected => _subchapterSelected;

  // set chapterIndex(int index) {
  //   chapterIndex = index;
  // }

  // set subchapterIndex(int index) {
  //   subchapterIndex = index;
  // }

  // set subchapterSelected(EpubChapter chapter) {
  //   subchapterSelected = chapter;
  // }

  Future<List<Book>> getBooksFromJson() async {
    String response = await rootBundle.loadString('assets/json/books.json');
    final Map<dynamic, dynamic> data = json.decode(response);

    final List<dynamic> items = data['books'];

    List<Book> bookList = items.map((item) {
      return Book.fromMap(item);
    }).toList();

    return bookList;
  }

  getChapterSelected() {
    return selectedBook.Chapters![chapterIndex].SubChapters![subchapterIndex];
  }

  setSelected(EpubChapter subchapter) {
    subchapterSelected = subchapter;
    notifyListeners();
  }

  moveSubchapter(String action) {
    int move;

    move = action == 'next' ? 1 : -1;

    subchapterSelected = selectedBook
        .Chapters![chapterIndex].SubChapters![(subchapterIndex) + move];
    subchapterIndex = subchapterIndex + move;

    notifyListeners();
  }

  bool hasChapterOrSubChapter() {
    return selectedBook.Chapters != null &&
        selectedBook.Chapters!.isNotEmpty &&
        selectedBook.Chapters![chapterIndex].SubChapters != null &&
        selectedBook.Chapters![chapterIndex].SubChapters!.isNotEmpty;
  }
}
