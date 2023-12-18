import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/widgets.dart';

import '../core/app_export.dart';

class ListCollapseItem extends StatefulWidget {
  final List<Map<String, dynamic>> items;
  final Function onSelectedItem;
  const ListCollapseItem({
    super.key,
    required this.items,
    required this.onSelectedItem,
  });

  @override
  State<ListCollapseItem> createState() => ListCollapseItemState();
}

class ListCollapseItemState extends State<ListCollapseItem> {
  int selectedIndex = 1000;

  void _changeSelected(Map item) {
    // selectedIndex = index;
    item['isSelected'] = !item['isSelected'];
    widget.onSelectedItem(item);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (_, int index) {
        final Map<String, dynamic> item = widget.items[index];
        return Container(
          // padding: getPadding(top: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  '${item['title']}',
                  style: AppStyle.txtNunitoSansSemiBold20Black900,
                ),
                CustomImageView(
                  color: ColorConstant.whiteA700,
                  svgPath: !item['isSelected']
                      ? ImageConstant.imgArrowright
                      : ImageConstant.imgArrowdownGray900,
                  onTap: () => _changeSelected(item),
                )
              ]),
              if (item['isSelected'])
                Text(
                  '${item['description']}',
                  style: AppStyle.txtNunitoSansRegular14Black900,
                )
            ],
          ),
        );
      },
      separatorBuilder: (_, __) => Container(
        width: double.infinity,
        height: 1,
        margin: getMargin(top: 16, bottom: 16),
        color: ColorConstant.gray400,
      ),
      itemCount: widget.items.length,
    );
  }
}
