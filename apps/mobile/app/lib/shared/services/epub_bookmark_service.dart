import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_app/shared/shared.dart';

import '../../core/app_export.dart';

class EpubBookmarkService with ChangeNotifier {
  List<Bookmark> bookmarks = [];

  List<Bookmark> getBookmarks() {
    if (Preferences.markerList.isNotEmpty) {
      List<dynamic> bookMarksString = json.decode(Preferences.markerList);

      bookmarks =
          bookMarksString.map<Bookmark>((e) => Bookmark.fromJson(e)).toList();
    }

    return bookmarks;
  }

  List<Bookmark> getBookmarksByBook(String bookName) {
    bookmarks = getBookmarks();

    bookmarks =
        bookmarks.where((bookmark) => bookmark.bookName == bookName).toList();

    return bookmarks;
  }

  Future<Bookmark> createBookmark(Map<String, dynamic> data) {
    bookmarks = getBookmarks();

    Bookmark newBookmark = Bookmark(
        id: DateTime.now().toString(),
        bookName: data['bookName'],
        chapterName: data['chapterName'],
        text: data['text'],
        date: data['date'],
        offset: data['offset']);

    bookmarks.add(newBookmark);

    Preferences.markerList = encode(bookmarks);

    notifyListeners();

    return Future.sync(() => newBookmark);
  }

  void deleteBookmark(String id) {
    int index = bookmarks.indexWhere((bookmark) => bookmark.id == id);

    if (index > -1) {
      bookmarks.removeAt(index);

      Preferences.markerList = encode(bookmarks);
      notifyListeners();
    }
  }

  String encode(List<Bookmark> bookmarks) {
    List<Map<String, dynamic>> bookmarksMap =
        (bookmarks.map((e) => Bookmark.toMap(e)).toList());

    return json.encode(bookmarksMap);
  }
}
