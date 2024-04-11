import 'package:flutter/material.dart';

import '../core/app_export.dart';

class CustomTabBar extends StatelessWidget {
  final TabController tabController;
  final List<String> items;
  final Color? labelColor;
  final Color? indicatorColor;
  const CustomTabBar(
      {super.key,
      required this.tabController,
      required this.items,
      this.labelColor,
      this.indicatorColor});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: false,
      labelPadding: EdgeInsets.all(0),
      labelColor: labelColor,
      controller: tabController,
      indicatorColor: indicatorColor,
      dividerColor: ColorConstant.transparent,
      labelStyle: AppStyle.txtNunitoSansSemiBold16Indigo900,
      unselectedLabelStyle: AppStyle.txtNunitoSansSemiBold16Gray200,
      splashFactory: NoSplash.splashFactory,
      overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        // Use the default focused overlay color
        return states.contains(MaterialState.focused)
            ? null
            : Colors.transparent;
      }),
      tabs: [
        ...items.map((item) => Tab(
                child: Text(
              item,
            )))
      ],
    );
  }
}
