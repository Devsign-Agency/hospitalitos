import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:mobile_app/core/app_export.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../widgets/widgets.dart';
import '../../../book/widgets/widgets.dart';

class PrayerDetailScreen extends StatefulWidget {
  static const String route = 'prayer-detail-router';
  const PrayerDetailScreen({Key? key}) : super(key: key);

  @override
  State<PrayerDetailScreen> createState() => _PrayerDetailScreenState();
}

class _PrayerDetailScreenState extends State<PrayerDetailScreen> {
  bool onAudioSound = false;
  String _newVoiceText = '';

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
    print('handleChange');
    textBook.fontSize = event['fontSize'];
    textBook.lineHeight = event['lineHeight'];
    textBook.margin = event['margin'];
    settingTextInitialValues['fontSize'] = values['fontSize'];
    settingTextInitialValues['margin'] = values['margin'];
    settingTextInitialValues['lineHeight'] = values['lineHeight'];
    // textBook.color = event['color'];
    setState(() {});
  }

  Future<void> share(String value) async {
    await Share.share(value);
  }

  double convertFontSizePxToDouble(FontSize fontSize) {
    Map<FontSize, double> values = {
      FontSize.xSmall: 12.0,
      FontSize.xxSmall: 14.0,
      FontSize.smaller: 16.0,
      FontSize.small: 18.0,
      FontSize.medium: 24.0,
      FontSize.large: 32.0,
      FontSize.larger: 36.0,
      FontSize.xLarge: 40.0,
      FontSize.xxLarge: 48.0
    };

    return values[fontSize]!;
  }

  void handleButtonPlay(String text) {
    setOnAudioSound(!onAudioSound);

    setState(() {
      _newVoiceText = text;
    });
  }

  void setOnAudioSound(bool value) {
    setState(() {
      onAudioSound = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Prayer prayer = ModalRoute.of(context)?.settings.arguments! as Prayer;

    final List<PopupMenuItemModel> menuOptions = [
      PopupMenuItemModel(
          id: 1,
          title: 'Ajustar texto',
          onTappedItem: (context) {
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                context: context,
                builder: (context) => PanelSettingTextBook(
                      isDarkMode: false,
                      initialValues: settingTextInitialValues,
                      onChange: handleChangeTextSetting,
                    ));
          }),
      PopupMenuItemModel(
          id: 2,
          title: 'Compartir',
          onTappedItem: (context) {
            share('${prayer.title}\n\n${prayer.prayer}');
          })
    ];

    final appBarActions = [
      {
        'icon': ImageConstant.imgMusicIndigo900,
        'color': ColorConstant.indigo900,
        'variant': !onAudioSound
            ? IconButtonVariant.NoFill
            : IconButtonVariant.OutlinePurple50,
        'action': () => handleButtonPlay(prayer.prayer),
      },
    ];

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: CustomAppBar(
            title: prayer.title,
            hasPopupMenu: true,
            actions: appBarActions,
            popupMenuButton: CustomPopupMenuButton(
                isDarkMode: false, menuOptions: menuOptions)),
        body: Padding(
          padding: getPadding(left: textBook.margin, right: textBook.margin),
          child: SizedBox(
            height: height * 0.90,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Text(
                    prayer.prayer,
                    style: AppStyle.txtNunitoSansSemiBold20Black900.copyWith(
                      fontSize: convertFontSizePxToDouble(textBook.fontSize),
                      height: textBook.lineHeight,
                    ),
                  ),
                ),
                if (onAudioSound)
                  ConstrainedBox(
                    constraints: BoxConstraints(minHeight: 400),
                    child: PopupAudioPlayer(
                      voiceText: _newVoiceText,
                      bookTitle: prayer.title,
                      bookAuthor: '',
                      onCompletion: () {},
                    ),
                  )
              ],
            ),
          ),
        ));
  }
}
