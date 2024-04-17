import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_app/widgets/custom_image_view.dart';

import '../core/app_export.dart';
import 'package:share_plus/share_plus.dart';

class _LinkCard extends StatefulWidget {
  final String title;
  final String link;
  final funct;
  final String icon;
  const _LinkCard({
    required this.title,
    required this.link,
    required this.funct,
    required this.icon,
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           IconButton(onPressed: (){ print('hey');}, icon: Icon(Icons.book)),
          Text(
            widget.title,
            style: AppStyle.txtNunitoSansSemiBold20,
          ),
         /* CustomImageView(
            width: 24,
            height: 24,
            color: ColorConstant.gray200,
            svgPath: ImageConstant.imgArrowrightIndigo900,
            onTap: () => share(),
          ),*/
        ],
      ),
    );
  }

  Future<void> share() async {
    const urlPreview = 'https://www.filmaffinity.com/es/film866133.html';

    await Share.share('https://example.com');
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

donwloadBook(){
    print('say hi');
}


readBook(){
     print('i want sleep');
}

class ModalBottomActions extends StatelessWidget {
  final items;

  const ModalBottomActions({
    super.key,
    required this.items
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> links = [
      {
        'name': 'Leer libro',
        'icon': '',
        'link': '',
      },
      {
        'name': 'Escuchar libro',
        'icon': '',
        'link': '',
      },
      {
        'name': 'Descargar',
        'icon': '',
        'link': '',
      },
    ];
      if(items.isNotEmpty){
        links = items;
      }
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
                icon: item['icon']!,
                funct: item['funct'],
              )),
            );
          }),
        ],
      ),
    );
  }
}


