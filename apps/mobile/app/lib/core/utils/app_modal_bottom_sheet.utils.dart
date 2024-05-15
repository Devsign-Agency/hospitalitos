import 'package:flutter/material.dart';

class AppModalBottomSheet {
  static modalBottomSheet(BuildContext context, Widget child) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        context: context,
        builder: (context) => child);
  }
}
