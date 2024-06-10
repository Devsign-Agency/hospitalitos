class PopupMenuItemModel {
  final int id;
  final String title;
  final PopuMenuItemValue? value;
  final Function onTappedItem;

  PopupMenuItemModel(
      {required this.id,
      required this.title,
      required this.onTappedItem,
      this.value});
}

enum PopuMenuItemValue { textSetting, share, bookmarks }
