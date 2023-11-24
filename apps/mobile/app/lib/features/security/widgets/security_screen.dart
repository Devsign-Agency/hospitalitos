import 'package:flutter/material.dart';
import 'package:mobile_app/core/app_export.dart';

class SecurityScreen extends StatelessWidget {
  final Widget header;
  final Widget child;
  final String title;
  final String subTitle;

  const SecurityScreen({
    super.key,
    required this.header,
    required this.child,
    required this.title,
    this.subTitle = ''
  });

  @override
  Widget build(BuildContext context) {
    return _Background(children: [
      header,
      _Container(
        title: title,
        subTitle: subTitle,
        child: child,
      )
    ]);
  }
}

class _Background extends StatelessWidget {
  final List<Widget> children;

  const _Background({required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            color: ColorConstant.gray100,
            image: DecorationImage(
                image: AssetImage(ImageConstant.imgIniciodesesin),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Container(
              width: double.maxFinite,
              padding: getPadding(left: 16, right: 16, bottom: 300),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: children)),
        ));
  }
}

class _Container extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget child;

  _Container(
      {required this.title, required this.subTitle, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.maxFinite,
        child: Container(
            margin: getMargin(top: 16),
            padding: getPadding(left: 14, top: 6, right: 14, bottom: 6),
            decoration: AppDecoration.outlineBluegray90014
                .copyWith(borderRadius: BorderRadiusStyle.customBorderTL12),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding: getPadding(top: 18),
                      child: Text(title,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtNunitoSansSemiBold20Gray900)),
                  Padding(
                      padding: getPadding(left: 26, right: 27),
                      child: Text(subTitle,
                          maxLines: null,
                          textAlign: TextAlign.center,
                          style: AppStyle.txtNunitoSansRegular14Gray900
                              .copyWith(
                                  letterSpacing: getHorizontalSize(0.25)))),
                  child,
                  Padding(
                      padding: getPadding(top: 44),
                      child: SizedBox(
                          width: getHorizontalSize(72),
                          child: Divider(
                              height: getVerticalSize(2),
                              thickness: getVerticalSize(2),
                              color: ColorConstant.gray900)))
                ])));
  }
}
