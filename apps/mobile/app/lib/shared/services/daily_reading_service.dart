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
}
