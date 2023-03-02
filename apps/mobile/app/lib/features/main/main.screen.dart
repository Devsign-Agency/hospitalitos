import 'package:flutter/material.dart';
import 'package:mobile_app/features/generator.page.dart';
import 'package:mobile_app/features/favorite.page.dart';
import 'package:mobile_app/features/main/pages/pages.dart';
import 'package:mobile_app/globals/states/app.state.dart';
import 'package:mobile_app/widgets/custom_bottom_bar.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  static const String route = '';

  MainScreen({Key? key, int? selectedIndex, ScrollController? mainController})
      : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  final ScrollController mainController = ScrollController();

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = HomePage();
        break;
      case 1:
        page = GeneratorPage();
        break;
      case 2:
        page = FavoritePage();
        break;
      case 3:
        page = Placeholder();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: Scaffold(
        bottomNavigationBar: CustomBottomBar(onChanged: _onItemTapped),
        body: SingleChildScrollView(
          child: Center(
            child: page,
          ),
        ),
      ),
    );
  }
}
