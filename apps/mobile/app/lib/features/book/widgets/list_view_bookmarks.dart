import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/app_export.dart';
import '../../../shared/shared.dart';
import '../../../themes/themes.dart';
import '../../../widgets/widgets.dart';

class ListViewBookmark extends StatelessWidget {
  final List<Bookmark> bookmarks;
  final Function onDelete;
  final Function onTap;

  const ListViewBookmark(
      {super.key,
      required this.bookmarks,
      required this.onDelete,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (_, int index) {
          Bookmark bookmark = bookmarks[index];

          return _ListViewItem(
            bookmark: bookmark,
            onTapped: onTap,
            onDelete: (Bookmark bookmark) => onDelete(bookmark),
          );
        },
        separatorBuilder: (_, __) => SizedBox(height: 10),
        itemCount: bookmarks.length,
      ),
    );
  }
}

class _ListViewItem extends StatelessWidget {
  const _ListViewItem({
    super.key,
    required this.bookmark,
    required this.onTapped,
    this.onDelete,
  });

  final Bookmark bookmark;
  final Function? onTapped;
  final Function? onDelete;

  String formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkTheme = themeProvider.currentTheme == DarkTheme.theme;

    final boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: isDarkTheme ? ColorConstant.gray80040 : ColorConstant.whiteA700,
    );

    return Container(
      width: double.infinity,
      height: getSize(130),
      decoration: boxDecoration,
      child: Row(
        children: [
          // Content
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 290),
                        child: Text(
                          bookmark.chapterName,
                          style: AppStyle.txtNunitoSansSemiBold20,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              onTapped!(bookmark);
                            },
                            child: ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 280),
                              child: Text(
                                bookmark.text,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: AppStyle.txtNunitoSansSemiBold16
                                    .copyWith(
                                        color: isDarkTheme
                                            ? ColorConstant.whiteA700
                                            : ColorConstant.black900),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        formatDate(bookmark.date),
                        style: TextStyle(
                            color: isDarkTheme
                                ? ColorConstant.whiteA700
                                : ColorConstant.black900),
                      )
                    ],
                  ),
                  CustomIconButton(
                    height: getSize(48),
                    width: getSize(48),
                    variant: IconButtonVariant.FillRed50033,
                    onTap: () => onDelete!(bookmark),
                    child: CustomImageView(
                      color: ColorConstant.red500,
                      svgPath: ImageConstant.imgTrashRed500,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
