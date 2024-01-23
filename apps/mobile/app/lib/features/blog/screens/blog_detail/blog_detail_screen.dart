import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:html/parser.dart';
import 'package:mobile_app/core/app_export.dart';

import '../../widgets/widgets.dart';

class BlogDetail extends StatefulWidget {
  static const route = 'detail';
  const BlogDetail({super.key});

  @override
  State<BlogDetail> createState() => _BlogDetailState();
}

class _BlogDetailState extends State<BlogDetail> {
  var _scrollController = ScrollController();
  bool _isExpanded = false;
  FToast? fToast;
  @override
  void initState() {
    _scrollController.addListener(() {
      setState(() {
        _isExpanded = _isSliverAppBarExpanded;
      });
    });

    fToast = FToast();
    fToast?.init(context);
  }

  @override
  Widget build(BuildContext context) {
    final dynamic params = ModalRoute.of(context)?.settings.arguments;

    final String parsedString = stripHtmlIfNeeded(params['content']['rendered']);

    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          CustomAppBar(
            isExpanded: _isExpanded,
            imgUrl: params['_embedded']['wp:featuredmedia'][0]['source_url'],
            linkShare: params['link'],
            title: params['title']['rendered']
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            ...List.generate(1, (int index) {
              return Padding(
                  padding: getPadding(all: 16),
                  child: Html(
                    data: parsedString,
                  )
                  
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
    RegExp exp = RegExp(
      r"<[^>]*>",
      multiLine: true,
      caseSensitive: true
    );
    var separator = '\n';
    final result = RegExp(r"<[^>]*>")
               .allMatches(htmlText)
               .map((e) => e.group(0))
               .join(separator);

    return result;
  }

String stripHtmlIfNeeded(String text) {
  // The regular expression is simplified for an HTML tag (opening or
  // closing) or an HTML escape. We might want to skip over such expressions
  // when estimating the text directionality.
  return text.replaceAll('<img .*?>/g',""); 
}
