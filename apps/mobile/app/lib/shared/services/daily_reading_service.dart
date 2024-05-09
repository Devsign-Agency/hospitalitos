import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app/shared/services/bible_service.dart';

import '../../core/app_export.dart';
import '../../core/models/BookBible.dart';

class DailyReadingService extends ChangeNotifier {
  List<DailyReading> _dailyReadings = [];
  DailyReading dailyReadingSelected =
      DailyReading(title: '', date: '', readings: []);

  List<DailyReading> get dailyReadings => _dailyReadings;

  set dailyReadings(List<DailyReading> list) {
    dailyReadings = list;

    // notifyListeners();
  }

  DailyReadingService() {
    getDailyReading();
  }

  getDailyReading() async {
    String response = await rootBundle.loadString('assets/json/readings.json');
    final Map<dynamic, dynamic> data = json.decode(response);

    List<dynamic> readings = data['readings'];

    for (var element in readings) {
      DailyReading reading = DailyReading.fromMap(element);

      dailyReadings.add(reading);
    }
  }

  DailyReading getDailyReadingSelected() {
    List<String> split = DateTime.now().toString().split('-');

    String year = split[0];
    String month = split[1];
    String day = split[2].substring(0, 2);

    String date = '$year-$month-$day';
    dailyReadingSelected = _dailyReadings.firstWhere((element) {
      return element.date == date;
    }, orElse: () => DailyReading(title: '', date: '', readings: []));

    // notifyListeners();
    return dailyReadingSelected;
  }

  List<Verse> getReadingsByPath(String bookTitle, String path) {
    String mappedPath = path.replaceAll('--', '-n;');
    List<String> chapters = mappedPath.split(';');

    BookBible book = BibleService.books.firstWhere((element) {
      return element.name.toLowerCase() == bookTitle;
    }, orElse: () => BookBible(name: '', chapters: []));
    List<Verse> verseList = [];

    for (var element in chapters) {
      List<String> separated = element.split(':');
      List<String> verses = separated[1].split(',');

      if (verses.isNotEmpty) {
        for (var element in verses) {
          if (element.contains('-')) {
            // Obtener versículos por rango
            List<String> splitVerses = element.split('-');
            int start = int.parse(splitVerses[0]);

            int end = splitVerses[1] == 'n'
                ? book.chapters[int.parse(separated[0]) - 1].versiculos.length
                : int.parse(splitVerses[1]);

            List<Verse> verses = book.chapters[int.parse(separated[0]) - 1]
                .getVersesByRange(start, end);
            verseList.addAll(verses);
          } else {
            // Obtener versículos dado un número
            Verse verse = book.chapters[int.parse(separated[0]) - 1]
                .getVerseById(element);

            verseList.add(verse);
          }
        }
      }
    }

    return verseList;
  }
}
