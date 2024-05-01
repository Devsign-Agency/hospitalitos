import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/app_export.dart';

class PrayerService extends ChangeNotifier {
  List<Prayer> prayers = [];

  PrayerService() {
    getPrayers();
  }

  getPrayers() async {
    String response = await rootBundle.loadString('assets/json/prayers.json');
    final Map<dynamic, dynamic> data = json.decode(response);

    List<dynamic> results = data['prayers'];

    for (var element in results) {
      Prayer reading = Prayer.fromMap(element);

      prayers.add(reading);
    }
    print('prayers $prayers');
  }
}
