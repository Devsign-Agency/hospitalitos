import 'package:flutter/material.dart';
import 'package:mobile_app/core/constants/color.constant.dart';
import 'package:mobile_app/core/theme/app.style.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'package:share_plus/share_plus.dart';

class CustomAppBar extends StatelessWidget {
  final bool isExpanded;
  
  final String imgUrl;

  final linkShare;

  final title;

  const CustomAppBar({super.key, required this.isExpanded, required this.imgUrl, required this.linkShare, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Color.fromARGB(255, 127, 100, 90),
      expandedHeight: 300,
      floating: false,
      pinned: true,
      title: isExpanded
          ? Text(title, style: AppStyle.txtNunitoSansSemiBold26WhiteA700)
          : null,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: !isExpanded ? _FlexibleSpaceBarTitle() : null,
        background: _FlexibleSpaceBarBackground(imgUrl: imgUrl),
      ),
      actions: [
        _ActionButton(linkShared: linkShare,),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final linkShared;

  const _ActionButton({
    super.key,
    required this.linkShared
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.share_outlined,
          size: 24,
          color: ColorConstant.whiteA700,
        ),
        onPressed: () =>  share(linkShared));
  }


   Future<void> share(String url) async {
    const urlPreview = 'https://www.filmaffinity.com/es/film866133.html';

    await Share.share(url);
  }
}

class _FlexibleSpaceBarBackground extends StatelessWidget {
  final String imgUrl;

  const _FlexibleSpaceBarBackground({
    super.key,
    required this.imgUrl
  });

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: const AssetImage('assets/loading.gif'),
      image:  NetworkImage(imgUrl),
      fit: BoxFit.cover,
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
