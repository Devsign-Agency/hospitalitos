import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../core/app_export.dart';

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
    DateTime now = DateTime.now();
    int year = now.year;
    int month = now.month;
    int day = now.day;
    String date = '$year-$month-$day';

    print(_dailyReadings);
    dailyReadingSelected = _dailyReadings.firstWhere((element) {
      print('element.date : ${element.date}');
      print('date: $date');
      return element.date == date;
    }, orElse: () => DailyReading(title: '', date: '', readings: []));

    print('dailyReading : $dailyReadingSelected');
    // notifyListeners();
    return dailyReadingSelected;
  }
}
