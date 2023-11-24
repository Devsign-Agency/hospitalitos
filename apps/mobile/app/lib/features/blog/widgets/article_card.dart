import 'package:flutter/material.dart';
import 'package:mobile_app/core/app_export.dart';

import '../../../../widgets/widgets.dart';
import '../screens/screens.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 192,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(14),
            image: DecorationImage(
                image: AssetImage('assets/images/img_image3.png'),
                fit: BoxFit.cover),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: LinearGradient(colors: [
                Color.fromRGBO(0, 0, 0, 0.01),
                Color.fromRGBO(0, 0, 0, 0.6),
                Color.fromRGBO(0, 0, 0, 1.0),
              ], stops: [
                0.39,
                0.8,
                1.1
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
            child: Padding(
              padding: getPadding(all: 16),
              child: Stack(
                children: [
                  Positioned(top: 0, right: 0, child: _TimeRead()),
                  Positioned(left: 0, bottom: 0, child: _TitleAndAuthor()),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                          onTap: () => Navigator.pushNamed(
                              context, BlogDetail.route,
                              arguments: 'detail'),
                          child: _ButtonRead())),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ButtonRead extends StatelessWidget {
  const _ButtonRead({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
        width: 80,
        height: 44,
        variant: IconButtonVariant.FillYellow,
        child: Text(
          'Leer',
          style: AppStyle.txtNunitoSansSemiBold16,
        ));
  }
}

class _TitleAndAuthor extends StatelessWidget {
  const _TitleAndAuthor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text('Title',
                style: AppStyle.txtNunitoSansSemiBold20WhiteA700)),
        Align(
            alignment: Alignment.centerLeft,
            child: Text('Author',
                style: AppStyle.txtNunitoSansRegular14WhiteA700)),
      ],
    );
  }
}

class _TimeRead extends StatelessWidget {
  const _TimeRead({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        gradient: LinearGradient(stops: [
          0.0,
          0.9
        ], colors: [
          Color.fromRGBO(0, 0, 0, 0.3),
          Color.fromRGBO(0, 0, 0, 0.3),
        ]),
      ),
      child: Text('5 mins', style: AppStyle.txtNunitoSansSemiBold13WhiteA700),
    );
  }
}
