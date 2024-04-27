import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:provider/provider.dart';

import '../../../../../core/app_export.dart';
import '../../../../../shared/shared.dart';

class VerseList extends StatelessWidget {
  final int secuenceVerseIndex;
  final bool isDarkMode;
  final TextBook textBook;

  const VerseList({
    super.key,
    required this.secuenceVerseIndex,
    required this.isDarkMode,
    required this.textBook,
  });

  @override
  Widget build(BuildContext context) {
    BibleService bibleService =
        Provider.of<BibleService>(context, listen: false);

    List<String> verses = [];

    bibleService.versesByChapter.forEach((key, value) {
      verses.add(value);
    });

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        ...List.generate(verses.length, (int index) {
          return _Verse(
            selected: true,
            numberOfVerse: index + 1,
            isDarkMode: isDarkMode,
            textBook: textBook,
            value: verses[index],
            active: secuenceVerseIndex == index + 1,
            onSelected: (Map<dynamic, String> verse) =>
                bibleService.addNewVerseSelected(verse),
          );
        }),
      ],
    );
  }
}

class _Verse extends StatelessWidget {
  final bool isDarkMode;
  final TextBook textBook;
  final String value;
  final bool active;
  final int numberOfVerse;
  final bool selected;
  final Function(Map<dynamic, String>) onSelected;

  const _Verse(
      {super.key,
      required this.isDarkMode,
      required this.textBook,
      required this.value,
      required this.active,
      required this.numberOfVerse,
      required this.selected,
      required this.onSelected});

  double convertFontSizePxToDouble(FontSize fontSize) {
    Map<FontSize, double> values = {
      FontSize.xSmall: 12.0,
      FontSize.xxSmall: 14.0,
      FontSize.smaller: 16.0,
      FontSize.small: 18.0,
      FontSize.medium: 24.0,
      FontSize.large: 32.0,
      FontSize.larger: 36.0,
      FontSize.xLarge: 40.0,
      FontSize.xxLarge: 48.0
    };

    return values[fontSize]!;
  }

  @override
  Widget build(BuildContext context) {
    BibleService bibleService =
        Provider.of<BibleService>(context, listen: true);
    Color borderColor =
        isDarkMode ? ColorConstant.purple50 : ColorConstant.indigo900;

    TextStyle numberOfVerseStyle = isDarkMode
        ? AppStyle.txtNunitoSansRegular14WhiteA700.copyWith(
            fontSize: convertFontSizePxToDouble(textBook.fontSize) - 4.0,
          )
        : AppStyle.txtNunitoSansRegular14Black900.copyWith(
            fontSize: convertFontSizePxToDouble(textBook.fontSize) - 4.0);

    TextStyle valueStyle = isDarkMode
        ? AppStyle.txtNunitoSansRegular18WhiteA700.copyWith(
            height: textBook.lineHeight,
            fontSize: convertFontSizePxToDouble(textBook.fontSize))
        : AppStyle.txtNunitoSansRegular18Gray900.copyWith(
            height: textBook.lineHeight,
            fontSize: convertFontSizePxToDouble(textBook.fontSize));

    return GestureDetector(
      onTap: () {
        Map<dynamic, String> verse = {
          numberOfVerse: value,
        };
        onSelected(verse);
      },
      child: Container(
          width: double.infinity,
          key: GlobalObjectKey(numberOfVerse),
          padding: getPadding(left: textBook.margin, right: textBook.margin),
          decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(
                      color: active ? borderColor : ColorConstant.transparent,
                      width: active ? 6.0 : 0.0))),
          child: Column(
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('$numberOfVerse ', style: numberOfVerseStyle),
                Expanded(
                  child: Text(
                    value,
                    style: valueStyle.copyWith(
                        decoration: bibleService.isVerseSelected(numberOfVerse)
                            ? TextDecoration.underline
                            : TextDecoration.none),
                  ),
                ),
              ]),
              SizedBox(
                height: 20,
              )
            ],
          )),
    );
  }
}
