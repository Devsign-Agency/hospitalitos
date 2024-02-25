import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/core/app_export.dart';
import 'package:mobile_app/core/models/book.dart';
import 'package:mobile_app/core/models/user.dart';
import 'package:mobile_app/features/bible/bible_screen.dart';
import 'package:mobile_app/features/favorite/screens/screens.dart';
import 'package:mobile_app/features/liturgia/screens/calendar/calendar_screen.dart';
import 'package:mobile_app/features/main/pages/home/widgets/widget.dart';
import 'package:mobile_app/features/notification/screens/notifications/notifications_screen.dart';
import 'package:mobile_app/shared/providers/bottom_navigation_main_provider.dart';
import 'package:mobile_app/shared/shared.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../library/screens/screens.dart';

class HomePage extends StatefulWidget {
  static const String route = 'home';

  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    ]),
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
    ]),
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
    ]),
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
    ]),
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
    ]),
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
    ]),
  ];
  late User? user;
  late BottomNavigationMainProvider bottomNavigationMain =
      Provider.of<BottomNavigationMainProvider>(context, listen: false);
  Future<List<EpubBook>> fetchData() async {
    return EpubDocument.openAssetFolder('/epubs');
  }

  Future<List<SfPdfViewer>> fetchDataPdf() async {
    return PdfService.openAssetFolder('/pdf');
  }

  @override
  initState() {
    super.initState();

    final authService = Provider.of<AuthService>(context, listen: false);
    user = authService.user;
  }

  Future<List<Book>> getBooks() async {
    final bookService = Provider.of<BookService>(context, listen: false);

    return bookService.getBooksFromJson();
  }

  void _onChangeTab(int index) {
    bottomNavigationMain.setSelectedItem(index);

    switch (index) {
      case 0:
        Navigator.pushNamedAndRemoveUntil(
            context, HomePage.route, (r) => false);
        // Navigator.of(context).pushNamed(HomePage.route);
        break;
      case 1:
        Navigator.of(context).pushNamed(CoursesScreen.route);
        break;
      case 2:
        Navigator.of(context).pushNamed(LiturgiaCalendarScreen.route);
        break;
      case 3:
        Navigator.of(context).pushNamed(BibleScreen.route);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> actions = [
      {'icon': ImageConstant.imgSearch, 'action': () => {}},
      {
        'icon': ImageConstant.imgNotification,
        'action': () => Navigator.pushNamed(context, NotificationsScreen.route)
      },
    ];

    final List<BottomNavigationMenu> bottomMenuList = [
      BottomNavigationMenu(icon: ImageConstant.imgHome, title: 'Home'),
      BottomNavigationMenu(
          icon: ImageConstant.imgSearchGray800, title: 'Descubre'),
      BottomNavigationMenu(icon: ImageConstant.imgCalendar, title: 'Liturgia'),
      BottomNavigationMenu(icon: ImageConstant.imgMobile, title: 'Biblia'),
    ];

    return Scaffold(
      appBar: CustomAppBar(
        customTitle: Row(
          children: [
            CustomIconButton(
              height: 48,
              width: 48,
              variant: IconButtonVariant.FillGray400,
              child: CustomImageView(
                color: ColorConstant.gray800,
                svgPath: ImageConstant.imgUserGray800,
              ),
              onTap: () => Navigator.of(context).pushNamed('profile'),
            ),
            SizedBox(width: 10),
            Column(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Buen día',
                        style: AppStyle.txtNunitoSansSemiBold13Gray800)),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(user?.firstname ?? '',
                        style: AppStyle.txtNunitoSansSemiBold23))
              ],
            ),
          ],
        ),
        hasCustomTitle: true,
        actions: actions,
        iconButtonVariant: IconButtonVariant.FillGray300,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // News Slider
            CustomCard(
              margin:
                  getMargin(left: 14.0, right: 14.0, bottom: 8.0, top: 18.0),
              child: NewsSlider(
                children: _slides,
              ),
            ),

            // My Favorites
            CustomCard(
              margin: getMargin(left: 14.0, right: 14.0, bottom: 14.0),
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
              ),
              onTapped: () =>
                  Navigator.of(context).pushNamed(FavoriteListScreen.route),
            ),

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
                                  style: AppStyle
                                      .txtNunitoSansSemiBold16Indigo900),
                              CustomIconButton(
                                height: 48,
                                width: 48,
                                variant: IconButtonVariant.NoFill,
                                child: CustomImageView(
                                  color: ColorConstant.gray800,
                                  svgPath: ImageConstant.imgArrowrightIndigo900,
                                ),
                                onTap: () => Navigator.of(context)
                                    .pushNamed(ListSeeMore.route),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),

                // Show epub list

                CardPreviewItemList(
                  future: fetchData(),
                  onTappedItem: () {},
                ),
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
                          style: AppStyle.txtNunitoSansSemiBold23),
                    )),
                SizedBox(height: 14),
                Padding(
                  padding:
                      EdgeInsets.only(left: 14.0, right: 14.0, bottom: 14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ExpandedButton(
                          icon: ImageConstant.imgButtonalerts,
                          label: 'Lecturas'),
                      SizedBox(width: 14.0),
                      ExpandedButton(
                          icon: ImageConstant.imgVolume, label: 'Oraciones'),
                      SizedBox(width: 14.0),
                      ExpandedButton(
                        icon: ImageConstant.imgVolumeIndigo900,
                        label: 'Blog',
                        route: 'blog',
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        bottomMenuList: bottomMenuList,
        onChangeIndex: _onChangeTab,
      ),
    );
  }
}
