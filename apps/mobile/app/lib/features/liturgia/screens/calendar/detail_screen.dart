import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mobile_app/core/app_export.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'package:share_plus/share_plus.dart';

import '../../../book/widgets/widgets.dart';

class DetailLiturgyScreen extends StatefulWidget {
  static const String route = 'detail-liturgy';
  const DetailLiturgyScreen({Key? key}) : super(key: key);

  @override
  State<DetailLiturgyScreen> createState() => _DetailLiturgyScreenState();
}

class _DetailLiturgyScreenState extends State<DetailLiturgyScreen> {
  bool onAudioSound = false;
  Map<String, dynamic> settingTextInitialValues = {
    'fontSize': 5.0,
    'margin': 1.0,
    'lineHeight': 1.0,
    'color': Colors.black
  };

  TextBook textBook = TextBook(
      fontFamily: 'fontFamily',
      color: Colors.black,
      size: 32.0,
      margin: 14.0,
      lineHeight: 1.2,
      fontSize: FontSize.medium);

  VoidCallback? onCompletion;
  String _newVoiceText = '';

  @override
  void dispose() {
    super.dispose();
    Clipboard.setData(ClipboardData(text: ''));
  }

  void openPlayText() async {
    ClipboardData? kTextPlain;
    kTextPlain = await Clipboard.getData(Clipboard.kTextPlain);

    setVoiceText(kTextPlain?.text ?? '');
    setOnAudioSound(true);
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

  void playSelectedText() async {
    ClipboardData? kTextPlain;
    kTextPlain = await Clipboard.getData(Clipboard.kTextPlain);

    _newVoiceText = kTextPlain?.text ?? '';
    onAudioSound = true;

    setState(() {});
  }

  void shareSelectedText() async {
    ClipboardData? selectedContent =
        await Clipboard.getData(Clipboard.kTextPlain);

    if (selectedContent != null) share(selectedContent.text!);
  }

  void handleButtonPlay(String text) {
    setOnAudioSound(!onAudioSound);

    setState(() {
      _newVoiceText = text;
    });
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

  @override
  Widget build(BuildContext context) {
    dynamic params = ModalRoute.of(context)?.settings.arguments;
    String title = params['title'];
    String desc = params['description'];

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
            share('$title\n\n$desc');
          })
    ];

    final appBarActions = [
      {
        'icon': ImageConstant.imgMusicIndigo900,
        'color': ColorConstant.indigo900,
        'variant': !onAudioSound
            ? IconButtonVariant.NoFill
            : IconButtonVariant.OutlinePurple50,
        'action': () => handleButtonPlay(desc),
      },
    ];

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(
        title: title,
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
                child: Text(
                  desc,
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
                    bookTitle: title,
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
