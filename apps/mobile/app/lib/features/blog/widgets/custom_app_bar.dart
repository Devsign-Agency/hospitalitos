import 'package:flutter/material.dart';
import 'package:mobile_app/core/constants/color.constant.dart';
import 'package:mobile_app/core/theme/app.style.dart';
import 'package:mobile_app/widgets/widgets.dart';

class CustomAppBar extends StatelessWidget {
  final bool isExpanded;

  const CustomAppBar({super.key, required this.isExpanded});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Color.fromARGB(255, 127, 100, 90),
      expandedHeight: 200,
      floating: false,
      pinned: true,
      title: isExpanded
          ? Text('Título', style: AppStyle.txtNunitoSansSemiBold26WhiteA700)
          : null,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: !isExpanded ? _FlexibleSpaceBarTitle() : null,
        background: _FlexibleSpaceBarBackground(),
      ),
      actions: [
        _ActionButton(),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.share_outlined,
          size: 24,
          color: ColorConstant.whiteA700,
        ),
        onPressed: () => showModalBottomSheet(
            backgroundColor: ColorConstant.gray50,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            context: context,
            builder: (context) => ModalBottomSheet()));
  }
}

class _FlexibleSpaceBarBackground extends StatelessWidget {
  const _FlexibleSpaceBarBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: const AssetImage('assets/loading.gif'),
      image: AssetImage('assets/images/img_image3.png'),
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
        children: [
          Text('Título', style: AppStyle.txtNunitoSansSemiBold26WhiteA700),
          Text('Autor', style: AppStyle.txtNunitoSansRegular18WhiteA700),
          Text('DD/MM/AA', style: AppStyle.txtNunitoSansRegular18WhiteA700),
        ],
      ),
    );
  }
}
