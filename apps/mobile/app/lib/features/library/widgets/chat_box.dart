import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../core/models/chat.dart';
import '../../../widgets/widgets.dart';

class ChatBox extends StatefulWidget {
  final Chat item;
  final bool? hasComments;
  final Color color;
  final double width;
  final double margin;

  const ChatBox(
      {super.key,
      required this.item,
      this.hasComments = true,
      required this.color,
      required this.width,
      required this.margin});

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  bool isCollapse = false;

  @override
  Widget build(BuildContext context) {
    final boxDecoration = BoxDecoration(
        border: Border.all(width: 1, color: widget.color),
        borderRadius: BorderRadius.circular(12),
        color: ColorConstant.whiteA700);
    return Container(
        margin: getMargin(all: widget.margin),
        padding: getPadding(all: 16),
        width: widget.width,
        decoration: boxDecoration,
        child: Column(
          children: [
            _ChatBoxHeader(
                title: widget.item.title,
                date: widget.item.date,
                image: widget.item.image),
            _ChatBoxBody(comment: widget.item.comment, isCollapse: isCollapse),
            if (widget.hasComments != null &&
                widget.hasComments! &&
                widget.item.commentList != null)
              _ChatBoxFooter(
                isCollapse: isCollapse,
                onShowComments: _showComments,
              ),
            SizedBox(height: 8),
            _buildCommentList()
          ],
        ));
  }

  void _showComments() {
    print('mostrar comentarios');
    isCollapse != isCollapse;
  }

  dynamic _buildCommentList() {
    if (widget.hasComments != null &&
        widget.hasComments! &&
        widget.item.commentList != null) {
      return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (_, int index) {
          return Align(
            alignment:
                index % 2 == 0 ? Alignment.centerLeft : Alignment.centerRight,
            child: ChatBox(
                width: 328,
                margin: 0,
                color: index % 2 == 0
                    ? ColorConstant.yellow100
                    : ColorConstant.indigo900,
                item: Chat(
                    id: 'dwd',
                    title: 'Moderador',
                    date: 'Hace 5 días',
                    comment:
                        'Lorem ipsum dolor sit amet consectetur. Tellus ac natoque sit commodo id ')),
          );
        },
        separatorBuilder: (_, __) => SizedBox(height: 16),
        itemCount: widget.item.commentList!.length,
      );
    }

    return Container();
  }
}

class _ChatBoxBody extends StatelessWidget {
  final bool isCollapse = false;
  final String comment;

  const _ChatBoxBody({super.key, isCollapse, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Text(comment);
  }
}

class _ChatBoxFooter extends StatelessWidget {
  final VoidCallback onShowComments;
  final bool isCollapse;

  const _ChatBoxFooter({
    super.key,
    required this.onShowComments,
    required this.isCollapse,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(top: 16, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            svgPath: !isCollapse
                ? ImageConstant.imgArrowdownIndigo900
                : ImageConstant.imgArrowupIndigo900,
            width: getSize(24),
            height: getSize(24),
            color: ColorConstant.indigo900,
            onTap: onShowComments,
          ),
          SizedBox(width: 8),
          Text(
            'Ver comentarios',
            style: AppStyle.txtNunitoSansSemiBold16Indigo900,
          )
        ],
      ),
    );
  }
}

class _ChatBoxHeader extends StatelessWidget {
  final String title;
  final String date;
  final String? image;

  const _ChatBoxHeader({
    super.key,
    required this.title,
    required this.date,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (image != null)
          CircleAvatar(
            radius: 24,
            backgroundColor: ColorConstant.indigo900,
            backgroundImage: AssetImage('assets/images/img_image11.png'),
          ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppStyle.txtNunitoSansSemiBold20Indigo900,
            ),
            Text(date, style: AppStyle.txtNunitoSansSemiBold13Gray200)
          ],
        ),
      ],
    );
  }
}
