import 'dart:typed_data';

import 'package:epub_view/epub_view.dart' hide Image;
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mobile_app/core/models/epub.arguments.dart';

class Chapter2Page extends StatelessWidget {
  // static const String route = 'book/chapter';
  // final EpubBook book;
  // final EpubChapter chapter;

  const Chapter2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as EpubArguments;
    final book = arguments.book;
    final chapter = arguments.chapter;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SelectionArea(
                child: Html(
                    style: {
                      'body': Style(
                          color: Colors.black87, fontSize: FontSize.xLarge)
                    },
                    data: chapter?.HtmlContent,
                    customRenders: {
                      tagMatcher('img'):
                          CustomRender.widget(widget: (context, buildChildren) {
                        final url = context.tree.element!.attributes['src']!
                            .replaceAll('../', '');
                        return Image(
                          image: MemoryImage(
                            Uint8List.fromList(
                              book!.Content!.Images![url]!.Content!,
                            ),
                          ),
                        );
                      })
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
