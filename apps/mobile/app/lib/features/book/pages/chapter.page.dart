import 'dart:typed_data';

import 'package:epub_view/epub_view.dart' hide Image;
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ChapterPage extends StatelessWidget {
  static const String route = 'book/chapter';
  final EpubBook book;
  final EpubChapter chapter;

  const ChapterPage({Key? key, required this.book, required this.chapter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Html(
        style: {
          'body': Style(
            color: Colors.black87
          )
        },
        data: chapter.HtmlContent,
        customRenders: {
          tagMatcher('img'):
              CustomRender.widget(widget: (context, buildChildren) {
            final url =
                context.tree.element!.attributes['src']!.replaceAll('../', '');
            return Image(
              image: MemoryImage(
                Uint8List.fromList(
                  book.Content!.Images![url]!.Content!,
                ),
              ),
            );
          }),
        },
      ),
    );
  }
}
