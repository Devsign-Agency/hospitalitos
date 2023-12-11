import 'package:flutter/material.dart';
import 'package:mobile_app/shared/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:mobile_app/themes/themes.dart';

import '../../../../core/app_export.dart';
import '../../../../widgets/widgets.dart';

class ReaderBookScreen extends StatelessWidget {
  static const String route = 'reader-book';

  const ReaderBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _CustomAppBar(),
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            // AppBar
            // _CustomAppBar(),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
            ),
          ]),
        ),
        bottomNavigationBar: _CustomBottomNavigationBar(),
      ),
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

  const _CustomAppBar({
    super.key,
    this.backgroundColor = Colors.red,
    this.textIconColor = Colors.red,
    this.icon,
    this.title = '',
    this.menuItem,
    this.height: kToolbarHeight,
    this.hideBack = false,
  });
  @override
  Size get preferredSize => Size.fromHeight(height!);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        'id': 0,
        'name': 'Modo Noche',
        'onTap': (context) {
          ThemeProvider themeProvider =
              Provider.of<ThemeProvider>(context, listen: false);
          themeProvider.setDarkMode();
        }
      },
      {
        'id': 1,
        'name': 'Ajustar texto',
        'onTap': (context) {
          ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

          themeProvider.currentTheme == DarkTheme.theme
              ? themeProvider.setLightMode()
              : themeProvider.setDarkMode();
        }
      },
      {'id': 2, 'name': 'Compartir', 'onTap': onShareBook},
    ];

    return AppBar(
      backgroundColor: ColorConstant.gray50,
      title: Align(
          alignment: Alignment.centerLeft,
          child: Text('Nuevo ...', style: AppStyle.txtNunitoSansSemiBold26)),
      actions: [
        CustomImageView(
          color: ColorConstant.gray800,
          svgPath: ImageConstant.imgMusicIndigo900,
        ),
        SizedBox(width: 32),
        // Menu
        PopupMenuButton<int>(
          constraints: BoxConstraints(
            minWidth: 200,
          ),
          offset: Offset(20, 60),
          color: Colors.white,
          itemBuilder: (context) => [
            ...menuItems.map((item) => PopupMenuItem(
                  value: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(item['name'],
                        style: AppStyle.txtNunitoSansRegular18Black900),
                  ),
                  onTap: () => item['onTap'](context),
                ))
          ],
          onSelected: (int index) {},
        )
      ],
    );
  }

  void onShareBook(context) => showModalBottomSheet(
      backgroundColor: ColorConstant.gray50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      context: context,
      builder: (context) => ModalBottomSheet());
}

class _CustomBottomNavigationBar extends StatefulWidget {
  const _CustomBottomNavigationBar({
    super.key,
  });

  @override
  State<_CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState
    extends State<_CustomBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Map<dynamic, dynamic>> items = [
      {'id': 0, 'name': '', 'image': ImageConstant.imgEditGray800},
      {'id': 1, 'name': '', 'image': ImageConstant.imgBookmarkGray800},
      {'id': 2, 'name': '', 'image': ImageConstant.imgBookmark},
      {'id': 3, 'name': '', 'image': ImageConstant.imgTrash},
    ];
    return BottomNavigationBar(
        // type: BottomNavigationBarType.shifting,
        backgroundColor: ColorConstant.gray50,
        currentIndex: _currentIndex,
        onTap: _changeCurrentIndex,
        items: [
          ...items.map((item) => BottomNavigationBarItem(
                label: '',
                icon: _BottomNavigationBarItemIcon(
                    image: item['image'],
                    isSelected: item['id'] == _currentIndex),
              ))
        ]);
  }

  void _changeCurrentIndex(int index) {
    _currentIndex = index;
    setState(() {});
  }
}

class _BottomNavigationBarItemIcon extends StatelessWidget {
  final String image;
  final bool isSelected;

  const _BottomNavigationBarItemIcon({
    super.key,
    required this.image,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      height: 48,
      width: 48,
      variant: isSelected
          ? IconButtonVariant.FillIndigo90033
          : IconButtonVariant.FillGray50,
      child: CustomImageView(color: ColorConstant.indigo900, svgPath: image),
    );
  }
}
