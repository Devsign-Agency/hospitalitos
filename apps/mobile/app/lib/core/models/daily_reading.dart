import 'dart:convert';

class DailyReading {
  String date;
  String title;
  List<Reading> readings;

  DailyReading({
    required this.title,
    required this.date,
    required this.readings,
  });

  factory DailyReading.fromJson(String str) =>
      DailyReading.fromMap(json.decode(str));

  factory DailyReading.fromMap(Map<String, dynamic> json) => DailyReading(
        title: json['title'],
        date: json['date'],
        readings:
            List<Reading>.from(json['readings'].map((x) => Reading.fromMap(x))),
      );
}

class Reading {
  String title;
  String verses;

  Reading({
    required this.title,
    required this.verses,
  });

  factory Reading.fromJson(String str) => Reading.fromMap(json.decode(str));

  factory Reading.fromMap(Map<String, dynamic> json) => Reading(
        title: json['title'],
        verses: json['verses'],
      );
}
