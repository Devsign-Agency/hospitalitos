import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChatBubble extends StatefulWidget {
  static const String route = 'chat';
  const ChatBubble({super.key});

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: CustomAppBar(
          title: 'Felipe',
        ),
      
        //iconButtonVariant: IconButtonVariant.FillGray300,
      
        body: WebView(
          initialUrl: 'https://asistai.scrib.art/',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      );
    
  }
}
