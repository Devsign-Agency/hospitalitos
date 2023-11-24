import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_app/widgets/custom_image_view.dart';

import '../core/app_export.dart';

class _LinkCard extends StatefulWidget {
  final String title;
  final String link;

  const _LinkCard({
    required this.title,
    required this.link,
  });

  @override
  State<_LinkCard> createState() => _LinkCardState();
}

class _LinkCardState extends State<_LinkCard> {
  FToast? fToast;

  @override
  void initState() {
    fToast = FToast();
    fToast?.init(context);
  }

  @override
  Widget build(BuildContext context) {
    final boxDecoration = BoxDecoration(
        border: Border.all(width: 1, color: ColorConstant.gray200),
        borderRadius: BorderRadius.circular(8));

    return Container(
      padding: getPadding(left: 16, right: 16, bottom: 8, top: 8),
      height: 56,
      decoration: boxDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: AppStyle.txtNunitoSansSemiBold20,
          ),
          CustomImageView(
            width: 24,
            height: 24,
            color: ColorConstant.gray200,
            svgPath: ImageConstant.imgArrowrightIndigo900,
            onTap: () => showCustomToast(),
          ),
        ],
      ),
    );
  }

  showCustomToast() {
    Widget toast = Container(
      width: double.infinity,
      height: 48,
      padding: getPadding(left: 16, right: 16, top: 14, bottom: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Color(0xff313033), // TODO: Añadir color a ColorConstants
      ),
      child: Text(
        'El link se ha copiado',
        style: AppStyle.txtRobotoRegular14Gray10002,
      ),
    );

    fToast?.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 3),
    );

    Navigator.of(context).pop();
    Navigator.of(context).pushNamed('list_own');
  }
}

class ModalBottomSheet extends StatelessWidget {
  const ModalBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> links = [
      {
        'name': 'WhatsApp',
        'link': '',
      },
      {
        'name': 'Facebook',
        'link': '',
      },
      {
        'name': 'Copiar link',
        'link': '',
      },
    ];

    return Padding(
      padding: getPadding(left: 16, right: 16, bottom: 20),
      child: Wrap(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: getMargin(top: 16, bottom: 28),
              width: 32,
              height: 4,
              color: ColorConstant.gray600,
            ),
          ),
          ...links.map((item) {
            return Padding(
              padding: getPadding(top: 8, bottom: 8),
              child: (_LinkCard(
                title: item['name']!,
                link: item['link']!,
              )),
            );
          }),
        ],
      ),
    );
  }
}
