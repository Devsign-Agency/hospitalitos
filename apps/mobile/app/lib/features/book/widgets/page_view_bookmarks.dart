import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/widgets.dart';

class PageViewBookmarks extends StatelessWidget {
  final List<dynamic> markerList;
  final Function? onTapped;
  final void Function(dynamic)? onDeleteMarker;

  const PageViewBookmarks(
      {super.key,
      required this.markerList,
      this.onTapped,
      this.onDeleteMarker});

  @override
  Widget build(BuildContext context) {
    final boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: ColorConstant.whiteA700,
    );

    return Padding(
      padding: getPadding(left: 16, right: 16),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                'Marcadores',
                style: AppStyle.txtNunitoSansSemiBold28,
              ),
              SizedBox(width: 10),
              Text('(${markerList.length})')
            ],
          ),
          SizedBox(height: 30),
          if (markerList.isNotEmpty)
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (_, int index) {
                  // final item = items[index];

                  return Container(
                    width: double.infinity,
                    height: getSize(120),
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
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomImageView(
                                          svgPath:
                                              ImageConstant.imgBookmarkGray800,
                                          color: ColorConstant.yellow100,
                                        ),
                                        SizedBox(width: 2),
                                        Container(
                                          constraints:
                                              BoxConstraints(maxWidth: 250),
                                          child: GestureDetector(
                                            onTap: () {
                                              onTapped!(markerList
                                                  .elementAt(index)['offset']);
                                            },
                                            child: Text(
                                              markerList
                                                  .elementAt(index)['text'],
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: AppStyle
                                                  .txtNunitoSansSemiBold20Black900,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Text(markerList.elementAt(index)['date'] ??
                                        '')
                                  ],
                                ),
                                CustomIconButton(
                                  height: getSize(48),
                                  width: getSize(48),
                                  variant: IconButtonVariant.FillRed50033,
                                  onTap: () => onDeleteMarker!(
                                      markerList.elementAt(index)),
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
                },
                separatorBuilder: (_, __) => SizedBox(height: 8),
                itemCount: markerList.length,
              ),
            ),
          if (markerList.isEmpty)
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'No hay marcadores guardados...',
                    style: AppStyle.txtNunitoSansSemiBold26,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
