import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_app/core/models/bible_bookmark.dart';
import 'package:mobile_app/shared/shared.dart';

import '../../core/app_export.dart';
import '../../core/models/BookBible.dart';

class BibleBookMarkService extends ChangeNotifier {
  List<BibleBookMark> bookmarks = [];

  List<BibleBookMark> getBookMarks() {
    if (Preferences.pageList.isNotEmpty) {
      List<dynamic> bookMarksString = json.decode(Preferences.pageList);

      bookmarks = bookMarksString
          .map<BibleBookMark>((e) => BibleBookMark.fromJson(e))
          .toList();
    }

    return bookmarks;
  }

  Future<BibleBookMark> addBookMark(
      BookBible book, Chapter chapter, int verse, String comment) {
    List<BibleBookMark> markerListBook = getBookMarks();

    BibleBookMark newBookMark = BibleBookMark(
        id: DateTime.now().toString(),
        bookName: book.name,
        chapter: int.parse(chapter.chapter),
        verse: verse,
        comment: comment,
        date: DateTime.now());

    markerListBook.add(newBookMark);

    Preferences.pageList = encode(markerListBook);

    bookmarks = markerListBook;
    notifyListeners();

    return Future.sync(() => newBookMark);
  }

  void editBookMark(String id, String comment) {
    List<BibleBookMark> bookmarkList = getBookMarks();

    int index = bookmarkList.indexWhere((BibleBookMark element) {
      return element.id == id;
    });

    if (index > -1) {
      bookmarkList[index].comment = comment;
    }

    bookmarks = bookmarkList;
    Preferences.pageList = encode(bookmarkList);

    notifyListeners();
  }

  deleteBookMark(String id) {
    List<BibleBookMark> bookmarkList = getBookMarks();

    int index = bookmarkList.indexWhere((BibleBookMark element) {
      return element.id == id;
    });

    if (index > -1) {
      bookmarkList.removeAt(index);
    }

    bookmarks = bookmarkList;
    Preferences.pageList = encode(bookmarkList);

    notifyListeners();
  }

  String encode(List<BibleBookMark> bookmarks) {
    List<Map<String, dynamic>> bookmarksMap =
        (bookmarks.map((e) => BibleBookMark.toMap(e)).toList());

    return json.encode(bookmarksMap);
  }
}
