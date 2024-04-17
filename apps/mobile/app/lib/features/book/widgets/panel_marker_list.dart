import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/widgets.dart';

class PanelMarkerList extends StatelessWidget {
  final List<Map<dynamic, dynamic>> markerList;
  final Function? onTapped;
  const PanelMarkerList({super.key, required this.markerList, this.onTapped});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: getPadding(left: 40, right: 40, bottom: 20),
        child: Wrap(children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: getMargin(top: 16, bottom: 28),
              width: 32,
              height: 4,
              color: ColorConstant.indigo900,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImageView(
                      svgPath: ImageConstant.imgBookmarkGray800,
                      color: ColorConstant.yellow100,
                    ),
                    SizedBox(width: 2),
                    Text(
                      'Marcadores',
                      style: AppStyle.txtNunitoSansSemiBold20Indigo900,
                    ),
                    SizedBox(width: 5),
                    Text(
                      '(${markerList.length})',
                      style: AppStyle.txtNunitoSansSemiBold16Indigo900,
                    )
                  ],
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: markerList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: onTapped != null
                              ? () {
                                  onTapped!(
                                      markerList.elementAt(index)['offset']);
                                }
                              : null,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${index + 1}) ${markerList.elementAt(index)['name']}',
                              style: AppStyle.txtNunitoSansRegular14Black900,
                            ),
                          ));
                    }),
              ],
            ),
          )
        ]));
  }
}
