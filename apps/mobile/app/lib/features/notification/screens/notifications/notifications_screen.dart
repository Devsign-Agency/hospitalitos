import 'package:flutter/material.dart';

import '../../../../core/app_export.dart';
import '../../../../widgets/widgets.dart';

class NotificationsScreen extends StatelessWidget {
  static const String route = 'notifications';
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Notificaciones',
        backgroundColor: ColorConstant.gray50,
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          // Notification list
          _NotificationList()
          // Menu
        ]),
      ),
    );
  }
}

class _NotificationList extends StatelessWidget {
  const _NotificationList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> notifications =
        List<Map<String, dynamic>>.generate(
            5,
            (index) => {
                  'id': index,
                  'title': 'Título de notificación',
                  'description':
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  'date': 'Hace 12 meses',
                  'isSelected': false,
                });

    return Column(
      children: [
        ListView.separated(
            shrinkWrap: true,
            itemBuilder: (_, int index) {
              return _NotificationListItemWidget(
                  notification: notifications[index]);
            },
            separatorBuilder: (_, __) => SizedBox(height: 8),
            itemCount: notifications.length)
      ],
    );
  }
}

class _NotificationListItemWidget extends StatefulWidget {
  final Map<String, dynamic> notification;

  const _NotificationListItemWidget({
    super.key,
    required this.notification,
  });

  @override
  State<_NotificationListItemWidget> createState() =>
      _NotificationListItemWidgetState();
}

class _NotificationListItemWidgetState
    extends State<_NotificationListItemWidget> {
  void _onSelectedItem(Map<String, dynamic> item) {
    item['isSelected'] = !item['isSelected'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final boxDecoration = BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: widget.notification['isSelected']
            ? ColorConstant.purple50
            : ColorConstant.whiteA700,
        border: Border.all(width: 1.0));
    return Container(
      margin: getMargin(left: 16, right: 16),
      padding: getPadding(all: 16),
      width: double.infinity,
      decoration: boxDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.notification['date'],
              style: AppStyle.txtNunitoSansSemiBold13Primary200),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.notification['title'],
                style: AppStyle.txtNunitoSansSemiBold20Indigo900,
              ),
              CustomImageView(
                color: ColorConstant.whiteA700,
                svgPath: widget.notification['isSelected']
                    ? ImageConstant.imgArrowup
                    : ImageConstant.imgArrowdownGray900,
                onTap: () => _onSelectedItem(widget.notification),
              )
            ],
          ),
          SizedBox(height: 8),
          if (widget.notification['isSelected'])
            Text(
              widget.notification['description'],
              style: AppStyle.txtNunitoSansSemiBold14Gray900,
            )
        ],
      ),
    );
  }
}
