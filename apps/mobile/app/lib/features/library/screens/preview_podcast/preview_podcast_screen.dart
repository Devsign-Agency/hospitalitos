import 'package:flutter/material.dart';
import 'package:vocsy_epub_viewer/epub_viewer.dart';

class PreviewPodcastScreen extends StatefulWidget {
  static const String route = 'preview-podcast';
  const PreviewPodcastScreen({Key? key}) : super(key: key);

  @override
  State<PreviewPodcastScreen> createState() => _PreviewPodcastScreenState();
}

class _PreviewPodcastScreenState extends State<PreviewPodcastScreen> {
  String filePath = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                print("=====filePath======$filePath");
                if (filePath == '') {
                } else {
                  VocsyEpub.setConfig(
                    themeColor: Theme.of(context).primaryColor,
                    identifier: "iosBook",
                    scrollDirection: EpubScrollDirection.ALLDIRECTIONS,
                    allowSharing: true,
                    enableTts: true,
                    nightMode: true,
                  );

                  // get current locator
                  VocsyEpub.locatorStream.listen((locator) {
                    print('LOCATOR: $locator');
                  });

                  VocsyEpub.open(
                    filePath,
                    lastLocation: EpubLocator.fromJson({
                      "bookId": "2239",
                      "href": "/OEBPS/ch06.xhtml",
                      "created": 1539934158390,
                      "locations": {
                        "cfi": "epubcfi(/0!/4/4[simple_book]/2/2/6)"
                      }
                    }),
                  );
                }
              },
              child: Text('Open Online E-pub'),
            ),
            ElevatedButton(
              onPressed: () async {
                VocsyEpub.setConfig(
                  themeColor: Theme.of(context).primaryColor,
                  identifier: "iosBook",
                  scrollDirection: EpubScrollDirection.ALLDIRECTIONS,
                  allowSharing: true,
                  enableTts: true,
                  nightMode: true,
                );
                // get current locator
                VocsyEpub.locatorStream.listen((locator) {
                  print('LOCATOR: $locator');
                });
                // await VocsyEpub(
                //   wbook,
                // );
                await VocsyEpub.openAsset(
                  'assets/epubs/G.A.E.epub',
                  lastLocation: EpubLocator.fromJson({
                    "bookId": "2239",
                    "href": "/OEBPS/ch06.xhtml",
                    "created": 1539934158390,
                    "locations": {"cfi": "epubcfi(/0!/4/4[simple_book]/2/2/6)"}
                  }),
                );
              },
              child: Text('Open Assets E-pub'),
            ),
          ],
        ),
      ),
    );
  }
}
