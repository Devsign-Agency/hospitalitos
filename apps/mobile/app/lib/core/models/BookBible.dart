// ignore_for_file: void_checks

import 'dart:convert';

class BookBible {
  String name;
  List<Chapter> chapters;

  BookBible({required this.name, required this.chapters});

  factory BookBible.fromJson(String str) => BookBible.fromMap(json.decode(str));

  factory BookBible.fromMap(Map<String, dynamic> json) => BookBible(
        name: '',
        chapters:
            List<Chapter>.from(json['chapters'].map((x) => Chapter.fromMap(x))),
      );

  Chapter getChapterByNumber(String number) {
    Chapter chapter =
        chapters.firstWhere((element) => element.chapter == number);

    return chapter;
  }
}

class Chapter {
  String chapter;
  int ctdverses;
  Map<String, dynamic> verses;

  Chapter(
      {required this.chapter, required this.ctdverses, required this.verses});

  factory Chapter.fromMap(Map<String, dynamic> json) => Chapter(
        chapter: json['chapter'],
        ctdverses: json['ctd_verses'],
        verses: json['verses'],
      );

  String getVerseByNumber(String number) {
    String verse = '';
    verses.forEach((key, value) {
      if (key == number) {
        verse = '$value';
      }
    });

    return verse;
  }

  String getVerseByPath(String path) {
    List<String> paths = path.split('/');
    String verseNumber = paths[2];

    String verse = getVerseByNumber(verseNumber);

    return verse;
  }
}
