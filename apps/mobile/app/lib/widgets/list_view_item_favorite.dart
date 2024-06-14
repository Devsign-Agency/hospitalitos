import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_app/core/models/list_view_favorite.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../core/app_export.dart';
import '../shared/shared.dart';
import '../themes/themes.dart';

class ListViewItemFavorite extends StatelessWidget {
  final bool isEditing;
  final bool? hasImage;
  final List<ListViewFavoriteModel> items;
  final Function? onTappedItem;
  final Function? onRemoveItem;
  final bool activeShare;
  final Function? onShare;

  const ListViewItemFavorite({
    super.key,
    this.hasImage,
    required this.isEditing,
    required this.items,
    this.onTappedItem,
    this.onRemoveItem,
    this.activeShare = false,
    this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkTheme = themeProvider.currentTheme == DarkTheme.theme;

    final boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: isDarkTheme ? ColorConstant.gray80040 : ColorConstant.whiteA700,
    );

    final borderRadius = BorderRadius.only(
        topLeft: Radius.circular(12), bottomLeft: Radius.circular(12));

    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (_, int index) {
        final item = items[index];

        return Container(
          width: double.infinity,
          height: getSize(110),
          // padding: getPadding(top: 10, bottom: 10),
          decoration: boxDecoration,
          child: Row(
            children: [
              // Image
              if (hasImage != null && hasImage!)
                ClipRRect(
                  borderRadius: borderRadius,
                  child: CustomImageView(
                    imagePath: item.image != null
                        ? 'assets/images/${item.image}'
                        : 'assets/images/img_media.png',
                    width: getSize(132),
                    height: double.infinity,
                  ),
                ),
              // Content
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: onTappedItem != null
                            ? () => onTappedItem!(item)
                            : null,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 140),
                              child: Text(
                                item.title,
                                style: AppStyle.txtNunitoSansSemiBold20Black900
                                    .copyWith(
                                        color: isDarkTheme
                                            ? ColorConstant.whiteA700
                                            : ColorConstant.black900),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 200),
                              child: Text(
                                item.description ?? '',
                                style:
                                    TextStyle(overflow: TextOverflow.ellipsis),
                                maxLines: 1,
                              ),
                            ),
                            Text(item.date ?? '')
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (activeShare)
                            CustomIconButton(
                              onTap: () => onShare!(item),
                              height: getSize(48),
                              width: getSize(48),
                              variant: IconButtonVariant.FillDeeppurple5002,
                              child: CustomImageView(
                                  color: ColorConstant.indigo900,
                                  svgPath: ImageConstant.imgShare),
                            ),
                          SizedBox(width: 10),
                          CustomIconButton(
                            onTap: isEditing && onTappedItem != null
                                ? () => onRemoveItem!(item)
                                : () => onTappedItem!(item),
                            height: getSize(48),
                            width: getSize(48),
                            variant: !isEditing
                                ? IconButtonVariant.FillYellow
                                : IconButtonVariant.FillRed50033,
                            child: CustomImageView(
                              color: !isEditing
                                  ? ColorConstant.gray800
                                  : ColorConstant.red500,
                              svgPath: !isEditing
                                  ? ImageConstant.imgPlayIndigo900
                                  : ImageConstant.imgTrashRed500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
      separatorBuilder: (_, __) => SizedBox(height: 20),
      itemCount: items.length,
    );
  }
}
