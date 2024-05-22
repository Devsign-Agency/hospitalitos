import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as dom;
import 'package:url_launcher/url_launcher.dart';

import '../../../core/app_export.dart';

class HtmlToRichTextWidget extends StatelessWidget {
  final String? htmlString;

  const HtmlToRichTextWidget({Key? key, this.htmlString = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final document = parse(htmlString);
    final inlineSpans = _parseNode(document.body!);
    // inlineSpans[10].style?.copyWith(backgroundColor: Colors.yellow);
    inlineSpans[3] = TextSpan(
        text: inlineSpans[3].toPlainText(),
        style: TextStyle(backgroundColor: Colors.yellow));
    print(Container(
      child: Text.rich(inlineSpans[3]),
    ));

    // inlineSpans.forEach((inlineSpan) {
    //   print(inlineSpan.toPlainText());
    // });

    // ListView(children: [
    //   Container(
    //     child: Text.rich(inlineSpans[3]),
    //   )
    // ]);

    // inlineSpans[10].

    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (_, int index) {
        print(inlineSpans[index].toPlainText());
        if (inlineSpans[index].toPlainText() != '') {
          return Container(
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(
                        width: 2.0, color: ColorConstant.indigo900))),
            child: Text(inlineSpans[index].toPlainText()),
          );
        }
      },
      itemCount: inlineSpans.length,
    );
    // return  ListView.builder(children: [
    //   Container(
    //     child: Text.rich(inlineSpans[3]),
    //   )
    // ]);
    // return RichText(
    //   text: TextSpan(
    //       children: inlineSpans,
    //       style: const TextStyle(
    //           color: Colors.black, fontFamily: 'Nunito Sans', fontSize: 18)),
    // );
  }

  List<InlineSpan> _parseNode(dom.Node node) {
    final inlineSpans = <InlineSpan>[];

    if (node.nodeType == dom.Node.TEXT_NODE) {
      final text = node.text;
      inlineSpans.add(TextSpan(text: text));
    } else if (node.nodeType == dom.Node.ELEMENT_NODE) {
      final element = node as dom.Element;

      switch (element.localName) {
        case "b":
        case 'strong':
          return _parseElements(
              element, const TextStyle(fontWeight: FontWeight.bold));
        case "i":
        case 'em':
          return _parseElements(
              element, const TextStyle(fontStyle: FontStyle.italic));
        case "u":
          return _parseElements(
              element, const TextStyle(decoration: TextDecoration.underline));
        case "sub":
          inlineSpans.add(WidgetSpan(
            alignment: PlaceholderAlignment.bottom,
            child: SizedBox(
              height: 10,
              child: Text(
                element.text,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.blue,
                  textBaseline: TextBaseline.alphabetic,
                ),
              ),
            ),
          ));
          break;
        case "sup":
          inlineSpans.add(WidgetSpan(
            alignment: PlaceholderAlignment.top,
            child: SizedBox(
              height: 10,
              child: Text(
                element.text,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.blue,
                  textBaseline: TextBaseline.alphabetic,
                ),
              ),
            ),
          ));
          break;
        case "p":
          return _parseElements(element, const TextStyle());
        case "span":
          // print(element.className);
          return _parseElements(element, const TextStyle(color: Colors.red));

        case "a":
          final href = element.attributes['href'] ?? '';
          return _parseElements(
              element,
              const TextStyle(
                  decoration: TextDecoration.underline, color: Colors.blue),
              href);
        case 'br':
          inlineSpans.add(const TextSpan(text: "\n"));
          break;
        case 'h2':
          return _parseElements(
              element,
              const TextStyle(
                fontSize: 28,
              ));

        default:
          return _parseElements(element, const TextStyle());
      }
    }

    return inlineSpans;
  }

  List<InlineSpan> _parseElements(dom.Element element, TextStyle style,
      [String? href]) {
    final spans = <InlineSpan>[];

    for (final node in element.nodes) {
      final childTextSpans = _parseNode(node);

      for (final childTextSpan in childTextSpans) {
        var launch = TapGestureRecognizer()
          ..onTap = () => launchUrl(Uri.tryParse(href ?? "")!);
        if (childTextSpan is TextSpan) {
          spans.add(
            TextSpan(
              onEnter: (p) {
                print('texto test');
              },
              text: childTextSpan.text,
              style: style.merge(childTextSpan.style),
              recognizer: href != null ? launch : null,
            ),
          );
        } else {
          spans.add(childTextSpan);
          print(childTextSpan.toString());
        }
      }
    }
    return spans;
  }
}
