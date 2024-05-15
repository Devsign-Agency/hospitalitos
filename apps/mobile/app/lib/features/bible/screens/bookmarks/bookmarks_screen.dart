import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_export.dart';
import '../../../../shared/shared.dart';
import '../../../../widgets/widgets.dart';
import '../../../library/screens/courses/discover_screen.dart';
import '../../../liturgia/screens/screens.dart';
import '../../../main/pages/pages.dart';
import '../screens.dart';
import 'widgets/widgets.dart';

class BookmarksScreen extends StatefulWidget {
  static const String route = 'chapters';
  const BookmarksScreen({Key? key}) : super(key: key);

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  bool _isEditing = false;
  late List<Map<String, dynamic>> actions = actions = [
    {
      'icon': ImageConstant.imgEdit,
      'action': () => {_changeModeView()}
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  void _changeModeView() {
    _isEditing = !_isEditing;

    actions[0]['icon'] =
        !_isEditing ? ImageConstant.imgEdit : ImageConstant.imgCloseGray24x24;
    setState(() {});
  }

  void handleChangeBottomNavigationBar(int index, BuildContext context) {
    Widget widget;
    switch (index) {
      case 0:
        widget = HomePage();
        break;
      case 1:
        widget = DiscoverScreen();
        break;
      case 2:
        widget = LiturgiaCalendarScreen();
        break;
      case 3:
        widget = BibleMain();
        break;
      default:
        widget = HomePage();
        break;
    }

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => widget),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: !_isEditing ? 'Guardado' : 'Editar',
        iconButtonVariant: !_isEditing
            ? IconButtonVariant.FillGray300
            : IconButtonVariant.NoFill,
        actions: actions,
      ),
      body: Consumer<BibleBookMarkService>(
          builder: (_, bibleBookMarkService, __) => Column(
                children: [
                  // builds a list, but if it is empty it shows a notification message
                  Consumer<BibleBookMarkService>(
                      builder: (_, bibleBookMarkService, __) =>
                          ListViewBookmarks(
                              bookmarks: bibleBookMarkService.bookmarks,
                              isEditing: _isEditing))
                ],
              )),
      bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: 3,
          onChangeIndex: (int index) =>
              handleChangeBottomNavigationBar(index, context),
          bottomMenuList: WidgetConstant.defaultBottomMenuList),
    );
  }
}
