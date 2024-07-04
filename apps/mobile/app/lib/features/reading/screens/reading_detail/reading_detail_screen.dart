import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_html/style.dart';
import 'package:mobile_app/core/app_export.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/models/BookBible.dart';
import '../../../../shared/shared.dart';
import '../../../book/widgets/widgets.dart';
import '../../widgets/widgets.dart';

class ReadingDetailScreen extends StatefulWidget {
  static const String route = 'reading-detail-route';
  const ReadingDetailScreen({Key? key}) : super(key: key);

  @override
  State<ReadingDetailScreen> createState() => _ReadingDetailScreenState();
}

class _ReadingDetailScreenState extends State<ReadingDetailScreen> {
  bool onAudioSound = false;
  String _newVoiceText = 'Hola';
  Map<String, dynamic> settingTextInitialValues = {
    'fontSize': 5.0,
    'margin': 1.0,
    'lineHeight': 1.0,
    'color': Colors.black
  };
  String selectedVerse = '';
  TextBook textBook = TextBook(
      fontFamily: 'fontFamily',
      color: Colors.black,
      size: 32.0,
      margin: 14.0,
      lineHeight: 1.2,
      fontSize: FontSize.medium);

  void handleChangeTextSetting(dynamic event, dynamic values) {
    textBook.fontSize = event['fontSize'];
    textBook.lineHeight = event['lineHeight'];
    textBook.margin = event['margin'];
    settingTextInitialValues['fontSize'] = values['fontSize'];
    settingTextInitialValues['margin'] = values['margin'];
    settingTextInitialValues['lineHeight'] = values['lineHeight'];
    setState(() {});
  }

  Future<void> share(String value) async {
    await Share.share(value);
  }

  void setVoiceText(String text) {
    setState(() {
      _newVoiceText = text;
    });
  }

  void setOnAudioSound(bool value) {
    setState(() {
      onAudioSound = value;
    });
  }

  void handleButtonPlay(String text) {
    setOnAudioSound(!onAudioSound);

    setState(() {
      _newVoiceText = text;
    });
  }

  void playSelectedText() async {
    _newVoiceText = await ClipboardService.getCopyText();
    setOnAudioSound(true);
  }

  void shareSelectedText() async {
    share(await ClipboardService.getCopyText());
  }

  void handleSelectedContent(SelectedContent? selectedContent) {
    if (selectedContent != null) {
      ClipboardService.setCopyText(selectedContent.plainText);
    }
  }

  bool _isNumeric(String str) {
    if (str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }

  void shareVerses(String title, List<Verse> verses) {
    List<String> verseList = [];

    for (var verse in verses) {
      verseList.add('${verse.id}) ${verse.verse}\n');
    }

    share('$title\n${verseList.join()}');
  }

  @override
  Widget build(BuildContext context) {
    Reading reading = ModalRoute.of(context)?.settings.arguments! as Reading;
    DailyReadingService dailyReadingService =
        Provider.of<DailyReadingService>(context, listen: false);

    int index =
        reading.verses.split('').indexWhere((element) => _isNumeric(element));

    List<Verse> verses = dailyReadingService.getReadingsByPath(
        reading.verses.substring(0, index - 1).toLowerCase(),
        reading.verses.substring(index));

    final List<PopupMenuItemModel> menuOptions = [
      PopupMenuItemModel(
          id: 1,
          title: 'Ajustar texto',
          onTappedItem: () {
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                context: context,
                builder: (context) => PanelSettingTextBook(
                      initialValues: settingTextInitialValues,
                      onChange: handleChangeTextSetting,
                    ));
          }),
      PopupMenuItemModel(
          id: 2,
          title: 'Compartir',
          onTappedItem: () => shareVerses(reading.title, verses))
    ];

    final appBarActions = [
      {
        'icon': ImageConstant.imgMusicIndigo900,
        'color': ColorConstant.indigo900,
        'variant': !onAudioSound
            ? IconButtonVariant.NoFill
            : IconButtonVariant.OutlinePurple50,
        'action': () => handleButtonPlay(''),
      },
    ];

    final List<ContextMenuButtonItem> menuButtonItems = [
      ContextMenuButtonItem(label: 'Escuchar', onPressed: playSelectedText),
      ContextMenuButtonItem(label: 'Compartir', onPressed: shareSelectedText),
    ];

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(
        title: reading.title,
        actions: appBarActions,
        hasPopupMenu: true,
        popupMenuButton:
            CustomPopupMenuButton(isDarkMode: false, menuOptions: menuOptions),
      ),
      body: Padding(
        padding: getPadding(left: textBook.margin, right: textBook.margin),
        child: SizedBox(
          height: height * 0.90,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reading.verses,
                      style: AppStyle.txtNunitoSansSemiBold26.copyWith(
                        color: ColorConstant.indigo900,
                        fontWeight: FontWeight.w900,
                        fontSize: ConvertUtils.getDoubleFromFontSize(
                            textBook.fontSize),
                        height: textBook.lineHeight,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomSelectionArea(
                        onSelectionChanged: handleSelectedContent,
                        menuButtonItems: menuButtonItems,
                        child: ListViewVerses(
                          verses: verses,
                          textBook: textBook,
                        )),
                  ],
                ),
              ),
              if (onAudioSound)
                ConstrainedBox(
                  constraints: BoxConstraints(minHeight: 400),
                  child: PopupAudioPlayer(
                    voiceText: _newVoiceText,
                    bookTitle: reading.verses,
                    bookAuthor: '',
                    onCompletion: () {},
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
