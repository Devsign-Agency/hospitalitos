import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/core/app_export.dart';
import 'package:mobile_app/features/main/pages/home/widgets/widget.dart';
import 'package:mobile_app/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  static const String route = 'home';

  HomePage({Key? key}) : super(key: key);

  final List<Widget> _slides = [
    Wrap(children: [
      Align(
          alignment: Alignment.centerLeft,
          child:
              Text('Liturgia', style: AppStyle.txtNunitoSansRegular16Gray900)),
      Align(
          alignment: Alignment.centerLeft,
          child: Text('08 de enero', style: AppStyle.txtNunitoSansSemiBold26)),
      SizedBox(height: 8.0),
      Align(
        widthFactor: double.infinity,
          alignment: Alignment.centerLeft,
          child: Text('Del propio del día. Salterio II',
              style: AppStyle.txtNunitoSansRegular18Gray900)),
    ]),Wrap(children: [
      Align(
          alignment: Alignment.centerLeft,
          child:
              Text('Liturgia', style: AppStyle.txtNunitoSansRegular16Gray900)),
      Align(
          alignment: Alignment.centerLeft,
          child: Text('08 de enero', style: AppStyle.txtNunitoSansSemiBold26)),
      SizedBox(height: 8.0),
      Align(
        widthFactor: double.infinity,
          alignment: Alignment.centerLeft,
          child: Text('Del propio del día. Salterio II',
              style: AppStyle.txtNunitoSansRegular18Gray900)),
    ]),Wrap(children: [
      Align(
          alignment: Alignment.centerLeft,
          child:
              Text('Liturgia', style: AppStyle.txtNunitoSansRegular16Gray900)),
      Align(
          alignment: Alignment.centerLeft,
          child: Text('08 de enero', style: AppStyle.txtNunitoSansSemiBold26)),
      SizedBox(height: 8.0),
      Align(
        widthFactor: double.infinity,
          alignment: Alignment.centerLeft,
          child: Text('Del propio del día. Salterio II',
              style: AppStyle.txtNunitoSansRegular18Gray900)),
    ]),Wrap(children: [
      Align(
          alignment: Alignment.centerLeft,
          child:
              Text('Liturgia', style: AppStyle.txtNunitoSansRegular16Gray900)),
      Align(
          alignment: Alignment.centerLeft,
          child: Text('08 de enero', style: AppStyle.txtNunitoSansSemiBold26)),
      SizedBox(height: 8.0),
      Align(
        widthFactor: double.infinity,
          alignment: Alignment.centerLeft,
          child: Text('Del propio del día. Salterio II',
              style: AppStyle.txtNunitoSansRegular18Gray900)),
    ]),
  ];

  Future<List<EpubBook>> fetchData() async {
    return EpubDocument.openAssetFolder('/epubs');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              Container(
                margin: const EdgeInsets.only(
                    left: 14.0, right: 14.0, top: 8.0, bottom: 24.0),
                child: Row(
                  children: [
                    CustomIconButton(
                height: 48,
                width: 48,
                variant: IconButtonVariant.FillGray400,
                child: CustomImageView(
                  color: ColorConstant.gray800,
                  svgPath: ImageConstant.imgUserGray800,
                ),
              ),
                    SizedBox(width: 10),
                    Expanded(
                        child: Column(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Buen día',
                          style: AppStyle.txtNunitoSansSemiBold13Gray800)),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text('José',
                          style: AppStyle.txtNunitoSansSemiBold23))
                      ],
                    )),
                    SizedBox(width: 10),
                    CustomIconButton(
                height: 48,
                width: 48,
                variant: IconButtonVariant.FillGray300,
                child: CustomImageView(
                  color: ColorConstant.gray800,
                  svgPath: ImageConstant.imgSearch,
                ),
              ),
                    SizedBox(width: 5),
                    CustomIconButton(
                height: 48,
                width: 48,
                variant: IconButtonVariant.FillGray300,
                child: CustomImageView(
                  color: ColorConstant.gray800,
                  svgPath: ImageConstant.imgNotification,
                ),
              ),
                  ],
                ),
              ),
              // News Slider
              Container(
                margin: const EdgeInsets.only(left: 14.0, right: 14.0, bottom: 10.0),
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, top: 10.0, bottom: 14.0),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(24, 39, 75, 0.08),
                        offset: const Offset(0.0, 8.0),
                        blurRadius: 18.0,
                        spreadRadius: -6.0,
                      ), //BoxSha
                      BoxShadow(
                        color: Color.fromRGBO(24, 39, 75, 0.08),
                        offset: const Offset(0.0, 12.0),
                        blurRadius: 42.0,
                        spreadRadius: -4.0,
                      ), //BoxShadow
                    ]),
                child: NewsSlider(
                  children: _slides,
                ),
              ),
            
              // My Favorites
              Container(
                  margin:
                      const EdgeInsets.only(left: 14.0, right: 14.0, bottom: 14.0),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(24, 39, 75, 0.08),
                          offset: const Offset(0.0, 8.0),
                          blurRadius: 18.0,
                          spreadRadius: -6.0,
                        ), //BoxSha
                        BoxShadow(
                          color: Color.fromRGBO(24, 39, 75, 0.08),
                          offset: const Offset(0.0, 12.0),
                          blurRadius: 42.0,
                          spreadRadius: -4.0,
                        ), //BoxShadow
                      ]),
                  child: Row(
                    children: [
                      CustomImageView(
                    color: ColorConstant.gray800,
                    svgPath: ImageConstant.imgFavorite,
                    height: getSize(24),
                    width: getSize(24),
                    margin: getMargin(top: 4, bottom: 4)),
                      SizedBox(width: 10),
                      Text(
                        'Mis Favoritos',
                        style: AppStyle.txtNunitoSansSemiBold23,
                      )
                    ],
                  )),
            
              // Recently viewed
              Column(
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.0),
                      child: Row(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Visto recientemente',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtNunitoSansSemiBold23,
                            ),
                          ),
                          Spacer(),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              children: [
                                Text('Ver más',
                                    style: TextStyle(
                                        fontSize: 14, fontWeight: FontWeight.w300)),
                                Icon(Icons.chevron_right_outlined)
                              ],
                            ),
                          ),
                        ],
                      )),
                  PreviewItemList(future: fetchData()),
                ],
              ),
            
              // Daily activities
              Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 14.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Actividades diarias',
                            style: TextStyle(fontSize: 18)),
                      )),
                  SizedBox(height: 14),
                  Padding(
                    padding: EdgeInsets.only(left: 14.0, right: 14.0, bottom: 14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ExpandedButton(
                      icon: ImageConstant.imgButtonalerts, label: 'Lecturas'),
                        SizedBox(width: 14.0),
                        ExpandedButton(
                      icon: ImageConstant.imgVolume, label: 'Oraciones'),
                        SizedBox(width: 14.0),
                        ExpandedButton(
                      icon: ImageConstant.imgVolumeIndigo900, label: 'Blog')
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
