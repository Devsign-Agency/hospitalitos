import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/app_export.dart';
import '../../../../../shared/shared.dart';

class VerseList extends StatelessWidget {
  final int secuenceVerseIndex;
  final bool isDarkMode;

  const VerseList(
      {super.key, required this.secuenceVerseIndex, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    Color borderColor =
        isDarkMode ? ColorConstant.purple50 : ColorConstant.indigo900;
    BibleService bibleService =
        Provider.of<BibleService>(context, listen: false);

    List<Widget> versesList = [];
    Map<String, dynamic> selectedVerses = bibleService.selectedVerses;
    int i = bibleService.startVerse;
    print('selected: $selectedVerses');

    selectedVerses.forEach((key, value) {
      versesList.add(Container(
          width: double.infinity,
          key: GlobalObjectKey(i),
          padding: getPadding(left: 16, right: 16),
          decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(
                      color: secuenceVerseIndex == i
                          ? borderColor
                          : ColorConstant.transparent,
                      width: secuenceVerseIndex == i ? 6.0 : 0.0))),
          child: Column(
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('$i ',
                    style: isDarkMode
                        ? AppStyle.txtNunitoSansRegular14WhiteA700
                        : AppStyle.txtNunitoSansRegular14Black900),
                Expanded(
                  child: Text(
                    '$value',
                    style: isDarkMode
                        ? AppStyle.txtNunitoSansRegular18WhiteA700
                        : AppStyle.txtNunitoSansRegular18Gray900,
                    // style: TextStyle(
                    //   color: textBook.color,
                    //   fontSize: textBook.fontSize.value,
                    //   height: textBook.lineHeight!.size,
                    //   // fontSize: convertFontSizeToPx(textBook.fontSize),
                    // ),
                  ),
                ),
              ]),
              SizedBox(
                height: 20,
              )
            ],
          )));

      i++;
    });

    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (_, int index) {
        return versesList[index];
      },
      itemCount: versesList.length,
    );
  }
}
