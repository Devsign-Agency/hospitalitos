import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:epub_view/epub_view.dart' hide Image;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image/image.dart' hide Image;
import 'package:mobile_app/core/constants/color.constant.dart';
import 'package:mobile_app/core/constants/image.constant.dart';
import 'package:mobile_app/core/models/epub.arguments.dart';
import 'package:mobile_app/core/theme/app.style.dart';
import 'package:mobile_app/core/utils/size.utils.dart';
import 'package:mobile_app/features/book/pages/index.page.dart';
import 'package:mobile_app/features/profile/screens/interests/interests_screen.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../../widgets/widgets.dart';

class CustomSearchBookDelegate extends SearchDelegate<String> {
  // Dummy list
  final List<dynamic> searchList = [
    "G.A.E",
    "Método para memorizar citas bíblicas",
  ];

  // These methods are mandatory you cannot skip them.
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          // When pressed here the query will be cleared from the search bar.
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
      // Exit from the search screen.
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List searchResults = searchList
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchResults[index]),
          onTap: () {
            // Handle the selected search result.
            close(context, searchResults[index]);
          },
        );
      },
    );
  }

  Widget _emptyContainer() {
    return Center(
        child: Icon(Icons.article_outlined, color: Colors.black38, size: 100));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: ColorConstant.whiteA700,
    );

    final borderRadius = BorderRadius.only(
        topLeft: Radius.circular(12), bottomLeft: Radius.circular(12));

    if (query.isEmpty) {
      return _emptyContainer();
    } else {
      return FutureBuilder(
          future: fetchData(),
          builder: (_, AsyncSnapshot snapshot) {
            

            if(snapshot.hasData){
               var epale = [...snapshot.data];
              var suggestionList = dataBooks(epale, query);
            return  ListView.separated(
                shrinkWrap: true,
                itemBuilder: (_, int index) {
                  final item = suggestionList[index];

                  Image image = Image.memory(
                      Uint8List.fromList(encodePng(item.CoverImage!)));

                  return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: GestureDetector(
                      onTap: () {
                        onTaped(context, item);
                      },
                      child: Container(
                        margin: EdgeInsets.all(5),
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

                            Container(
                              margin: EdgeInsets.all(5),
                              child: Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          CustomIconButton(
                                            height: getSize(48),
                                            width: getSize(48),
                                            onTap: () {
                                              getTextFromEpubInstance(item);
                                            },
                                            variant: IconButtonVariant.FillYellow,
                                            child: CustomImageView(
                                                color: ColorConstant.gray800,
                                                svgPath: ImageConstant
                                                    .imgDownloadGray30024x24),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
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
                itemCount: suggestionList.length,
              );
            }else{
              return Container();
            }
          });
    }
  }

  dataBooks(data, query) {
    print(data);

    List<dynamic> listTab = [];

    for (var i = 0; i < data.length; i++) {
      if (data[i].Title.toLowerCase().contains(query) ) {
        listTab.add(data[i]);
      }
    }

    return listTab;

    //return  data.map((item)=> item.Title.toLowerCase() == query).toList();
    //return data.where((e) => e["Title"].contains(query)).toList();
  }

  onTaped(context, EpubBook book) {
    testData(book);
    Navigator.pushNamed(context, IndexPage.route,
        arguments: EpubArguments(book: book, chapter: book.Chapters![0]));
  }

  downloadEpub(book){
    print('book $book');
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

    /*fToast?.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 3),
    );*/

    //Navigator.of(context).pop();

    //Navigator.of(context).pushNamed('seemore');
  }

  getTextFromEpubInstance(item) async {
    var url = 'https://sample-videos.com/video123/mp4';

    final nameFile = item.Title + '.epub';

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
  testData(book){
    print(book.Chapters);
  }

  filter(_items, query) {
    var auxData = _items;

    print('holllaaaa $auxData');
  }
}

Future<List<dynamic>> fetchData() async {
  return EpubDocument.openAssetFolder('/epubs');
}
