import 'dart:convert';

import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
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

import '../../../../themes/themes.dart';
import '../../../bible/screens/screens.dart';
import '../../../library/screens/screens.dart';

class HomePage extends StatefulWidget {
  static const String route = 'home';

  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

loadAsset() async {
  await rootBundle
      .loadString('assets/liturgia/sync/2024/mar/12/index.html')
      .then((String contents) {
    const HtmlEscape htmlEscape = HtmlEscape();
    //var text = (Uri.dataFromString(contents, mimeType: 'text/html', encoding: Encoding.getByName('utf-8')).toString());
    var text = htmlEscape.convert(contents);
    print('--------------- $text');

    //final reg = RegExp('(?=<div id="cuerpo" class="normal")|(?<=/div>)');
  });
}

class _HomePageState extends State<HomePage> {
  bool _isDarkTheme = false;
  //var dataLiturgia = liturgies();
  final _itemSliders = [
    [
      'Liturgia',
      'TIEMPO PASCUAL MARTES DE SEMANA II',
      'Propio del Tiempo. Salterio IIfsdffsdfds'
    ]
  ];

  // final List<Widget> _slides = [
  //   Wrap(children: [
  //     Align(
  //         alignment: Alignment.centerLeft,
  //         child:
  //             Text('Liturgia', style: AppStyle.txtNunitoSansRegular16Gray900)),
  //     Align(
  //         alignment: Alignment.centerLeft,
  //         child: Text('TIEMPO PASCUAL MARTES DE SEMANA II',
  //             style: AppStyle.txtNunitoSansSemiBold20)),
  //     Align(
  //         widthFactor: double.infinity,
  //         alignment: Alignment.centerLeft,
  //         child: Text('Propio del Tiempo. Salterio II',
  //             style: AppStyle.txtNunitoSansRegular14Gray900)),
  //   ]),
  // ];
  late User? user;
  late BottomNavigationMainProvider bottomNavigationMain =
      Provider.of<BottomNavigationMainProvider>(context, listen: false);
  Future<List<EpubBook>> fetchData() async {
    return EpubDocument.openAssetFolder('/epubs');
  }

  /*Future<List<EpubBook>> liturgy() async {
    return LiturgyService.items;+
  }*/

  Future<List<SfPdfViewer>> fetchDataPdf() async {
    return PdfService.openAssetFolder('/pdf');
  }

  @override
  initState() {
    super.initState();

    final authService = Provider.of<AuthService>(context, listen: false);
    user = authService.user;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ThemeProvider themeProvider =
          Provider.of<ThemeProvider>(context, listen: false);

      _isDarkTheme = Preferences.isDarkmode;
      _isDarkTheme ? themeProvider.setDarkMode() : themeProvider.setLightMode();
    });

