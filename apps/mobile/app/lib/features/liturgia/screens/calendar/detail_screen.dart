import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mobile_app/core/app_export.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'package:share_plus/share_plus.dart';

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
  VoidCallback? onCompletion;

  String selectedVerse = '';
  TextBook textBook = TextBook(
      fontFamily: 'fontFamily',
      color: Colors.black,
      size: 32.0,
      margin: 14.0,
      lineHeight: 1.2,
      fontSize: FontSize.medium);

  String _newVoiceText = 'Hola';

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

  @override
  Widget build(BuildContext context) {
    dynamic params = ModalRoute.of(context)?.settings.arguments;
    String title = params['title'];
    String desc = params['description'];
    final List<ContextMenuButtonItem> menuButtonItems = [
      ContextMenuButtonItem(label: 'Escuchar', onPressed: playSelectedText),
      ContextMenuButtonItem(label: 'Compartir', onPressed: shareSelectedText),
    ];

    final appBarActions = [
      /*{
        'icon': ImageConstant.imgMusicIndigo900,
        'color': ColorConstant.indigo900,
        'variant': !onAudioSound
            ? IconButtonVariant.NoFill
            : IconButtonVariant.OutlinePurple50,
        'action': () => handleButtonPlay(),
      },*/
      {
        'icon': ImageConstant.imgShare,
        'color': ColorConstant.indigo900,
        'variant': !onAudioSound
            ? IconButtonVariant.NoFill
            : IconButtonVariant.OutlinePurple50,
        'action': () => share(title + '\n'+desc),
      },
    ];
    print('$title');
    return Scaffold(
      appBar: CustomAppBar(
        title: title,
        actions: appBarActions,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SingleChildScrollView(
                child: Center(
                  child: Text(
                    desc,
                    style: AppStyle.txtNunitoSansSemiBold20,
                  ),
                  
                ),
              ),
              /*if (onAudioSound)
                PopupAudioPlayer(
                  voiceText: _newVoiceText,
                  bookTitle: title,
                  bookAuthor: '',
                  onCompletion: () {},
                )*/
            ],
          ),
        ),
        
      ),
    );
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

  Future<void> share(String value) async {
    await Share.share(value);
  }

  

  void handleButtonPlay() {
    dynamic params = ModalRoute.of(context)?.settings.arguments;
    String title = params['title'];
    String desc = params['description'];
    setOnAudioSound(!onAudioSound);

    setState(() {
      _newVoiceText = desc;
    });
  }
  


 
}
