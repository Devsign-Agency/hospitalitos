import 'package:epub_view/epub_view.dart';

class EpubArguments {
  final EpubBook? book;
  final EpubChapter? chapter;
  final double? offset;

  EpubArguments({this.book, this.chapter, this.offset});
}
