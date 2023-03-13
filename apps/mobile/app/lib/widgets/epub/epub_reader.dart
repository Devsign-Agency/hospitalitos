import 'package:flutter/material.dart';
import 'package:epub_view/epub_view.dart';

class EpubReader extends StatefulWidget {
  const EpubReader({Key? key}) : super(key: key);

  @override
  State<EpubReader> createState() => _EpubReaderState();
}

class _EpubReaderState extends State<EpubReader> {
  late EpubController _epubController;

  @override
  initState() {
    super.initState();
    print('acá');
    _epubController = EpubController(
      // Load document
      document: EpubDocument.openAsset(
          'assets/epubs/Manual_PCC_-_Hector_Pernia.epub'),
      // Set start point
      //   epubCfi: 'epubcfi(/6/6[chapter-1]!/4/2/1612)',
    );
  }

  @override
  void dispose() {
    _epubController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: EpubViewActualChapter(
            controller: _epubController,
            builder: (chapterValue) => Text(
              chapterValue?.chapter?.Title?.replaceAll('\n', '').trim() ?? '',
              textAlign: TextAlign.start,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.save_alt),
              color: Colors.white,
              onPressed: () => _showCurrentEpubCfi(context),
            ),
          ],
        ),
        drawer: Drawer(
          child: EpubViewTableOfContents(controller: _epubController),
        ),
        body: EpubView(
          builders: EpubViewBuilders<DefaultBuilderOptions>(
            options: const DefaultBuilderOptions(),
            chapterDividerBuilder: (_) => const Divider(),
          ),
          controller: _epubController,
        ),
      );

  void _showCurrentEpubCfi(context) {
    final cfi = _epubController.generateEpubCfi();

    if (cfi != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(cfi),
          action: SnackBarAction(
            label: 'GO',
            onPressed: () {
              _epubController.gotoEpubCfi(cfi);
            },
          ),
        ),
      );
    }
  }
}
