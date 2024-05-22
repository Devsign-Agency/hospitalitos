class Bookmark {
  String id;
  String bookName;
  String chapterName;
  String text;
  DateTime date;
  String offset;

  Bookmark(
      {required this.id,
      required this.bookName,
      required this.chapterName,
      required this.text,
      required this.date,
      required this.offset});

  @override
  String toString() {
    return '$bookName $chapterName $offset';
  }
}
