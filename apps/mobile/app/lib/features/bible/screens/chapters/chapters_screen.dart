import 'package:flutter/material.dart';
import 'package:mobile_app/core/models/list_view_favorite.dart';

import '../../../../core/app_export.dart';
import '../../../../widgets/widgets.dart';

class ChaptersScreen extends StatefulWidget {
  static const String route = 'chapters-route';
  const ChaptersScreen({Key? key}) : super(key: key);

  @override
  State<ChaptersScreen> createState() => _ChaptersScreenState();
}

class _ChaptersScreenState extends State<ChaptersScreen> {
  bool _isEditing = false;
  late List<Map<String, dynamic>> actions = [];

  @override
  void initState() {
    super.initState();
    initActions();
  }

  @override
  Widget build(BuildContext context) {
    final List<ListViewFavoriteModel> chapterList = [
      ListViewFavoriteModel(id: '', title: 'Génesis 1:16'),
      ListViewFavoriteModel(id: '', title: 'Génesis 1:16'),
      ListViewFavoriteModel(id: '', title: 'Génesis 1:16'),
      ListViewFavoriteModel(id: '', title: 'Génesis 1:16'),
    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: _isEditing ? 'Guardado' : 'Editar',
        backgroundColor: ColorConstant.gray50,
        iconButtonVariant: !_isEditing
            ? IconButtonVariant.FillGray300
            : IconButtonVariant.NoFill,
        // hideActions: _isEditing,
        actions: [...actions],
      ),
      body: Column(children: [
        // builds a list, but if it is empty it shows a notification message
        _buildMainContent(chapterList)
      ]),
    );
  }

  void _changeModeView() {
    actions.clear();
    _isEditing = !_isEditing;
    if (!_isEditing) {
      initActions();
    } else {
      actions = [
        {
          'icon': ImageConstant.imgCloseGray24x24,
          'action': () => {_changeModeView()}
        },
      ];
    }
    setState(() {});
  }

  void initActions() {
    actions = [
      {
        'icon': ImageConstant.imgSearch,
        'action': () => {print('Search...')}
      },
      {
        'icon': ImageConstant.imgEdit,
        'action': () => {_changeModeView()}
      },
    ];
  }

  void _handleActions() {
    print('You have clicked!');
  }

  Widget _buildMainContent(List<ListViewFavoriteModel> chapterList) {
    return chapterList.isNotEmpty
        ? Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: ListViewItemFavorite(
                isEditing: _isEditing,
                items: chapterList,
                onTappedItem: (ListViewFavoriteModel item) {
                  print(item.title);
                },
              ),
            ))
        : NotificationEmptyList(
            title: 'Parece que aún no has empezado',
            message:
                'Recuerda que puedes guardar los capítulos que quieras de la Biblia para tenerlos siempre a la mano.',
            label: 'Ir a la Biblia',
          );
  }
}
