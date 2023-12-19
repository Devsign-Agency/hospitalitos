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

    return Scaffold(
      appBar: _CustomAppBar(
        title: _isEditing ? 'Guardado' : 'Editar',
        backgroundColor: ColorConstant.gray50,
        leading: CustomIconButton(
          height: getSize(48),
          width: getSize(48),
          variant: IconButtonVariant.NoFill,
          child: CustomImageView(
            color: ColorConstant.whiteA700,
            svgPath: !_isEditing
                ? ImageConstant.imgArrowleftGray800
                : ImageConstant.imgCloseGray24x24,
          ),
          onTap: () {
            _isEditing ? _changeModeView() : Navigator.of(context).pop();
          },
        ),
        actions: [
          if (!_isEditing)
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
          if (!_isEditing)
            CustomIconButton(
              height: getSize(48),
              width: getSize(48),
              variant: IconButtonVariant.FillGray300,
              child: CustomImageView(
                color: ColorConstant.gray800,
                svgPath: ImageConstant.imgEdit,
              ),
              onTap: () => _changeModeView(),
            ),
        ],
      ),
      body: Column(children: [
        // builds a list, but if it is empty it shows a notification message
        _buildMainContent(chapterList)
      ]),
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

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final Color? textIconColor;
  final String? icon;
  final String? title;
  final double? height;
  final List<Widget>? menuItem;
  final bool hideBack;
  final List<Widget>? actions;
  final Widget? leading;

  const _CustomAppBar({
    super.key,
    this.backgroundColor = Colors.red,
    this.textIconColor = Colors.red,
    this.icon,
    this.title = '',
    this.menuItem,
    this.height: kToolbarHeight,
    this.hideBack = false,
    this.actions,
    this.leading,
  });
  @override
  Size get preferredSize => Size.fromHeight(height!);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: leading,
      backgroundColor: backgroundColor,
      title: Align(
          alignment: Alignment.centerLeft,
          child: Text('$title', style: AppStyle.txtNunitoSansSemiBold26)),
      actions: [if (actions != null) ...actions!, SizedBox(width: 16)],
    );
  }
}
