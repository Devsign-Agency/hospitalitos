import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_app/core/models/BookBible.dart';
import 'package:mobile_app/shared/preferences.dart';

import '../../core/app_export.dart';
import '../../core/models/list_view_favorite.dart';

class BibleService extends ChangeNotifier {
  // State
  static List<BookBible> books = [];
  late BookBible _selectedBook;
  late Map<dynamic, String> _selectedVerses;
  late Chapter _selectedChapter;
  late int _startVerse;
  int verseNumber = 0;
  List<BookBible> _filteredBook = [];
  late String _selectedGroup = 'antiguo';
  List<ListViewFavoriteModel> bookmarks = [];

  String lastPage = '';

  // Getters
  BookBible get selectedBook => _selectedBook;

  Chapter get selectedChapter => _selectedChapter;

  Map<dynamic, String> get selectedVerses => _selectedVerses;

  int get startVerse => _startVerse;

  Map<String, dynamic> get versesByChapter => _selectedChapter.verses;

  List<BookBible> get filteredBook => _filteredBook;

  String get selectedGroup => _selectedGroup;

  // Constructor
  BibleService() {
    init();
    getBooks();
  }

  // Setters
  set selectedBook(BookBible book) {
    _selectedBook = book;
    notifyListeners();
  }

  set selectedChapter(Chapter chapter) {
    _selectedChapter = chapter;
    notifyListeners();
  }

  set selectedVerses(Map<dynamic, String> verses) {
    _selectedVerses = verses;
    notifyListeners();
  }

  set startVerse(int startVerse) {
    _startVerse = startVerse;
    notifyListeners();
  }

  set setVerseNumber(int value) {
    verseNumber = value;
    notifyListeners();
  }

  set filteredBook(List<BookBible> books) {
    filteredBook = books;
    notifyListeners();
  }

  set selectedGroup(String group) {
    _selectedGroup = group;
    notifyListeners();
  }

  // Initialize the state of the bible provider
  void init() {
    selectedBook = BookBible(name: '', chapters: []);
    selectedVerses = {};
    selectedChapter =
        Chapter(chapter: '', ctdverses: 0, verses: {}, versiculos: []);
    startVerse = -1;

    selectedGroup = 'antiguo';

    // getBookMarks();

    notifyListeners();
  }

  // Call to json api to get all the books of the bible
  void getBooks() async {
    String response = await rootBundle.loadString('assets/json/bible.json');
    final Map<dynamic, dynamic> data = json.decode(response);
    books = [];

    data.forEach((key, value) {
      BookBible book = BookBible.fromMap(value);
      book.name = key;

      books.add(book);
    });

    getBooksByGroup('antiguo');
  }

  // Get bible book by title
  static BookBible getBookByTitle(String title) {
    BookBible bookBible =
        BibleService.books.firstWhere((element) => element.name == title);

    return bookBible;
  }

  static String getVerseByPath(String path) {
    List<String> paths = path.split('/');
    String bookName = paths[0];
    String chapterNumber = paths[1];
    String verseNumber = paths[2];

    BookBible bookBible = getBookByTitle(bookName);

    Chapter chapter = bookBible.getChapterByNumber(chapterNumber);

    String verse = chapter.getVerseByNumber(verseNumber);

    return verse;
  }

  List<dynamic> getPageList() {
    List<dynamic> markerListBook = [];

    if (Preferences.pageList.isNotEmpty) {
      markerListBook = json.decode(Preferences.pageList);
    }

    return markerListBook;
  }

  String getPage() {
    String pathVerse = getCurrentPage();
    dynamic aux = Preferences.pageList ?? [];

    List<dynamic> markerListBook = [];

    if (aux.isNotEmpty) {
      markerListBook = json.decode(Preferences.pageList);
    }

    String value = markerListBook.firstWhere((element) => element == pathVerse,
        orElse: () => '');

    return value;
  }

  void setLastPage() {
    Preferences.lastPage =
        '${selectedBook.name}/${selectedChapter.chapter}/$startVerse';

    lastPage = '${selectedBook.name}/${selectedChapter.chapter}/$startVerse';
  }

  void getBookByName(String name) {
    final BookBible? book = books.firstWhere((element) => element.name == name);

    if (book != null) {
      _selectedBook = book;
    }
  }

  void getChapterFromBook(BookBible book, int indexOfChapter) {
    _selectedChapter = book.chapters[indexOfChapter - 1];
  }

  String getCurrentPage() {
    dynamic keys = selectedVerses.keys;
    dynamic key = keys.toList()[0];

    return '${selectedBook.name}/${selectedChapter.chapter}/$key';
  }

  void addNewVerseSelected(Map<dynamic, String> verse) {
    dynamic keys = verse.keys;
    dynamic key = keys.toList()[0];

    if (selectedVerses.containsKey(key)) {
      selectedVerses.remove(key);
    } else {
      selectedVerses = {};
      selectedVerses.addAll(verse);
    }
    notifyListeners();
  }

  void clearVerseSelected() {
    selectedVerses = {};
    notifyListeners();
  }

  bool isVerseSelected(int numberOfVerse) {
    return selectedVerses.containsKey(numberOfVerse);
  }

  // moves the chapter forward or backward depending on the action
  void moveChapter(String action) {
    int move;

    move = action == 'next' ? 1 : -1;

    selectedChapter =
        selectedBook.chapters[(int.parse(selectedChapter.chapter) - 1) + move];
    startVerse = 1;
    selectedVerses = {};

    Scrollable.ensureVisible(GlobalObjectKey(startVerse).currentContext!);
  }

  void getBooksByGroup(String bookType) {
    int index = books.indexWhere((element) => element.name == ' Mateo');

    if (index > -1) {
      _filteredBook = bookType == 'antiguo'
          ? books.sublist(0, index + 1)
          : books.sublist(index, books.length);
    }

    _selectedGroup = bookType;

    notifyListeners();
  }
}
