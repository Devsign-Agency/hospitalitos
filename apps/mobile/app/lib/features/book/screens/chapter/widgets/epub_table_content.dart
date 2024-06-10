import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../../../core/app_export.dart';
import '../../../../../shared/shared.dart';
import '../../../../../themes/themes.dart';

class EpubTableContent extends StatelessWidget {
  const EpubTableContent({
    super.key,
    required this.textBook,
    required this.book,
    required this.data,
  });

  final TextBook textBook;
  final EpubBook? book;
  final String data;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkTheme = themeProvider.currentTheme == DarkTheme.theme;
    return Padding(
      padding: getPadding(left: textBook.margin, right: textBook.margin),
      child: Html(
        onLinkTap: (url, _, __, ___) async {
          var item = LiturgyService.findRefInBook(url, book!);

          Fluttertoast.showToast(msg: item);
        },
        style: {
          'body': Style(
              fontSize: textBook.fontSize,
              color: isDarkTheme
                  ? ColorConstant.whiteA700
                  : ColorConstant.black900,
              lineHeight: LineHeight(textBook.lineHeight),
              fontFamily: 'Nunito Sans'),
        },
        data: data,
      ),
    );
  }
}
