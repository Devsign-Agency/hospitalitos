import 'package:flutter/material.dart';
import 'package:mobile_app/features/liturgia/screens/calendar/detail_screen.dart';
import 'package:mobile_app/widgets/widgets.dart';

import '../core/app_export.dart';

class ListCollapseItem extends StatefulWidget {
  final List<dynamic> items;
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
  var arrLiturgy = [];
  _itemsForDate() {
    final day = DateTime.now().toString().split(' ')[0];
    print(day);
    var index = 0;
    var findIndex = 0;
    widget.items.forEach((liturgia) {
      final date = liturgia['date'];
      if (date == day) {
        findIndex = index;
        arrLiturgy.add(liturgia['info']);
      }
      index++;
    });

    return findIndex;
  }

  void _changeSelected(context, Map item) {
    // selectedIndex = index;
    //item['isSelected'] = !item['isSelected'];
    //widget.onSelectedItem(item);
    //setState(() {});
    Navigator.of(context).pushNamed(DetailLiturgyScreen.route, arguments: item);
  }

  @override
  Widget build(BuildContext context) {
    final day = DateTime.now().toString().split(' ')[0];

    var indexItem = _itemsForDate();
    var data = widget.items[indexItem]['info'];
    var datasss = widget.items[indexItem]['isSelected'];
    var dataL = widget.items[0]['info'];
    print('search $data');
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (_, int index) {
        final Map<String, dynamic> item = data[index];
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
                  onTap: () => _changeSelected(context, item),
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
      itemCount: data.length,
    );
  }
}
