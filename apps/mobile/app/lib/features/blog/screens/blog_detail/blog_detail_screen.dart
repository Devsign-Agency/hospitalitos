import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:html/parser.dart';
import 'package:mobile_app/core/app_export.dart';
import 'package:mobile_app/shared/services/text_to_speech.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/popup_audio_player.dart';
import '../../widgets/widgets.dart';

class BlogDetail extends StatefulWidget {
  static const route = 'detail';
  const BlogDetail({super.key});

  @override
  State<BlogDetail> createState() => _BlogDetailState();
}

class _BlogDetailState extends State<BlogDetail> {
  late TextToSpeech ttsProvider;
  var _scrollController = ScrollController();
  bool _isExpanded = false;
  bool onAudioSound = false;
  String newVoiceText = '';
  FToast? fToast;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _isExpanded = _isSliverAppBarExpanded;
      });
    });

    fToast = FToast();
    fToast?.init(context);
  }

  @override
  dispose() {
    ttsProvider.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dynamic params = ModalRoute.of(context)?.settings.arguments;
    ttsProvider = Provider.of<TextToSpeech>(context, listen: true);
    final String parsedString =
        stripHtmlIfNeeded(params['content']['rendered']);
    var selectedText = '';

    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          CustomAppBar(
              isExpanded: _isExpanded,
              imgUrl: params['_embedded']['wp:featuredmedia'][0]['source_url'],
              linkShare: params['link'],
              title: params['title']['rendered']),
          SliverList(
              delegate: SliverChildListDelegate([
            ...List.generate(1, (int index) {
              return Stack(
                children: [
                  Padding(
                      padding: getPadding(all: 16),
                      child: SelectionArea(
                        onSelectionChanged: (value) {
                          selectedText = value?.plainText ?? '';
                        },
                        contextMenuBuilder: (context, editableTextState) {
                          final List<ContextMenuButtonItem> buttonItems =
                              editableTextState.contextMenuButtonItems;
                          buttonItems.insert(
                            2,
                            ContextMenuButtonItem(
                              label: 'Escuchar',
                              onPressed: () async {
                                ttsProvider.text = selectedText;

                                ttsProvider.init();

                                ttsProvider.play();

                                // setState(() {
                                //   newVoiceText = selectedText;
                                //   onAudioSound = !onAudioSound;
                                // });
                              },
                            ),
                          );
                          return AdaptiveTextSelectionToolbar.buttonItems(
                            anchors: editableTextState.contextMenuAnchors,
                            buttonItems: buttonItems,
                          );
                        },
                        child: Center(
                          child: Html(
                            data: parsedString,
                            style: {
                              'body': Style(
                                margin: Margins.zero,
                                padding: EdgeInsets.zero,
                                fontSize: FontSize(17.0),
                                lineHeight: LineHeight(1.4),
                                fontFamily: 'Nunito Sans',
                              ),
                              'p': Style(
                                  padding: EdgeInsets.all(6),
                                  fontFamily: 'Nunito Sans',
                                  alignment:
                                      Alignment.centerRight // for text right
                                  ),
                              'strong': Style(
                                fontSize: FontSize(20.0),
                              ),
                              'img': Style(
                                height: Height(0),
                                width: Width(0),
                              )
                            },
                          ),
                        ),
                      )),
                ],
              );
            }),
          ]))
        ],
      ),
    ));
  }

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients && _scrollController.offset > (50);
  }
}

String removeAllHtmlTags(String htmlText) {
  print(htmlText);
  RegExp exp = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true);
  var separator = '\n';
  final result = RegExp(r'<[^>]*>')
      .allMatches(htmlText)
      .map((e) => e.group(0))
      .join(separator);

  return result;
}

String stripHtmlIfNeeded(String text) {
  // The regular expression is simplified for an HTML tag (opening or
  // closing) or an HTML escape. We might want to skip over such expressions
  // when estimating the text directionality.
  return text.replaceAll('<img .*?>/g', '');
}
