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
  List<Verse> versiculos;

  Chapter(
      {required this.chapter,
      required this.ctdverses,
      required this.verses,
      required this.versiculos});

  factory Chapter.fromMap(Map<String, dynamic> json) => Chapter(
      chapter: json['chapter'],
      ctdverses: json['ctd_verses'],
      verses: json['verses'],
      versiculos: List<Verse>.from(json['verses']
          .entries
          .map((entry) => Verse(id: entry.key, verse: entry.value))
          .toList()));

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

  Verse getVerseById(String id) {
    Verse verse = versiculos.firstWhere((element) {
      print('element: ${element.id}');
      print('id: $id');
      return element.id == id.toString().trim();
    }, orElse: () => Verse(id: '', verse: ''));

    return verse;
  }

  List<Verse> getVersesByRange(int start, int end) {
    List<Verse> verses = [];

    for (var element in versiculos) {
      if (int.parse(element.id) >= start && int.parse(element.id) <= end) {
        verses.add(element);
      }
    }

    return verses;
  }
}

class Verse {
  String id;
  String verse;

  Verse({required this.id, required this.verse});

  @override
  String toString() {
    return 'id: $id verse: $verse';
  }
}
