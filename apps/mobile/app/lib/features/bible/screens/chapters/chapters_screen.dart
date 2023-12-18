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

  @override
  Widget build(BuildContext context) {
    final List<ListViewFavoriteModel> chapterList = [
      ListViewFavoriteModel(id: '', title: 'Génesis 1:16'),
      ListViewFavoriteModel(id: '', title: 'Génesis 1:16'),
      ListViewFavoriteModel(id: '', title: 'Génesis 1:16'),
      ListViewFavoriteModel(id: '', title: 'Génesis 1:16'),
    ];

    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          // Show AppBar
          _CustomAppBar(editAction: _changeModeView, isEditing: _isEditing),

          // builds a list, but if it is empty it shows a notification message
          _buildMainContent(chapterList)
        ]),
      ),
    );
  }

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
                child: Text(!isEditing ? 'Guardado' : 'Editar',
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
