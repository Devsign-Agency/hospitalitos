import 'dart:convert';

import 'dart:io';

import 'dart:typed_data';

import 'dart:io' as Io;

import 'package:epub_view/epub_view.dart' hide Image;

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:image/image.dart' hide Image;

import 'package:mobile_app/core/constants/color.constant.dart';

import 'package:mobile_app/core/constants/image.constant.dart';

import 'package:mobile_app/core/models/book.dart';

import 'package:mobile_app/core/models/epub.arguments.dart';

import 'package:mobile_app/core/theme/app.style.dart';

import 'package:mobile_app/core/utils/size.utils.dart';

import 'package:mobile_app/features/book/pages/index.page.dart';

import 'package:mobile_app/features/main/pages/home/widgets/custom_search_books.dart';

import 'package:mobile_app/shared/services/book_service.dart';

import 'package:mobile_app/shared/services/favorite_service.dart';

import 'package:mobile_app/widgets/custom_icon_button.dart';

import 'package:mobile_app/widgets/custom_image_view.dart';

import 'package:path_provider/path_provider.dart';

import 'package:provider/provider.dart';


import '../../../../../widgets/notification_empty_list.dart';

import '../../../../../widgets/widgets.dart';

import '../../../../profile/screens/interests/interests_screen.dart';


class ListSeeMore extends StatefulWidget {

  static const String route = 'seemore';

  const ListSeeMore({super.key});


  @override

  State<ListSeeMore> createState() => _ListSeeMoreState();

}


Future<List<EpubBook>> fetchData() async {

  return EpubDocument.openAssetFolder('/epubs');

}


class _ListSeeMoreState extends State<ListSeeMore> {

  bool _isEditing = false;

  late List<Map<String, dynamic>> actions = [];

  List<dynamic> books = [];


  final fToast = FToast();

  @override

  void initState() {

    super.initState();

    initActions();


    fToast?.init(context);

    fetchData().then((value) {

      books = value;

      setState(() {});

    });

  }


  void _changeModeView() {

    actions.clear();

    _isEditing = !_isEditing;

    if (!_isEditing) {

      fetchData();

    } else {

      actions = [

        {

          'icon': ImageConstant.imgCloseGray24x24,

          'action': () => {_changeModeView()}

        },

      ];

    }

    setState(() {});

  }


  void initActions() {

    actions = [

      {

        'icon': ImageConstant.imgSearch,

        'action': () =>
            {showSearch(context: context, delegate: CustomSearchBookDelegate())}

      },

    ];

  }


  void _handleActions() {

    print('You have clicked!');

  }


  @override

  Widget build(BuildContext context) {

    FavoriteService favoriteService = Provider.of<FavoriteService>(context);


    return Scaffold(

      appBar: CustomAppBar(

        title: 'Libros',

        backgroundColor: ColorConstant.gray50,

        iconButtonVariant: !_isEditing

            ? IconButtonVariant.FillGray300

            : IconButtonVariant.NoFill,

        // hideActions: _isEditing,

        actions: [...actions],

      ),

      body: Column(

        children: [

          // Menu options


          // builds a list, but if it is empty it shows a notification message

          _buildMainContent(books, context)

        ],

      ),

    );

  }


