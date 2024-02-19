import 'dart:convert';
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

import '../../../../../widgets/widgets.dart';

class CustomSearchBookDelegate extends SearchDelegate<String> {
  // Dummy list
  final List<dynamic> searchList = [
    "Apple",
    "Banana",
    "Cherry",
    "Date",
    "Fig",
    "Grapes",
    "Kiwi",
    "Lemon",
    "Mango",
    "Orange",
    "Papaya",
    "Raspberry",
    "Strawberry",
    "Tomato",
    "Watermelon",
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
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
                                  Column(
                                    children: [
                                      CustomIconButton(
                                        height: getSize(48),
                                        width: getSize(48),
                                        onTap: () {
                                          //getTextFromEpubInstance(index);
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
      if (data[i].Title.toLowerCase() == query) {
        listTab.add(data[i]);
      }
    }

    return listTab;

    //return  data.map((item)=> item.Title.toLowerCase() == query).toList();
    //return data.where((e) => e["Title"].contains(query)).toList();
  }

  onTaped(context, EpubBook book) {
    Navigator.pushNamed(context, IndexPage.route,
        arguments: EpubArguments(book: book, chapter: book.Chapters![0]));
  }

  filter(_items, query) {
    var auxData = _items;

    print('holllaaaa $auxData');
  }
}

Future<List<dynamic>> fetchData() async {
  return EpubDocument.openAssetFolder('/epubs');
}
