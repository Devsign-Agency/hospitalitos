import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_app/shared/shared.dart';

class MarkerService with ChangeNotifier {
  List<dynamic> getMarkerList(String bookTitle, dynamic chapter) {
    List<dynamic> markerListBook = [];
    List<dynamic> markerList = [];

    if (Preferences.markerList.isNotEmpty) {
      markerListBook = json.decode(Preferences.markerList);
    }

    // Check if the book has any bookmarks
    int i = markerListBook.indexWhere(
      (element) => element['title'] == bookTitle,
    );

    if (i > -1) {
      // Find chapter markers
      Map<dynamic, dynamic> result = markerListBook[i]['chapters'].firstWhere(
          (element) => element['title'] == chapter!.Title,
          orElse: () => {});

      markerList = result['markers'] ?? [];
    } else {
      markerList = [];
    }

    return markerList;
  }

  addNewMarker(
      String bookTitle, dynamic chapter, Map<dynamic, dynamic> marker) {
    dynamic aux = Preferences.markerList ?? [];

    List<dynamic> markerListBook = [];

    if (aux.isNotEmpty) {
      markerListBook = json.decode(Preferences.markerList);
    }

    int i = markerListBook.indexWhere((element) {
      return element['title'] == bookTitle;
    });

    if (i > -1) {
      int chapterIndex = markerListBook[i]['chapters']
          .indexWhere((element) => element['title'] == chapter!.Title);

      if (chapterIndex > -1) {
        markerListBook[i]['chapters'][chapterIndex]['markers'].add(marker);
      } else {
        markerListBook[i]['chapters'].add({
          'title': chapter!.Title,
          'markers': [marker],
        });
      }
    } else {
      markerListBook.add({
        'title': bookTitle,
        'chapters': [
          {
            'title': chapter!.Title,
            'markers': [marker],
          }
        ]
      });
    }
    Preferences.markerList = json.encode(markerListBook);
  }

  deleteMarker(
      String bookTitle, dynamic chapter, Map<dynamic, dynamic> marker) {
    List<dynamic> markerListBook = json.decode(Preferences.markerList) ?? [];

    int i = markerListBook.indexWhere(
      (element) => element['title'] == bookTitle,
    );

    if (i > -1) {
      int chapterIndex = markerListBook[i]['chapters']
          .indexWhere((element) => element['title'] == chapter!.Title);

      if (chapterIndex > -1) {
        markerListBook[i]['chapters'][chapterIndex]['markers']
            .removeWhere((element) => element['id'] == marker['id']);

        Preferences.markerList = json.encode(markerListBook);
      }
    }

    notifyListeners();
  }
}
