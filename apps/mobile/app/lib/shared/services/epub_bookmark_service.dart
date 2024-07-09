import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_app/shared/shared.dart';

import '../../core/app_export.dart';

class EpubBookmarkService with ChangeNotifier {
  getAllBookmarks() {
    List<Bookmark> bookmarks = [];
    if (Preferences.markerList.isNotEmpty) {
      List<dynamic> bookMarksString = json.decode(Preferences.markerList);

      bookmarks =
          bookMarksString.map<Bookmark>((e) => Bookmark.fromJson(e)).toList();
    }

    return bookmarks;
  }

  getBookmarksByBook(String bookName) {
    List<Bookmark> bookmarks = getAllBookmarks();
    bookmarks =
        bookmarks.where((bookmark) => bookmark.bookName == bookName).toList();

    return bookmarks;
  }

  void createBookmark(Map<String, dynamic> data) {
    List<Bookmark> bookmarks = getAllBookmarks();

    Bookmark newBookmark = Bookmark(
        id: DateTime.now().toString(),
        bookName: data['bookName'],
        chapterName: data['chapterName'],
        date: data['date']);

    bookmarks.add(newBookmark);

    Preferences.markerList = encode(bookmarks);

    notifyListeners();
  }

  void deleteBookmark(String id) {
    List<Bookmark> bookmarks = getAllBookmarks();

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

  bool checkChapterBelongsToBookmark(String chapterName) {
    List<Bookmark> bookmarks = getAllBookmarks();
    List<Bookmark> bookmarkFound = bookmarks
        .where((bookmark) => bookmark.chapterName == chapterName)
        .toList();

    return bookmarkFound.isNotEmpty;
  }

  void deleteBookmarkByChapterName(String chapterName) {
    List<Bookmark> bookmarks = getAllBookmarks();
    int index =
        bookmarks.indexWhere((bookmark) => bookmark.chapterName == chapterName);

    if (index > -1) {
      bookmarks.removeAt(index);

      Preferences.markerList = encode(bookmarks);
      notifyListeners();
    }
  }
}
