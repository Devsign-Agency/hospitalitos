import 'package:flutter/material.dart';

class NewsSlider extends StatefulWidget {
  final List<Widget> children;

  NewsSlider({super.key, required this.children});

  @override
  State<NewsSlider> createState() => _NewsSliderState();
}

class _NewsSliderState extends State<NewsSlider> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    Color color = Color.fromRGBO(225, 224, 230, 1);
    Color activeColor = Theme.of(context).colorScheme.primary;

    List<Widget> data() {
      List<Widget> list = [];
      for (int i = 0; i < widget.children.length; i++) {
        list.add(Expanded(
            child: Container(
          width: double.infinity,
          height: 3,
          color: i == pageIndex ? activeColor : color,
        )));
        if (i < widget.children.length - 1) {
          list.add(SizedBox(width: 5));
        }
      }
      return list;
    }

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 90,
          child: PageView(
            children: widget.children,
            onPageChanged: (value) => setState(() => pageIndex = value),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(children: data()),
        ),
      ],
    );
  }
}
