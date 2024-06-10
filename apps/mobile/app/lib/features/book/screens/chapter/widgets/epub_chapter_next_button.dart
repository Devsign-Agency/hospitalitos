import 'package:flutter/material.dart';
import 'package:mobile_app/features/bible/screens/book_viewer/widgets/button_navigation_chapter.dart';
import 'package:provider/provider.dart';

import '../../../../../shared/shared.dart';

class EpubChapterNextButton extends StatelessWidget {
  final VoidCallback onTap;

  const EpubChapterNextButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    BookService bookService = Provider.of<BookService>(context, listen: true);

    if (bookService.hasChapterOrSubChapter() &&
        bookService.subchapterIndex <
            bookService.selectedBook.Chapters![bookService.chapterIndex]
                    .SubChapters!.length -
                1) {
      return Positioned(
          right: 20,
          top: height * 0.70,
          child:
              ButtonNavigationChapter(onTap: onTap, icon: Icons.arrow_forward));
    }

    return SizedBox();
  }
}
