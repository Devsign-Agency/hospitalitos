import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

import '../core/app_export.dart';

class CustomSliverAppBar extends StatelessWidget {
  final bool isExpanded;
  final String pathImage;
  final String linkShare;
  final String title;

  const CustomSliverAppBar(
      {super.key,
      required this.isExpanded,
      required this.pathImage,
      required this.linkShare,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Color.fromARGB(255, 127, 100, 90),
      expandedHeight: 200,
      floating: true,
      pinned: true,
      leading: BackButton(
        color: Colors.white,
      ),
      title: isExpanded
          ? Text(title, style: AppStyle.txtNunitoSansSemiBold26WhiteA700)
          : null,
      flexibleSpace: FlexibleSpaceBar(
        background: _FlexibleSpaceBarBackground(
          pathImage: pathImage,
        ),
      ),
      actions: [
        _ActionButton(
          linkShared: linkShare,
        ),
        _ActionButtonDownloadPicture(
          imageUrl: pathImage,
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String linkShared;

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

  showCustomToast() {
    Widget toast = Container(
      width: double.infinity,
      height: 48,
      padding: getPadding(left: 16, right: 16, top: 14, bottom: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.grey[800],
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
  }

  _save(imageUrl) async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
    var response = await Dio()
        .get(imageUrl, options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
        name: 'image$formattedDate');

    Fluttertoast.showToast(msg: 'El archivo se ha descargado');
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
}

class _FlexibleSpaceBarBackground extends StatelessWidget {
  final String pathImage;

  const _FlexibleSpaceBarBackground({super.key, required this.pathImage});

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: const AssetImage('assets/loading.gif'),
      image: pathImage.isNotEmpty
          ? AssetImage(pathImage)
          : AssetImage('assets/images/img_frame26085551.png'),
      fit: BoxFit.cover,
    );
  }
}
