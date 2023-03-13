import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';


class BookCard extends StatelessWidget {

  final EpubBook document;

  const BookCard({Key? key, required this.document}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(document.Title!),
     ),
   );
  }
}
