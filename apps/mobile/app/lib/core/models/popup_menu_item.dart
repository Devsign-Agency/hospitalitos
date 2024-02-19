class PopupMenuItemModel {
  final int id;
  final String title;
  final Function onTappedItem;

  PopupMenuItemModel(
      {required this.id, required this.title, required this.onTappedItem});
}
