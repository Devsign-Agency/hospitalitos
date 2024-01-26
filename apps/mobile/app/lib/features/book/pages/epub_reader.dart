import 'package:epub_view/epub_view.dart' hide Image;
import 'package:flutter/material.dart';
import 'package:mobile_app/themes/dark_theme.dart';
import 'package:provider/provider.dart';

import '../../../core/app_export.dart';
import '../../../shared/shared.dart';
import '../../../widgets/widgets.dart';

class EpubBookReader extends StatefulWidget {
  static const String route = 'book/chapter';
  final EpubBook book;
  final EpubChapter chapter;

  const EpubBookReader({Key? key, required this.book, required this.chapter})
      : super(key: key);

  @override
  State<EpubBookReader> createState() => _EpubBookReaderState();
}

class _EpubBookReaderState extends State<EpubBookReader> {
  late EpubController _epubController;

  @override
  void initState() {
    super.initState();

    print('assets/epubs/${widget.book.Title}.epub');

    _epubController = EpubController(
      // Load document

      document: Future.delayed(
          Duration(
            milliseconds: 200,
          ), () {
        return widget.book;
      }),
      // Set start point
      epubCfi: 'epubcfi(/6/6[chapter-2]!/4/2/1612)',
    );
  }

  Color _getColorBg() {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);

    return themeProvider.currentTheme != DarkTheme.theme
        ? Colors.white
        : Color(0xff1C1B1F);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _getColorBg(),
      appBar: _CustomAppBar(title: widget.book.Title),
      // Show table of contents
      drawer: Drawer(
        child: EpubViewTableOfContents(
          controller: _epubController,
        ),
      ),
      // Show epub document
      body: SelectionArea(
        child: EpubView(
          controller: _epubController,
        ),
      ),
      bottomNavigationBar: _CustomBottomNavigationBar(),
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
          themeProvider.currentTheme == DarkTheme.theme
              ? themeProvider.setLightMode()
              : themeProvider.setDarkMode();
        }
      },
      {'id': 1, 'name': 'Ajustar texto', 'onTap': (context) {}},
      {'id': 2, 'name': 'Compartir', 'onTap': onShareBook},
    ];

    return AppBar(
      // backgroundColor: ColorConstant.gray50,
      title: Align(
          alignment: Alignment.centerLeft,
          child: Text('$title', style: AppStyle.txtNunitoSansSemiBold26)),
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
      // backgroundColor: ColorConstant.gray50,
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
      {'id': 3, 'name': '', 'image': ImageConstant.imgShareGray50},
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
          : IconButtonVariant.NoFill,
      child: CustomImageView(color: ColorConstant.indigo900, svgPath: image),
    );
  }
}
