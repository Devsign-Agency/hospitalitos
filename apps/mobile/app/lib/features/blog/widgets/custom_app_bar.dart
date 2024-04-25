import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app/core/constants/color.constant.dart';
import 'package:mobile_app/core/theme/app.style.dart';
import 'package:mobile_app/core/utils/size.utils.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'package:share_plus/share_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http_parser/http_parser.dart';

class CustomAppBar extends StatelessWidget {
  final bool isExpanded;

  final String imgUrl;

  final linkShare;

  final title;

  const CustomAppBar(
      {super.key,
      required this.isExpanded,
      required this.imgUrl,
      required this.linkShare,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Color.fromARGB(255, 127, 100, 90),
      expandedHeight: 305,
      floating: true,
      pinned: true,
      leading: BackButton(
        color: Colors.white,
      ),
      title: isExpanded
          ? Text(title, style: AppStyle.txtNunitoSansSemiBold26WhiteA700)
          : null,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: !isExpanded ? _FlexibleSpaceBarTitle() : null,
        background: _FlexibleSpaceBarBackground(
          imgUrl: imgUrl,
        ),
      ),
      actions: [
        _ActionButton(
          linkShared: linkShare,
        ),
        _ActionButtonDownloadPicture(
          imageUrl: imgUrl,
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final linkShared;

  const _ActionButton({super.key, required this.linkShared});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.share_outlined,
          size: 24,
          color: ColorConstant.whiteA700,
        ),
        onPressed: () => share(linkShared));
  }

  Future<void> share(String url) async {
    const urlPreview = 'https://www.filmaffinity.com/es/film866133.html';

    await Share.share(url);
  }
}

class _ActionButtonDownloadPicture extends StatefulWidget {
  final imageUrl;

  const _ActionButtonDownloadPicture({super.key, required this.imageUrl});

  @override
  State<_ActionButtonDownloadPicture> createState() =>
      _ActionButtonDownloadPictureState();
}

class _ActionButtonDownloadPictureState
    extends State<_ActionButtonDownloadPicture> {
  final fToast = FToast();
  @override
  void initState() {
    super.initState();

    fToast?.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.download_outlined,
          size: 24,
          color: ColorConstant.whiteA700,
        ),
        onPressed: () => _save(widget.imageUrl));
  }

  _save(imageUrl) async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
    var response = await Dio()
        .get(imageUrl, options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
        name: "image" + formattedDate);
    print(result);
    showCustomToast();
  }

  showCustomToast() {
    Widget toast = Container(
      width: double.infinity,
      height: 48,
      padding: getPadding(left: 16, right: 16, top: 14, bottom: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),

        color: Colors.grey[800], // TODO: Añadir color a ColorConstants
      ),
      child: Text(
        'El archivo se ha descargado',
        style: AppStyle.txtRobotoRegular14Gray10002,
      ),
    );

    fToast?.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 3),
    );

    //Navigator.of(context).pop();

    //Navigator.of(context).pushNamed('seemore');
  }
}

class _FlexibleSpaceBarBackground extends StatelessWidget {
  final String imgUrl;

  const _FlexibleSpaceBarBackground({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: const AssetImage('assets/loading.gif'),
      image: NetworkImage(imgUrl),
      fit: BoxFit.fill,
    );
  }
}

class _FlexibleSpaceBarTitle extends StatelessWidget {
  const _FlexibleSpaceBarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.bottomCenter,
      color: Colors.black12,
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        /*children: [
          Text('Título', style: AppStyle.txtNunitoSansSemiBold26WhiteA700),
          Text('Autor', style: AppStyle.txtNunitoSansRegular18WhiteA700),
          Text('DD/MM/AA', style: AppStyle.txtNunitoSansRegular18WhiteA700),
        ],
        */
      ),
    );
  }
}
