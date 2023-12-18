import 'package:flutter/material.dart';
import 'package:mobile_app/core/models/list_view_favorite.dart';
import 'package:mobile_app/widgets/widgets.dart';

import '../core/app_export.dart';

class ListViewItemFavorite extends StatelessWidget {
  final bool isEditing;
  final bool? hasImage;
  final List<ListViewFavoriteModel> items;
  final Function? onTappedItem;

  const ListViewItemFavorite({
    super.key,
    this.hasImage,
    required this.isEditing,
    required this.items,
    this.onTappedItem,
  });

  @override
  Widget build(BuildContext context) {
    final boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: ColorConstant.whiteA700,
    );

    final borderRadius = BorderRadius.only(
        topLeft: Radius.circular(12), bottomLeft: Radius.circular(12));

    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (_, int index) {
        final item = items[index];

        return GestureDetector(
          onTap: onTappedItem != null ? () => onTappedItem!(item) : null,
          child: Container(
            width: double.infinity,
            height: getSize(88),
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
                        Text(
                          item.title,
                          style: AppStyle.txtNunitoSansSemiBold20Black900,
                        ),
                        CustomIconButton(
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
                  ),
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (_, __) => SizedBox(height: 8),
      itemCount: items.length,
    );
  }
}
