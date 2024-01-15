import 'dart:io';

import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:html/parser.dart';
import 'package:mobile_app/core/app_export.dart';
import 'package:mobile_app/core/models/user.dart';
import 'package:mobile_app/features/bible/screens/main/main_screen.dart';
import 'package:mobile_app/features/favorite/screens/screens.dart';
import 'package:mobile_app/features/library/screens/screens.dart';
import 'package:mobile_app/features/liturgia/screens/calendar/calendar_screen.dart';
import 'package:mobile_app/features/main/pages/home/widgets/widget.dart';
import 'package:mobile_app/features/main/router/main.router.dart';
import 'package:mobile_app/features/notification/screens/notifications/notifications_screen.dart';
import 'package:mobile_app/features/security/router/router.dart';
import 'package:mobile_app/shared/shared.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:vocsy_epub_viewer/epub_viewer.dart';

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

  Future<List<EpubBook>> fetchData() async {
    return EpubDocument.openAssetFolder('/epubs');
  }

  @override
  initState() {
    super.initState();

    final authService = Provider.of<AuthService>(context, listen: false);
    user = authService.user;
  }

  void _onChangeTab(int index) {
    switch (index) {
      case 1:
        Navigator.of(context).pushNamed(CoursesScreen.route);
        break;
      case 2:
        Navigator.of(context).pushNamed(LiturgiaCalendarScreen.route);
        break;
      case 3:
        Navigator.of(context).pushNamed(MainScreen.route);
        break;
    }
  }

  onTap(context, EpubBook book) async {
    dynamic path;
//Get the epub into memory somehow
    // String fileName = 'book.epub';
    // String fullPath = path.join(Directory.current.path, fileName);
    // var targetFile = new File(fullPath);
    // List<int> bytes = await targetFile.readAsBytes();

    // Directory directory = await getApplicationDocumentsDirectory();
    // EpubReader.readBook();
    // print(directory.path);
    // dynamic other = rootBundle.load('assets/epubs/book.epub');
    // // print(other);
    // // File _epubFile = File('mobile/app/assets/epubs/book.epub');
    // late dynamic book = EpubReader.readBook(other);
    // print(book);
    // final contents = await other.readAsBytes();
    // EpubBookRef epub = await EpubReader.openBook(contents.toList());
    // var cont = await EpubReader.readTextContentFiles(epub.Content!.Html!);
    // List<String> htmlList = [];
    // for (var value in cont.values) {
    //   htmlList.add(value.Content!);
    // }
    // var doc = parse(htmlList.join());
    // final String parsedString = parse(doc.body!.text).documentElement!.text;
    // print(parsedString);

    // Book reader using the vocsy_epub library

    // VocsyEpub.setConfig(
    //   themeColor: Theme.of(context).primaryColor,
    //   identifier: "iosBook",
    //   scrollDirection: EpubScrollDirection.ALLDIRECTIONS,
    //   allowSharing: true,
    //   enableTts: true,
    //   nightMode: false,
    // );
    // // get current locator
    // VocsyEpub.locatorStream.listen((locator) {
    //   print('LOCATOR: $locator');
    // });
    // await VocsyEpub.openAsset(
    //   'assets/epubs/${book.Title}.epub',
    //   lastLocation: EpubLocator.fromJson({
    //     "bookId": "2239",
    //     "href": "/OEBPS/ch06.xhtml",
    //     "created": 1539934158390,
    //     "locations": {"cfi": "epubcfi(/0!/4/4[simple_book]/2/2/6)"}
    //   }),
    // );

    // Book reader using the epub_book library

    Navigator.pushNamed(context, 'book',
        arguments: EpubArguments(book: book, chapter: book.Chapters![0]));
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
                      onTap: () => Navigator.of(context).pushNamed('profile'),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                        child: Column(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Buen día',
                                style:
                                    AppStyle.txtNunitoSansSemiBold13Gray800)),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(user?.firstname ?? '',
                                style: AppStyle.txtNunitoSansSemiBold23))
                      ],
                    )),
                    SizedBox(width: 10),
                    CustomIconButton(
                      height: 48,
                      width: 48,
                      variant: IconButtonVariant.FillGray300,
                      onTap: _playText,
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
                      // onTap: _logout,
                      child: CustomImageView(
                        color: ColorConstant.gray800,
                        svgPath: ImageConstant.imgNotification,
                      ),
                      onTap: () => Navigator.of(context)
                          .pushNamed(NotificationsScreen.route),
                    ),
                  ],
                ),
              ),
              // News Slider

              CustomCard(
                margin: getMargin(left: 14.0, right: 14.0, bottom: 8.0),
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
                                CustomImageView(
                                  svgPath: ImageConstant.imgArrowrightIndigo900,
                                  width: getSize(24),
                                  height: getSize(24),
                                  color: ColorConstant.indigo900,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                  CardPreviewItemList(
                    future: fetchData(),
                    onTappedItem: onTap,
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
                            style: TextStyle(fontSize: 18)),
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
        bottomNavigationBar: CustomBottomBar(onChanged: _onChangeTab),
      ),
    );
  }

  _logout() async {
    AuthService auth = Provider.of<AuthService>(context, listen: false);
    await auth.googleSignOut();
    if (context.mounted) {
      Navigator.of(context).pushNamedAndRemoveUntil(RouterSecurity.initialRoute,
          ModalRoute.withName(RouterMain.initialRoute));
    }
  }

  _playText() async {
    print('playText');
    TextToSpeech tts = TextToSpeech();

    await tts.play('Hola mundo, esto es una prueba de flutter.');
  }
}
