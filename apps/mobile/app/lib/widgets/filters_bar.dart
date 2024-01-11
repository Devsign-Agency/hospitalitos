import 'package:flutter/material.dart';
import 'package:mobile_app/core/models/chip_item.dart';

import '../core/app_export.dart';
import '../features/security/widgets/widgets.dart';
import 'widgets.dart';

class FiltersBar extends StatefulWidget {
  final List<ChipItem> items;
  final int? selectedItem = 0;
  final void Function(int) onChangeSelected;
  const FiltersBar(
      {super.key, required this.items, required this.onChangeSelected});

  @override
  State<FiltersBar> createState() => _FiltersBarState();
}

class _FiltersBarState extends State<FiltersBar> {
  int selectedItem = 0;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.selectedItem ?? 0;
  }

  void _handleSelected(int index) {
    // if (selectedItem >= 0 && selectedItem != index) {
    //   widget.items[selectedItem].isSelected = false;
    // }

    // widget.items[index].isSelected = !widget.items[index].isSelected;
    selectedItem = index;
    widget.onChangeSelected(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: getPadding(left: 10, right: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            ...List<Widget>.generate(
                widget.items.length,
                (index) => Padding(
                    padding: getPadding(right: 8),
                    child: ChipviewinputchipItemWidget(
                      text: widget.items[index].name,
                      avatar: widget.items[index].icon != null
                          ? CustomImageView(
                              color: index == selectedItem
                                  ? ColorConstant.indigo900
                                  : ColorConstant.gray30002,
                              svgPath: widget.items[index].icon,
                            )
                          : null,
                      onSelected: (value) => _handleSelected(index),
                      selected: index == selectedItem,
                    )))
          ]),
        ));
  }
}
