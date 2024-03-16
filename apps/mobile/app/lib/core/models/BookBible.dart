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
}