    //loadAsset();
  }

  Future<List<Book>> getBooks() async {
    final bookService = Provider.of<BookService>(context, listen: false);

    return bookService.getBooksFromJson();
  }

  getCurrentDate() {
    final DateFormat format2 = DateFormat.yMMMMd('es_ES');
    return format2.format(DateTime.now()).split('de 2024')[0];
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
        Navigator.of(context).pushNamed(BibleMain.route);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    LiturgyService liturgyService = Provider.of<LiturgyService>(context);
    final day = DateTime.now().toString().split(' ')[0];
    print(day);
    List<dynamic> arr = [];
    var index = -1;
    liturgyService.liturgies.forEach((liturgia) {
      final date = liturgia['date'];
      index++;
      if (date == day) {
        final detail = liturgia['detail'];

        if (detail[2].contains('LUNES')) {
          arr.add(detail);
          arr.add(liturgyService.liturgies[index + 1]['detail']);
          arr.add(liturgyService.liturgies[index + 2]['detail']);
          arr.add(liturgyService.liturgies[index + 3]['detail']);
          arr.add(liturgyService.liturgies[index + 4]['detail']);
        }
        if (detail[2].contains('MARTES')) {
          arr.add(liturgyService.liturgies[index - 1]['detail']);
          arr.add(detail);
          arr.add(liturgyService.liturgies[index + 1]['detail']);
          arr.add(liturgyService.liturgies[index + 2]['detail']);
          arr.add(liturgyService.liturgies[index + 3]['detail']);
        }
        if (detail[2].contains('MIERCOLES')) {
          arr.add(liturgyService.liturgies[index - 2]['detail']);
          arr.add(liturgyService.liturgies[index - 1]['detail']);

          arr.add(detail);
          arr.add(liturgyService.liturgies[index + 1]['detail']);
          arr.add(liturgyService.liturgies[index + 2]['detail']);
        }
        if (detail[2].contains('JUEVES')) {
          arr.add(liturgyService.liturgies[index - 3]['detail']);
          arr.add(liturgyService.liturgies[index - 2]['detail']);
          arr.add(liturgyService.liturgies[index - 1]['detail']);
          arr.add(detail);
          arr.add(liturgyService.liturgies[index + 1]['detail']);
        }

         if (detail[2].contains('VIERNES')) {
          arr.add(liturgyService.liturgies[index - 4]['detail']);
          arr.add(liturgyService.liturgies[index - 3]['detail']);
          arr.add(liturgyService.liturgies[index - 2]['detail']);
          arr.add(liturgyService.liturgies[index - 1]['detail']);
          arr.add(detail);
         
        }

        /*if (detail[2].contains('MARTES')) {
          arr.add(liturgyService.liturgies[index - 1]);
          arr.add(detail);
          arr.add(liturgyService.liturgies[index + 2]);
          arr.add(liturgyService.liturgies[index + 3]);
          arr.add(liturgyService.liturgies[index + 4]);
        }
        if (detail[2].contains('MIERCOLES')) {
          arr.add(liturgyService.liturgies[index -2]);
          arr.add(liturgyService.liturgies[index -1]);
          arr.add(detail);
          arr.add(liturgyService.liturgies[index + 1]);
          arr.add(liturgyService.liturgies[index + 2]);
        }
        if (detail[2].contains('JUEVES')) {
          arr.add(liturgyService.liturgies[index - 3]);
          arr.add(liturgyService.liturgies[index - 2]);
          arr.add(liturgyService.liturgies[index - 1]);
          arr.add(liturgyService.liturgies[index + 4]);
        }
        if (detail[2].contains('VIERNES')) {
          arr.add(liturgyService.liturgies[index + 1]);
          arr.add(liturgyService.liturgies[index + 2]);
          arr.add(liturgyService.liturgies[index + 3]);
          arr.add(liturgyService.liturgies[index + 4]);
        }

        if (detail[2].contains('SABADO')) {
          arr.add(liturgyService.liturgies[index + 1]);
          arr.add(liturgyService.liturgies[index + 2]);
          arr.add(liturgyService.liturgies[index + 3]);
          arr.add(liturgyService.liturgies[index + 4]);
        }*/
      }
    });

    List<Map<String, dynamic>> actions = [
      {
        'icon': ImageConstant.imgChurch,
        'action': () => {_launchURL()}
      },
      {
        'icon': ImageConstant.imgMoonIndigo,
        'action': () {
          Preferences.isDarkmode
              ? themeProvider.setLightMode()
              : themeProvider.setDarkMode();

          Preferences.isDarkmode = !Preferences.isDarkmode;

          setState(() {
            _isDarkTheme = !_isDarkTheme;
          });
        }
      },
      /*{
        'icon': ImageConstant.imgNotification,
        'action': () => Navigator.pushNamed(context, NotificationsScreen.route)
      }*/
    ];

    final List<BottomNavigationMenu> bottomMenuList = [
      BottomNavigationMenu(icon: ImageConstant.imgHome, title: 'Home'),
      BottomNavigationMenu(
          icon: ImageConstant.imgSearchGray800, title: 'Descubre'),
      BottomNavigationMenu(icon: ImageConstant.imgCalendar, title: 'Liturgia'),
      BottomNavigationMenu(icon: ImageConstant.imgMobile, title: 'Biblia'),
    ];

    final List<Widget> slides = [];

    for (var element in arr) {
      slides.add(Wrap(children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text(element[0],
                style: AppStyle.txtNunitoSansSemiBold16.copyWith(
                    color: _isDarkTheme
                        ? ColorConstant.whiteA700
                        : ColorConstant.gray900))),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(element[1],
                style: AppStyle.txtNunitoSansSemiBold20.copyWith(
                    color: _isDarkTheme
                        ? ColorConstant.whiteA700
                        : ColorConstant.indigo900))),
        Align(
            widthFactor: double.infinity,
            alignment: Alignment.centerLeft,
            child: Text(element[2],
                style: AppStyle.txtNunitoSansRegular14Gray900.copyWith(
                    color: _isDarkTheme
                        ? ColorConstant.whiteA700
                        : ColorConstant.gray900))),
      ]));
    }

    return Scaffold(
      appBar: CustomAppBar(
        customTitle: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text('Buen día',
                        style: AppStyle.txtNunitoSansSemiBold16.copyWith(
                            color: _isDarkTheme
                                ? ColorConstant.whiteA700
                                : ColorConstant.gray800))),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(getCurrentDate(),
                        style: AppStyle.txtNunitoSansSemiBold23.copyWith(
                            color: _isDarkTheme
                                ? ColorConstant.whiteA700
                                : ColorConstant.gray900)))
              ],
            ),
          ],
        ),
        hasCustomTitle: true,
        actions: actions,
        //iconButtonVariant: IconButtonVariant.FillGray300,
      ),
      body: Column(
        children: [
          // News Slider
          CustomCard(
            margin: getMargin(left: 14.0, right: 14.0, bottom: 8.0, top: 14.0),
            child: NewsSlider(
              children: slides,
            ),
          ),

          // My Favorites
          CustomCard(
            margin: getMargin(left: 14.0, right: 14.0, bottom: 14.0),
            child: Row(
              children: [
                CustomImageView(
                    color: _isDarkTheme
                        ? ColorConstant.whiteA700
                        : ColorConstant.gray800,
                    svgPath: ImageConstant.imgFavorite,
                    height: getSize(24),
                    width: getSize(24),
                    margin: getMargin(top: 4, bottom: 4)),
                SizedBox(width: 10),
                Tooltip(
                  message: 'En Desarrollo',
                  triggerMode: TooltipTriggerMode.tap,
                  child: Text(
                    'Mis Favoritos',
                    style: AppStyle.txtNunitoSansSemiBold23.copyWith(
                        color: _isDarkTheme
                            ? ColorConstant.whiteA700
                            : ColorConstant.gray900),
                  ),
                )
              ],
            ),
            onTapped: () {
              ThemeProvider themeProvider =
                  Provider.of<ThemeProvider>(context, listen: false);

              themeProvider.setLightMode();
              //Navigator.of(context).pushNamed(FavoriteListScreen.route);
            },
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
                          style: AppStyle.txtNunitoSansSemiBold23.copyWith(
                              color: _isDarkTheme
                                  ? ColorConstant.whiteA700
                                  : ColorConstant.black9001c),
                        ),
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          children: [
                            Text('Ver más',
                                style: AppStyle.txtNunitoSansSemiBold16Indigo900
                                    .copyWith(
                                        color: _isDarkTheme
                                            ? ColorConstant.whiteA700
                                            : ColorConstant.indigo900)),
                            CustomIconButton(
                              height: 48,
                              width: 48,
                              variant: IconButtonVariant.NoFill,
                              child: CustomImageView(
                                color: _isDarkTheme
                                    ? ColorConstant.whiteA700
                                    : ColorConstant.indigo900,
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
                padding: EdgeInsets.only(left: 14.0, right: 14.0, bottom: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ExpandedButton(
                        message: 'En Desarrollo',
                        icon: ImageConstant.imgButtonalerts,
                        label: 'Lecturas'),
                    SizedBox(width: 14.0),
                    ExpandedButton(
                      icon: ImageConstant.imgVolume,
                      label: 'Oraciones',
                      message: 'En Desarrollo',
                    ),
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
      bottomNavigationBar: CustomBottomNavigationBar(
        bottomMenuList: bottomMenuList,
        onChangeIndex: _onChangeTab,
      ),
    );
  }

  _launchURL() async {
    const url =
        'https://docs.google.com/forms/d/1RxTOvDl_i08qV5X_5AxZsUFhq7bZf7-V9gG8Cth0xa8/edit?usp=drivesdks';
    final _url = Uri.parse(url);
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      // <--
      throw Exception('Could not launch $_url');
    }
  }
}
