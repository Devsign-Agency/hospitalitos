import 'package:flutter/material.dart';
import 'package:mobile_app/features/bible/screens/book_viewer/book_viewer_screen.dart';
import 'package:mobile_app/shared/services/bible_service.dart';
import 'package:provider/provider.dart';

import '../../../../../core/app_export.dart';
import '../../../../../widgets/custom_button.dart';

class TabBarViewVerses extends StatefulWidget {
  final Function onChangeTab;
  const TabBarViewVerses({
    super.key,
    required this.amountOfChapters,
    required this.onChangeTab,
  });

  final int amountOfChapters;

  @override
  State<TabBarViewVerses> createState() => _TabBarViewVersesState();
}

class _TabBarViewVersesState extends State<TabBarViewVerses> {
  int startVerse = -1;
  int endVerse = -1;

  @override
  Widget build(BuildContext context) {
    BibleService bibleService =
        Provider.of<BibleService>(context, listen: true);

    bool getColor(int index) {
      int startVerse = bibleService.startVerse;
      int endVerse = bibleService.endVerse;

      if (startVerse == endVerse) {
        return index == startVerse;
      } else {
        if (startVerse > 0 && endVerse > 0) {
          return index >= startVerse && index <= endVerse;
        } else {
          return index == startVerse;
        }
      }
    }

    void next() {
      Navigator.of(context).pushNamed(BookViewerScreen.route,
          arguments: bibleService.selectedChapter.verses);
    }

    return Stack(
      children: [
        SingleChildScrollView(
          child: GridView.count(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 5,
            children: List.generate(bibleService.selectedChapter.verses.length,
                (index) {
              return Center(
                child: GestureDetector(
                  onTap: () {
                    int startVerse = bibleService.startVerse;
                    int endVerse = bibleService.endVerse;

                    if (startVerse > 0 && endVerse > 0) {
                      startVerse = index + 1;
                      endVerse = -1;
                    } else {
                      if (startVerse > 0) {
                        endVerse = index + 1;
                        if (startVerse > endVerse) {
                          final aux = startVerse;
                          startVerse = endVerse;
                          endVerse = aux;
                        }
                      } else {
                        startVerse = index + 1;
                      }
                    }

                    bibleService.startVerse = startVerse;
                    bibleService.endVerse = endVerse;

                    setState(() {});
                  },
                  child: Container(
                    padding: getPadding(all: 10.0),
                    decoration: BoxDecoration(
                      color: getColor(index + 1)
                          ? ColorConstant.yellow100.withOpacity(0.2)
                          : null,
                    ),
                    child: Text(
                      '${index + 1}',
                      style: AppStyle.txtNunitoSansRegular18Gray900,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height - 350,
          left: 0,
          right: 0,
          child: CustomButton(
              height: getVerticalSize(48),
              text: 'Aceptar',
              onTap: bibleService.startVerse > 0 ? next : null),
        )
      ],
    );
  }
}
