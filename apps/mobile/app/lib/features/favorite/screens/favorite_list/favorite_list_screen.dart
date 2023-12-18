import 'package:flutter/material.dart';

import '../../../../core/app_export.dart';
import '../../../../core/models/list_view_favorite.dart';
import '../../../../widgets/widgets.dart';

class FavoriteListScreen extends StatefulWidget {
  static String route = 'favorite-list';

  const FavoriteListScreen({super.key});

  @override
  State<FavoriteListScreen> createState() => _FavoriteListScreenState();
}

class _FavoriteListScreenState extends State<FavoriteListScreen> {
  bool _isEditing = false;

  void _changeModeView() {
    _isEditing = !_isEditing;
    setState(() {});
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

  @override
  Widget build(BuildContext context) {
    final List<ListViewFavoriteModel> favorites = [
      ListViewFavoriteModel(id: '', title: 'Título'),
      ListViewFavoriteModel(id: '', title: 'Título'),
      ListViewFavoriteModel(id: '', title: 'Título'),
      ListViewFavoriteModel(id: '', title: 'Título'),
    ];
    final List<Map<String, dynamic>> menuOptions = [
      {
        'icon': ImageConstant.imgPlay,
        'title': 'Sin empezar',
        'action': _handleActions
      },
      {
        'icon': ImageConstant.imgDownloadGray30024x24,
        'title': 'Descargando',
        'action': _handleActions
      },
      {
        'icon': ImageConstant.imgPlay,
        'title': 'Sin empezar',
        'action': _handleActions
      },
      {
        'icon': ImageConstant.imgPlay,
        'title': 'Sin empezar',
        'action': _handleActions
      },
      {
        'icon': ImageConstant.imgPlay,
        'title': 'Sin empezar',
        'action': _handleActions
      },
    ];
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _CustomAppBar(editAction: _changeModeView, isEditing: _isEditing),

            // Menu options
            MenuOptions(menuOptions: menuOptions),

            // builds a list, but if it is empty it shows a notification message
            _buildMainContent(favorites)
          ],
        ),
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final editAction;
  final bool isEditing;

  const _CustomAppBar({
    super.key,
    required this.editAction,
    required this.isEditing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
          left: 14.0, right: 14.0, top: 8.0, bottom: 24.0),
      child: Row(
        children: [
          CustomIconButton(
            height: getSize(48),
            width: getSize(48),
            variant: IconButtonVariant.NoFill,
            child: CustomImageView(
              color: ColorConstant.whiteA700,
              svgPath: !isEditing
                  ? ImageConstant.imgArrowleftGray800
                  : ImageConstant.imgCloseGray24x24,
            ),
            onTap: () {
              isEditing ? editAction() : Navigator.of(context).pop();
            },
          ),
          Expanded(
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(!isEditing ? 'Mi Lista' : 'Editar',
                    style: AppStyle.txtNunitoSansSemiBold26)),
          ),
          if (!isEditing)
            CustomIconButton(
              height: 48,
              width: 48,
              variant: IconButtonVariant.FillGray300,
              child: CustomImageView(
                color: ColorConstant.gray800,
                svgPath: ImageConstant.imgSearch,
              ),
            ),
          SizedBox(width: 8),
          if (!isEditing)
            CustomIconButton(
              height: getSize(48),
              width: getSize(48),
              variant: IconButtonVariant.FillGray300,
              child: CustomImageView(
                color: ColorConstant.gray800,
                svgPath: ImageConstant.imgEdit,
              ),
              onTap: () => editAction(),
            ),
        ],
      ),
    );
  }
}
