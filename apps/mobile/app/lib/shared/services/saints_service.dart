import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_app/core/models/saint.dart';

class SaintsService with ChangeNotifier {
  SaintsService() {}
  Future<List<Saint>> getSaintsToday() async {
    String response = await rootBundle.loadString('assets/json/saints.json');
    final Map<dynamic, dynamic> data = json.decode(response);
    List<Saint> saints = [];

    List<String> splitDate = DateTime.now().toString().split('-');
    String date =
        '${splitDate[0]}-${splitDate[1]}-${splitDate[2].substring(0, 2)}';
    List<dynamic> results = data['data'];

    dynamic saintsToday = results
        .firstWhere((element) => element['date'] == date, orElse: () => null);

    if (saintsToday != null) {
      for (var element in saintsToday['saints']) {
        Saint saint = Saint.fromMap(element);

        saints.add(saint);
      }
    } else {
      return [];
    }

    return saints;
  }
}
