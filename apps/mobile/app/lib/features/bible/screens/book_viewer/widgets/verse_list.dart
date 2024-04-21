import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:provider/provider.dart';

import '../../../../../core/app_export.dart';
import '../../../../../shared/shared.dart';

class VerseList extends StatelessWidget {
  final int secuenceVerseIndex;
  final bool isDarkMode;
  final TextBook textBook;

  const VerseList(
      {super.key,
      required this.secuenceVerseIndex,
      required this.isDarkMode,
      required this.textBook});

  @override
  Widget build(BuildContext context) {
    BibleService bibleService =
        Provider.of<BibleService>(context, listen: false);

    List<String> verses = [];

    bibleService.selectedVerses.forEach((key, value) {
      verses.add(value);
    });

    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (_, int index) {
        return _Verse(
          index: bibleService.startVerse + index,
          isDarkMode: isDarkMode,
          textBook: textBook,
          value: verses[index],
          active: secuenceVerseIndex == bibleService.startVerse + index,
        );
      },
      itemCount: verses.length,
    );
  }
}

class _Verse extends StatelessWidget {
  final bool isDarkMode;
  final TextBook textBook;
  final String value;
  final bool active;
  final int index;

  const _Verse(
      {super.key,
      required this.isDarkMode,
      required this.textBook,
      required this.value,
      required this.active,
      required this.index});

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
    Color borderColor =
        isDarkMode ? ColorConstant.purple50 : ColorConstant.indigo900;

    TextStyle indexStyle = isDarkMode
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

    return Container(
        width: double.infinity,
        key: GlobalObjectKey(index),
        padding: getPadding(left: textBook.margin, right: textBook.margin),
        decoration: BoxDecoration(
            border: Border(
                left: BorderSide(
                    color: active ? borderColor : ColorConstant.transparent,
                    width: active ? 6.0 : 0.0))),
        child: Column(
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('$index ', style: indexStyle),
              Expanded(
                child: Text(
                  value,
                  style: valueStyle,
                ),
              ),
            ]),
            SizedBox(
              height: 20,
            )
          ],
        ));
  }
}
