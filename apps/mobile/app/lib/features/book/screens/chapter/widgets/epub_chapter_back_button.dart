import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../shared/shared.dart';
import '../../../../bible/screens/book_viewer/widgets/widgets.dart';

class EpubChapterBackButton extends StatelessWidget {
  final VoidCallback onTap;
  const EpubChapterBackButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    BookService bookService = Provider.of<BookService>(context, listen: true);

    if (bookService.hasChapterOrSubChapter() &&
        bookService.subchapterIndex > 0) {
      return Positioned(
        top: height * 0.70,
        left: 20,
        child: ButtonNavigationChapter(onTap: onTap, icon: Icons.arrow_back),
      );
    }

    return SizedBox();
  }
}
