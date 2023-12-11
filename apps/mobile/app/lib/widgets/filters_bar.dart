import 'package:flutter/material.dart';
import 'package:mobile_app/core/models/filter.dart';

import '../core/app_export.dart';
import '../features/security/widgets/widgets.dart';
import 'widgets.dart';

class FiltersBar extends StatefulWidget {
  final List<FilterData> items;
  final void Function(int index) onChangeSelected;
  const FiltersBar(
      {super.key, required this.items, required this.onChangeSelected});

  @override
  State<FiltersBar> createState() => _FiltersBarState();
}

class _FiltersBarState extends State<FiltersBar> {
  int itemSelected = -1;

  void _handleSelected(int index) {
    if (itemSelected >= 0 && itemSelected != index) {
      widget.items[itemSelected].isSelected = false;
    }

    widget.items[index].isSelected = !widget.items[index].isSelected;
    itemSelected = index;
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
                                  color: ColorConstant.black900,
                                  svgPath: widget.items[index].icon,
                                )
                              : null,
                          onSelected: (value) => _handleSelected(index),
                          selected: widget.items[index].isSelected),
                    ))
          ]),
        ));
  }
}
