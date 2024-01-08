import 'package:flutter/material.dart';

class BibleService extends ChangeNotifier {
  static const List<String> tabBarItems = [
    'Libros',
    'Capítulos',
    'Versículos',
    'Tab'
  ];
  static const List<String> bookNames = [
    'Génesis',
    'Éxodo',
    'Levítico',
    'Números',
    'Deuteronomio',
    'Josué',
    'Jueces',
    'Rut',
    'Samuel I',
    'Reyes I',
    'Rut',
    'Samuel I',
    'Reyes I',
    'Rut',
    'Samuel I',
    'Reyes I',
  ];
  static const int amountOfChapters = 40;
  static const int amountOfVerses = 25;
}
