import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_app/core/models/BookBible.dart';
import 'package:mobile_app/shared/preferences.dart';

class BibleService extends ChangeNotifier {
  static const List<String> tabBarItems = [
    'Libros',
    'Capítulos',
    'Versículos',
  ];
  List<BookBible> books = [];
  BookBible _selectedBook = BookBible(name: '', chapters: []);
  Map<String, dynamic> _selectedVerses = {};
  Chapter _selectedChapter = Chapter(chapter: '', ctdverses: 0, verses: {});
  int verseNumber = 0;
  int _startVerse = -1;
  int _endVerse = -1;

  BookBible get selectedBook => _selectedBook;
  Chapter get selectedChapter => _selectedChapter;
  Map<String, dynamic> get selectedVerses => _selectedVerses;
  int get startVerse => _startVerse;
  int get endVerse => _endVerse;

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

  set startVerse(int startVerse) {
    _startVerse = startVerse;

    notifyListeners();
  }

  set endVerse(int endVerse) {
    _endVerse = endVerse;

    notifyListeners();
  }

  setVerseNumber(int value) {
    verseNumber = value;

    notifyListeners();
  }

  void resetState() {
    _selectedBook = BookBible(name: '', chapters: []);
    _selectedVerses = {};
    _selectedChapter = Chapter(chapter: '', ctdverses: 0, verses: {});
    _startVerse = -1;
    _endVerse = -1;
  }

  // TODO: Optimizar función para guardar los libros en una variable
  Future<List<BookBible>> getBooks() async {
    if (books.isNotEmpty) {
      return books;
    }

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

  List<dynamic> getPageList() {
    List<dynamic> markerListBook = [];

    if (Preferences.pageList.isNotEmpty) {
      markerListBook = json.decode(Preferences.pageList);
    }

    print(markerListBook);

    return markerListBook;
  }

  addNewPage() {
    String pathVerse = endVerse != -1 && endVerse != startVerse
        ? '${selectedBook.name}/${selectedChapter.chapter}/$startVerse-$endVerse'
        : '${selectedBook.name}/${selectedChapter.chapter}/$startVerse';

    dynamic aux = Preferences.pageList ?? [];

    List<dynamic> markerListBook = [];

    if (aux.isNotEmpty) {
      markerListBook = json.decode(Preferences.pageList);
    }

    markerListBook.add(pathVerse);
    Preferences.pageList = json.encode(markerListBook);
    print('lastPage: ${Preferences.lastPage}');
    getPageList();
  }

  setLastPage() {
    String pathVerse = endVerse != -1 && endVerse != startVerse
        ? '${selectedBook.name}/${selectedChapter.chapter}/$startVerse-$endVerse'
        : '${selectedBook.name}/${selectedChapter.chapter}/$startVerse';

    Preferences.lastPage = pathVerse;
  }

  // TODO: Dado el startVerse y endVerse obtener los versículos
  getVersesByRange(int startVerse, int endVerse) {
    int startIndex = startVerse;
    int endIndex = endVerse;

    if (endIndex == -1) {
      endIndex = startIndex;
    }

    final Map<String, dynamic> filteredMap = { for (var k in _selectedChapter.verses.keys.where(
            (k) => int.parse(k) >= startIndex && int.parse(k) <= endIndex)) k : _selectedChapter.verses[k] };

    filteredMap.forEach((k, v) => print('key: $k, value: $v'));
    selectedVerses = filteredMap;
  }

  getBookByName(String name) {
    final BookBible? book = books.firstWhere((element) => element.name == name);

    if (book != null) {
      _selectedBook = book;
    }
  }

  getChapterFromBook(BookBible book, int indexOfChapter) {
    _selectedChapter = book.chapters[indexOfChapter - 1];
  }

  deletePage(String pagePath) {
    List<dynamic> pages = json.decode(Preferences.pageList) ?? [];

    int i = pages.indexWhere(
      (element) => element == pagePath,
    );

    if (i > -1) {
      pages.removeAt(i);
      Preferences.pageList = json.encode(pages);
    }

    notifyListeners();
  }
}
