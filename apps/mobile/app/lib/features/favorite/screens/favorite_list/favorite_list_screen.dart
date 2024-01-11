import 'package:flutter/material.dart';
import 'package:mobile_app/shared/shared.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_export.dart';
import '../../../../core/models/chip_item.dart';
import '../../../../core/models/list_view_favorite.dart';
import '../../../../widgets/filters_bar.dart';
import '../../../../widgets/widgets.dart';

class FavoriteListScreen extends StatefulWidget {
  static String route = 'favorite-list';

  const FavoriteListScreen({super.key});

  @override
  State<FavoriteListScreen> createState() => _FavoriteListScreenState();
}

class _FavoriteListScreenState extends State<FavoriteListScreen> {
  bool _isEditing = false;
  late List<Map<String, dynamic>> actions = [];

  @override
  void initState() {
    super.initState();
    initActions();
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

  @override
  Widget build(BuildContext context) {
    FavoriteService favoriteService = Provider.of<FavoriteService>(context);
    List<ChipItem> categories = [
      ChipItem(id: 1, name: 'Sin empezar', icon: ImageConstant.imgPlay),
      ChipItem(
          id: 2,
          name: 'Descargando',
          icon: ImageConstant.imgDownloadGray30024x24),
      ChipItem(id: 3, name: 'Sin empezar', icon: ImageConstant.imgPlay),
      ChipItem(id: 1, name: 'Sin empezar', icon: ImageConstant.imgMusic),
      ChipItem(id: 2, name: 'Sin empezar', icon: ImageConstant.imgMusic),
      ChipItem(id: 3, name: 'Sin empezar', icon: ImageConstant.imgMusic),
    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: !_isEditing ? 'Mi Lista' : 'Editar',
        backgroundColor: ColorConstant.gray50,
        iconButtonVariant: !_isEditing
            ? IconButtonVariant.FillGray300
            : IconButtonVariant.NoFill,
        // hideActions: _isEditing,
        actions: [...actions],
      ),
      body: Column(
        children: [
          // Menu options
          Container(
            margin: getMargin(top: 24),
            child: // Items filter
                Padding(
              padding: getPadding(bottom: 16),
              child: FiltersBar(
                  items: categories, onChangeSelected: (int index) {}),
            ),
          ),

          // builds a list, but if it is empty it shows a notification message
          _buildMainContent(favoriteService.favorites)
        ],
      ),
    );
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
                hasImage: true,
                onTappedItem: (ListViewFavoriteModel item) {
                  print(item.title);
                },
              ),
            ))
        : NotificationEmptyList(
            title: 'Esto se ve un poco vacio...',
            message:
                'Recuerda que puedes guardar tu contenido favorito para tenerlo siempre a la mano.',
            label: 'Explorar contenido',
          );
  }
}
