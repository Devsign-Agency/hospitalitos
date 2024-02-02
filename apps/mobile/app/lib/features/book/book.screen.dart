import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/core/app_export.dart';
import 'package:mobile_app/core/models/pdf_viewer.dart';
import 'package:mobile_app/features/book/pages/pages.dart';
import 'package:mobile_app/globals/states/app.state.dart';
import 'package:mobile_app/shared/shared.dart';
import 'package:mobile_app/widgets/app_bar/appbar_image.dart';
import 'package:mobile_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:mobile_app/widgets/app_bar/custom_app_bar.dart';
import 'package:mobile_app/widgets/book_bottom_bar.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class BookScreen extends StatefulWidget {
  static const String route = 'book';

  BookScreen({Key? key, int? selectedIndex, ScrollController? mainController})
      : super(key: key);

  @override
  State<BookScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<BookScreen> {
  int selectedIndex = 0;
  final ScrollController mainController = ScrollController();
  final TextToSpeech tts = TextToSpeech();
  bool playing = false;

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as EpubArguments;
    final book = arguments;
    // final chapter = arguments.chapter;

    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: Scaffold(
        body: ReadToolsPage(),
      ),
      //   child: EpubReader()
    );
  }
}
