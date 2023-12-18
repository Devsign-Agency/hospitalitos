class ListViewFavoriteModel {
  String id;
  String title;
  String? image;

  ListViewFavoriteModel({
    required this.id,
    required this.title,
    this.image,
  });
}
