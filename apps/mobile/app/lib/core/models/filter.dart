import 'package:flutter/material.dart';

class FilterData {
  final int id;
  final String name;
  final String? icon;
  bool isSelected = false;

  FilterData({required this.id, required this.name, this.icon, isSelected});
}
