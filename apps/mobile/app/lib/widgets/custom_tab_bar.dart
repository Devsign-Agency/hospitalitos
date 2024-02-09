import 'package:flutter/material.dart';

import '../core/app_export.dart';

class CustomTabBar extends StatelessWidget {
  final TabController tabController;
  final List<String> items;

  const CustomTabBar(
      {super.key, required this.tabController, required this.items});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelPadding: EdgeInsets.all(0),
      labelColor: Colors.black12,
      controller: tabController,
      indicatorColor: ColorConstant.indigo900,
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
              // style: AppStyle.txtNunitoSa,
            )))
      ],
    );
  }
}
