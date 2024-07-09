class Bookmark {
  String id;
  String bookName;
  String chapterName;
  String? text;
  DateTime date;
  String? offset;

  Bookmark(
      {required this.id,
      required this.bookName,
      required this.chapterName,
      this.text,
      required this.date,
      this.offset});

  @override
  String toString() {
    return '$bookName $chapterName $offset';
  }

  factory Bookmark.fromJson(Map<String, dynamic> jsonData) {
    return Bookmark(
      id: jsonData['id'],
      bookName: jsonData['bookName'],
      chapterName: jsonData['chapterName'],
      text: jsonData['text'] ?? '',
      date: DateTime.parse(jsonData['date']),
      offset: jsonData['offset'] ?? '',
    );
  }

  static Map<String, dynamic> toMap(Bookmark bookmark) => {
        'id': bookmark.id,
        'bookName': bookmark.bookName,
        'chapterName': bookmark.chapterName,
        'text': bookmark.text ?? '',
        'date': bookmark.date.toString(),
        'offset': bookmark.offset ?? '',
      };
}
