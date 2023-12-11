class Chat {
  String id;
  String title;
  String date;
  String? image;
  String comment;
  List? commentList;

  Chat({
    required this.id,
    required this.title,
    required this.date,
    required this.comment,
    this.image,
    this.commentList,
  });
}
