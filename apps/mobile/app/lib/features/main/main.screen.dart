import 'package:flutter/material.dart';
import 'package:mobile_app/features/generator.page.dart';
import 'package:mobile_app/features/favorite.page.dart';
import 'package:mobile_app/features/main/pages/pages.dart';
import 'package:mobile_app/globals/states/app.state.dart';
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
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          currentIndex: selectedIndex,
          enableFeedback: true,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          showUnselectedLabels: true,
          unselectedItemColor: Theme.of(context).colorScheme.onBackground,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              label: 'Business'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
              label: 'School'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book_outlined),
              label: 'Settings'
            ),
          ],
        ),
        body: Center(
          child: page,
        ),
      ),
    );
  }
}
