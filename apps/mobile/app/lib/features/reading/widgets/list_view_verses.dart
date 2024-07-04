import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../core/models/BookBible.dart';

class ListViewVerses extends StatelessWidget {
  final List<Verse> verses;
  final TextBook textBook;

  const ListViewVerses({
    super.key,
    required this.verses,
    required this.textBook,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle numberOfVerseStyle = AppStyle.txtNunitoSansRegular14Black900
        .copyWith(
            fontSize:
                ConvertUtils.getDoubleFromFontSize(textBook.fontSize) - 4.0);

    TextStyle valueStyle = AppStyle.txtNunitoSansRegular18Gray900.copyWith(
        height: textBook.lineHeight,
        fontSize: ConvertUtils.getDoubleFromFontSize(textBook.fontSize));

    return SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...List.generate(
                  verses.length,
                  (index) => SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${verses[index].id} ',
                                  style: numberOfVerseStyle,
                                ),
                                Expanded(
                                    child: Text(
                                  verses[index].verse,
                                  style: valueStyle,
                                )),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      )),
            ],
          ),
        ));
  }
}
