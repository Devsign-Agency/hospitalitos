import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_app/features/book/pages/pages.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import '../../../../core/app_export.dart';
import '../../../../widgets/widgets.dart';
import 'package:epub_view/epub_view.dart' hide Image;
import 'package:image/image.dart' hide Image;
import '../../../shared/shared.dart';
import '../../../themes/themes.dart';

class IndexPage extends StatefulWidget {
  static const String route = 'book/index';
  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> with TickerProviderStateMixin {
  late TabController tabController;

  FToast? fToast;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    fToast = FToast();
    fToast?.init(context);
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as EpubArguments;
    final book = arguments.book;
    double height = MediaQuery.of(context).size.height;
    var actions = [
      {
        'icon': ImageConstant.imgDownloadGray30024x24,
        'action': () => {getTextFromEpubInstance(book)}
      },
    ];
    return Scaffold(
      appBar: CustomAppBar(title: book?.Title!, actions: actions),
      body: Column(
        children: [
          CustomTabBar(
              labelColor: ColorConstant.black9004c,
              tabController: tabController,
              items: IndexService.tabBarItems),

          // TabBarView
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                // Books Tab
                _ListChaptersOfBook(book: book),
                _ChapterDetail(book: book),
              ],
            ),
          ),
        ],
      ),
    );
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

Future<File> _storeFile(String url, List<int> bytes) async {
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

  return new File(filePath)
      .writeAsBytes(buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
}

testData(book) {
  print(book.Chapters);
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
}

class _ChapterDetail extends StatelessWidget {
  const _ChapterDetail({
    super.key,
    required this.book,
  });

  final EpubBook? book;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkTheme = themeProvider.currentTheme == DarkTheme.theme;
    TextStyle textStyle = AppStyle.txtNunitoSansRegular18Gray900.copyWith(
        color: isDarkTheme ? ColorConstant.whiteA700 : ColorConstant.gray900);
    return SizedBox(
      height: 100,
      width: 600,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox.fromSize(
                  size: Size.fromRadius(58), // Image radius
                  child: Image.memory(
                      Uint8List.fromList(encodePng(book!.CoverImage!)),
                      fit: BoxFit.cover),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 220,
                        child: Text(
                          'Titulo:',
                          style: textStyle,
                        ),
                      ),
                      SizedBox(
                        width: 220,
                        child: Text(
                          book!.Title!,
                          style: textStyle,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      SizedBox(
                        width: 220,
                        child: Text(
                          'Autor:',
                          style: textStyle,
                        ),
                      ),
                      SizedBox(
                        width: 220,
                        child: Text(
                          book!.Author!,
                          style: textStyle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ListChaptersOfBook extends StatelessWidget {
  const _ListChaptersOfBook({
    super.key,
    required this.book,
  });

  final book;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkTheme = themeProvider.currentTheme == DarkTheme.theme;

    return ListView.builder(
        shrinkWrap: true,
        //physics: const NeverScrollableScrollPhysics(),
        //scrollDirection: Axis.vertical,
        itemCount: book!.Chapters!.length,
        itemBuilder: (context, index) {
          var title = (book?.Chapters![index].Title!).toString();
          return title != ''
              ? Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: book?.Chapters![index].SubChapters.length > 0
                      ? ExpansionTile(
                          title: Text(
                            title,
                            style: AppStyle.txtNunitoSansSemiBold20Gray900
                                .copyWith(
                                    color: isDarkTheme
                                        ? ColorConstant.whiteA700
                                        : ColorConstant.gray900),
                          ),
                          children: [
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      book.Chapters![index].SubChapters.length,
                                  itemBuilder: (BuildContext context, int i) {
                                    var subtititle = book
                                        .Chapters![index].SubChapters[i].Title!
                                        .toString();
                                    return ListTile(
                                      onTap: () {
                                        var sub =
                                            book.Chapters![index].SubChapters;

                                        Navigator.pushNamed(
                                            context, ChapterPage.route,
                                            arguments: EpubArguments(
                                                book: book,
                                                chapter: book.Chapters![index]
                                                    .SubChapters[i]));
                                      },
                                      title: Title(
                                          color: isDarkTheme
                                              ? ColorConstant.whiteA700
                                              : ColorConstant.amber300,
                                          child: Text(subtititle)),
                                    );
                                  })
                            ])
                      : ListTile(
                          title: Text(
                              (book?.Chapters![index].Title!).toString(),
                              style: AppStyle.txtNunitoSansSemiBold20Gray900
                                  .copyWith(
                                      color: isDarkTheme
                                          ? ColorConstant.whiteA700
                                          : ColorConstant.gray900)),
                          onTap: () {
                            Navigator.pushNamed(context, ChapterPage.route,
                                arguments: EpubArguments(
                                    book: book,
                                    chapter: book?.Chapters![index]));
                          }),
                )
              : Container();
        });
  }

  listSubMenuBook(subChapters) {
    if (subChapters.isEmpty) {
      return ListView.builder(
        itemCount: subChapters.length,
        itemBuilder: (BuildContext context, int index) {
          var title = subChapters[index].Title!;

          ListTile(title: title);
        },
      );
    }
  }
}
