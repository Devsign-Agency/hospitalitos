import 'dart:convert';

import 'package:mobile_app/core/models/BookBible.dart';

class BibleBookMark {
  String id;
  String bookName;
  int chapter;
  int verse;
  String comment;
  DateTime date;

  BibleBookMark(
      {required this.id,
      required this.bookName,
      required this.chapter,
      required this.verse,
      required this.comment,
      required this.date});

  Map<String, dynamic> toJson() => {
        'id': id,
        'bookName': bookName,
        'chapter': chapter,
        'verse': verse,
        'comment': comment,
        'date': date,
      };

  factory BibleBookMark.fromJson(Map<String, dynamic> jsonData) {
    return BibleBookMark(
      id: jsonData['id'],
      bookName: jsonData['bookName'],
      chapter: jsonData['chapter'],
      verse: jsonData['verse'],
      comment: jsonData['comment'],
      date: DateTime.parse(jsonData['date']),
    );
  }

  static Map<String, dynamic> toMap(BibleBookMark bookmark) => {
        'id': bookmark.id,
        'bookName': bookmark.bookName,
        'chapter': bookmark.chapter,
        'verse': bookmark.verse,
        'comment': bookmark.comment,
        'date': bookmark.date.toString()
      };

  // static BibleBookMark fromString(String parsedString) {
  //   Map<String, dynamic> parsedMap = json.decode(parsedString);

  // }

  static BibleBookMark decode(String musics) => json
      .decode(musics)
      .map<BibleBookMark>((item) => BibleBookMark.fromJson(item))
      .toList();
}