  Widget _buildMainContent(List<dynamic> chapterList, context) {

    final boxDecoration = BoxDecoration(

      borderRadius: BorderRadius.circular(12),

      color: ColorConstant.whiteA700,

    );


    final borderRadius = BorderRadius.only(

        topLeft: Radius.circular(12), bottomLeft: Radius.circular(12));


    return chapterList.isNotEmpty

        ? Padding(
            padding: getPadding(left: 16, right: 16),
            child: ListView.separated(

              shrinkWrap: true,

              itemBuilder: (_, int index) {

                final item = chapterList[index];


                Image image = Image.memory(
                    Uint8List.fromList(encodePng(item.CoverImage!)));


                return Padding(

                  padding: const EdgeInsets.only(top: 9.0),

                  child: GestureDetector(

                    onTap: () {
                      onTap(context, item);
                    },

                    child: Container(

                      width: double.infinity,

                      height: getSize(88),

                      decoration: boxDecoration,

                      child: Row(

                        children: [

                          // Image

                          ClipRRect(

                            borderRadius: borderRadius,

                            /*child: CustomImageView(
                              imagePath: image,
                              width: getSize(132),
                              height: double.infinity,
                            ),*/


                            child: Row(

                              children: [

                                SizedBox.fromSize(

                                  size: Size.fromRadius(48), // Image radius

                                  child: Image.memory(

                                      Uint8List.fromList(

                                          encodePng(item.CoverImage!)),

                                      fit: BoxFit.cover),

                                ),

                              ],

                            ),

                          ),


                          Flexible(

                            child: Row(

                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              crossAxisAlignment: CrossAxisAlignment.center,

                              children: [

                                Column(

                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,

                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [

                                    Container(

                                      width: 200,

                                      child: Text(

                                        item.Title,

                                        style: AppStyle
                                            .txtNunitoSansRegular16Gray9001,

                                      ),

                                    ),

                                    Text(

                                      item.Author,

                                      style: AppStyle
                                          .txtNunitoSansRegular14Gray9001,

                                    ),

                                  ],

                                ),

                                Padding(
                                  padding: const EdgeInsets.only(right: 6.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomIconButton(
                                        height: getSize(48),
                                        width: getSize(48),
                                        onTap: () {
                                          getTextFromEpubInstance(index);
                                        },
                                        variant: IconButtonVariant.FillYellow,
                                        child: CustomImageView(
                                            color: ColorConstant.gray800,
                                            svgPath: ImageConstant
                                                .imgDownloadGray30024x24),
                                      ),
                                    ],
                                  ),

                                ),

                              ],

                            ),

                          ),

                          // Content

                        ],

                      ),

                    ),

                  ),

                );

              },

              separatorBuilder: (_, __) => SizedBox(height: 8),

              itemCount: books.length,

            ),
          )

        : SizedBox(
            height: 600,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Text('Cargando libros')],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: CircularProgressIndicator(
                            color: ColorConstant.yellow100),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );

  }


  Future<List<Book>> getBooks() async {

    final bookService = Provider.of<BookService>(context, listen: false);


    return bookService.getBooksFromJson();

  }


  Future<List<EpubBook>> fetchData() async {

    return EpubDocument.openAssetFolder('/epubs');

  }

  onTap(context, EpubBook book) {

    Navigator.pushNamed(context, IndexPage.route,

        arguments: EpubArguments(book: book, chapter: book.Chapters![0]));

  }


  convertImgToBase64(img) async {

    var bytes = await img.readAsBytes();

    return base64Encode(bytes);

  }


  downloadFile(item) {

    getTextFromEpubInstance(item);

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


  getTextFromEpubInstance(index) async {

    var url = 'https://sample-videos.com/video123/mp4';

    final nameFile = books[index].Title + '.epub';

    var response = await loadAsset(nameFile);


    var savePath = '/storage/emulated/0/Download/$nameFile';


    var file = File(savePath);

    var raf = file.openSync(mode: FileMode.write);

    // response.data is List<int> type

    final data = await rootBundle.load('assets/epubs/$nameFile');

    final bytes = data.buffer.asUint8List();

    raf.writeFromSync(bytes);
    showCustomToast();

  }


  Future<File> loadAsset(fileName) async {

    final data = await rootBundle.load('assets/epubs/$fileName');

    final bytes = data.buffer.asUint8List();


    return _storeFile('book3.epub', bytes);

  }


  static Future<File> _storeFile(String url, List<int> bytes) async {

    final filename = url;

    final dir = await getApplicationDocumentsDirectory();


    final file = File('${dir.path}/$filename');

    return await file.writeAsBytes(bytes, flush: true);

  }


  Future<File> writeToFile(ByteData data) async {

    final buffer = data.buffer;

    Directory tempDir = await getTemporaryDirectory();

    String tempPath = tempDir.path;

    var filePath =

        tempPath + '/file_01.tmp'; // file_01.tmp is dump file, can be anything

    return new File(filePath).writeAsBytes(

        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));

  }

}

