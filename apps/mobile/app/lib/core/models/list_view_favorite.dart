class ListViewFavoriteModel {
  String id;
  String title;
  String? description;
  String? image;
  String? date;

  ListViewFavoriteModel({
    required this.id,
    required this.title,
    this.image,
    this.date,
    this.description,
  });
}
