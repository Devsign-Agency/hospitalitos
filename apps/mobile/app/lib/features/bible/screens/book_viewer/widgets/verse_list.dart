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
        Provider.of<BibleService>(context, listen: true);

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

class _Verse extends StatefulWidget {
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

  @override
  State<_Verse> createState() => _VerseState();
}

class _VerseState extends State<_Verse> {
  Color selectedVerseColor = ColorConstant.yellow100.withOpacity(0.1);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // ttsProvider = Provider.of<TextToSpeech>(context, listen: true);

      selectedVerseColor = ColorConstant.gray100;
      setState(() {});

      // await ttsProvider.streamController.close();
      // streamController = ttsProvider.streamController;

      // ttsProvider.ftts!.setCompletionHandler(() {
      //   print('COMPLETIOOOOOOOOOOOON');
      // });
    });
  }

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
        widget.isDarkMode ? ColorConstant.purple50 : ColorConstant.indigo900;

    TextStyle numberOfVerseStyle = widget.isDarkMode
        ? AppStyle.txtNunitoSansRegular14WhiteA700.copyWith(
            fontSize: convertFontSizePxToDouble(widget.textBook.fontSize) - 4.0,
          )
        : AppStyle.txtNunitoSansRegular14Black900.copyWith(
            fontSize:
                convertFontSizePxToDouble(widget.textBook.fontSize) - 4.0);

    TextStyle valueStyle = widget.isDarkMode
        ? AppStyle.txtNunitoSansRegular18WhiteA700.copyWith(
            height: widget.textBook.lineHeight,
            fontSize: convertFontSizePxToDouble(widget.textBook.fontSize))
        : AppStyle.txtNunitoSansRegular18Gray900.copyWith(
            height: widget.textBook.lineHeight,
            fontSize: convertFontSizePxToDouble(widget.textBook.fontSize));

    return AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeIn,
        width: double.infinity,
        key: GlobalObjectKey(widget.numberOfVerse),
        padding: getPadding(
            left: widget.textBook.margin, right: widget.textBook.margin),
        decoration: BoxDecoration(
            color: bibleService.startVerse == widget.numberOfVerse
                ? selectedVerseColor
                : null,
            border: Border(
                left: BorderSide(
                    color:
                        widget.active ? borderColor : ColorConstant.transparent,
                    width: widget.active ? 6.0 : 0.0))),
        child: Column(
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('${widget.numberOfVerse} ', style: numberOfVerseStyle),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Map<dynamic, String> verse = {
                      widget.numberOfVerse: widget.value,
                    };
                    widget.onSelected(verse);
                  },
                  child: Text(
                    widget.value,
                    style: valueStyle.copyWith(
                        decoration:
                            bibleService.isVerseSelected(widget.numberOfVerse)
                                ? TextDecoration.underline
                                : TextDecoration.none),
                  ),
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
