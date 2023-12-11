import 'package:flutter/material.dart';

import '../../../../core/app_export.dart';
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

  Widget _buildList(List favorites) {
    return favorites.isNotEmpty
        ? Expanded(
            flex: 1, // TODO: Antes tenía flex: 2
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: _ListFavorite(isEditing: _isEditing, favorites: favorites),
            ))
        : _NotificationEmptyList();
  }

  @override
  Widget build(BuildContext context) {
    final List<dynamic> favorites = [1, 2, 3];
    final List<Map<String, dynamic>> menuOptions = [
      {
        'icon': ImageConstant.imgPlay,
        'title': 'Sin empezar',
        'action': _handleActions
      },
      {
        'icon': ImageConstant.imgPlay,
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
            MenuOptions(menuOptions: menuOptions),
            _buildList(favorites)
          ],
        ),
      ),
    );
  }
}

class _NotificationEmptyList extends StatelessWidget {
  const _NotificationEmptyList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final boxShadow = [
      BoxShadow(
        color: Color.fromRGBO(24, 39, 75, 0.08),
        offset: const Offset(0.0, 12.0),
        blurRadius: 32.0,
        spreadRadius: -4.0,
      ), //BoxSha
      BoxShadow(
        color: Color.fromRGBO(24, 39, 75, 0.08),
        offset: const Offset(0.0, 8.0),
        blurRadius: 18.0,
        spreadRadius: -6.0,
      ), //BoxShadow
    ];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      margin: EdgeInsets.only(top: 115),
      width: double.infinity,
      height: getSize(400),
      child: Column(
        children: [
          Text(
            'Esto se ve un poco vacío...',
            style: AppStyle.txtNunitoSansSemiBold26,
          ),
          SizedBox(height: 8),
          Expanded(
              child: SizedBox(
            width: getSize(340),
            child: Text(
              'Recuerda que puedes guardar tu contenido favorito para tenerlo siempre a la mano.',
              style: AppStyle.txtNunitoSansRegular18Gray800,
              textAlign: TextAlign.center,
            ),
          )),
          GestureDetector(
            // TODO: Sugerencia, usar un customIconButton
            onTap: () {},
            child: Container(
              width: double.infinity,
              height: getSize(48),
              decoration: BoxDecoration(
                  color: ColorConstant.yellow100,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: boxShadow),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Explorar contenido',
                  style: AppStyle.txtNunitoSansSemiBold16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _ListFavorite extends StatelessWidget {
  final bool isEditing;
  final List<dynamic> favorites;
  const _ListFavorite({
    super.key,
    required this.isEditing,
    required this.favorites,
  });

  @override
  Widget build(BuildContext context) {
    final boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: ColorConstant.whiteA700,
    );

    final borderRadius = BorderRadius.only(
        topLeft: Radius.circular(12), bottomLeft: Radius.circular(12));

    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (_, __) {
        return Container(
          width: double.infinity,
          height: getSize(88),
          decoration: boxDecoration,
          child: Row(
            children: [
              // Image
              ClipRRect(
                borderRadius: borderRadius,
                child: CustomImageView(
                  imagePath:
                      'assets/images/img_media.png', // TODO: Verificar cambiar por svgPath
                  width: getSize(132),
                  height: double.infinity,
                ),
              ),
              // Content
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Título',
                        style: AppStyle.txtNunitoSansSemiBold20Black900,
                      ),
                      CustomIconButton(
                        height: getSize(48),
                        width: getSize(48),
                        variant: !isEditing
                            ? IconButtonVariant.FillYellow
                            : IconButtonVariant.FillRed50033,
                        child: CustomImageView(
                          color: !isEditing
                              ? ColorConstant.gray800
                              : ColorConstant.red500,
                          svgPath: !isEditing
                              ? ImageConstant.imgPlayIndigo900
                              : ImageConstant.imgTrashRed500,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
      separatorBuilder: (_, __) => SizedBox(height: 8),
      itemCount: 20,
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
