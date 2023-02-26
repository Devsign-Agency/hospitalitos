import 'package:flutter/material.dart';
import 'package:mobile_app/features/main/pages/home/widgets/widget.dart';
import 'package:mobile_app/widgets/carousel_indicator/carousel_indicator.dart';

class HomePage extends StatelessWidget {
  static const String route = 'home';

  HomePage({Key? key}) : super(key: key);

  final List<Widget> _slides = [
    Column(children: [
      Align(
          alignment: Alignment.centerLeft,
          child: Text('Liturgia', style: TextStyle(fontSize: 12, height: 2))),
      Align(
          alignment: Alignment.centerLeft,
          child:
              Text('08 de enero', style: TextStyle(fontSize: 28, height: 1.4))),
      SizedBox(height: 8.0),
      Align(
          alignment: Alignment.centerLeft,
          child: Text('Del propio del día. Salterio II',
              style: TextStyle(
                  fontSize: 16, height: 1.2, fontWeight: FontWeight.w300))),
    ]),
    Column(children: [
      Align(
          alignment: Alignment.centerLeft,
          child: Text('Liturgia', style: TextStyle(fontSize: 12, height: 2))),
      Align(
          alignment: Alignment.centerLeft,
          child:
              Text('08 de enero', style: TextStyle(fontSize: 28, height: 1.4))),
      SizedBox(height: 8.0),
      Align(
          alignment: Alignment.centerLeft,
          child: Text('Del propio del día. Salterio II',
              style: TextStyle(
                  fontSize: 16, height: 1.2, fontWeight: FontWeight.w300))),
    ]),
    Column(children: [
      Align(
          alignment: Alignment.centerLeft,
          child: Text('Liturgia', style: TextStyle(fontSize: 12, height: 2))),
      Align(
          alignment: Alignment.centerLeft,
          child:
              Text('08 de enero', style: TextStyle(fontSize: 28, height: 1.4))),
      SizedBox(height: 8.0),
      Align(
          alignment: Alignment.centerLeft,
          child: Text('Del propio del día. Salterio II',
              style: TextStyle(
                  fontSize: 16, height: 1.2, fontWeight: FontWeight.w300))),
    ]),
    Column(children: [
      Align(
          alignment: Alignment.centerLeft,
          child: Text('Liturgia', style: TextStyle(fontSize: 12, height: 2))),
      Align(
          alignment: Alignment.centerLeft,
          child:
              Text('08 de enero', style: TextStyle(fontSize: 28, height: 1.4))),
      SizedBox(height: 8.0),
      Align(
          alignment: Alignment.centerLeft,
          child: Text('Del propio del día. Salterio II',
              style: TextStyle(
                  fontSize: 16, height: 1.2, fontWeight: FontWeight.w300))),
    ]),
    Column(children: [
      Align(
          alignment: Alignment.centerLeft,
          child: Text('Liturgia', style: TextStyle(fontSize: 12, height: 2))),
      Align(
          alignment: Alignment.centerLeft,
          child:
              Text('08 de enero', style: TextStyle(fontSize: 28, height: 1.4))),
      SizedBox(height: 8.0),
      Align(
          alignment: Alignment.centerLeft,
          child: Text('Del propio del día. Salterio II',
              style: TextStyle(
                  fontSize: 16, height: 1.2, fontWeight: FontWeight.w300))),
    ]),
    Column(children: [
      Align(
          alignment: Alignment.centerLeft,
          child: Text('Liturgia', style: TextStyle(fontSize: 12, height: 2))),
      Align(
          alignment: Alignment.centerLeft,
          child:
              Text('08 de enero', style: TextStyle(fontSize: 28, height: 1.4))),
      SizedBox(height: 8.0),
      Align(
          alignment: Alignment.centerLeft,
          child: Text('Del propio del día. Salterio II',
              style: TextStyle(
                  fontSize: 16, height: 1.2, fontWeight: FontWeight.w300))),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
              left: 14.0, right: 14.0, top: 8.0, bottom: 24.0),
          child: Row(
            children: [
              BorderedIcon(icon: Icons.person_outlined),
              SizedBox(width: 10),
              Expanded(
                  child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Buen día', style: TextStyle(fontSize: 12))),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('José', style: TextStyle(fontSize: 20)))
                ],
              )),
              SizedBox(width: 10),
              BorderedIcon(icon: Icons.search_outlined),
              SizedBox(width: 5),
              BorderedIcon(icon: Icons.notifications_outlined),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 14.0, right: 14.0, bottom: 10.0),
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0, bottom: 30.0),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(14)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(24, 39, 75, 0.08),
                  offset: const Offset(0.0, 8.0),
                  blurRadius: 18.0,
                  spreadRadius: -6.0,
                ), //BoxSha
                BoxShadow(
                  color: Color.fromRGBO(24, 39, 75, 0.08),
                  offset: const Offset(0.0, 12.0),
                  blurRadius: 42.0,
                  spreadRadius: -4.0,
                ), //BoxShadow
              ]),
          child: NewsSlider(
            children: _slides,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 14.0),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(14)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(24, 39, 75, 0.08),
                  offset: const Offset(0.0, 8.0),
                  blurRadius: 18.0,
                  spreadRadius: -6.0,
                ), //BoxSha
                BoxShadow(
                  color: Color.fromRGBO(24, 39, 75, 0.08),
                  offset: const Offset(0.0, 12.0),
                  blurRadius: 42.0,
                  spreadRadius: -4.0,
                ), //BoxShadow
              ]),
          child: Row(
            children: [
                Icon(Icons.favorite_border),
                SizedBox(width: 10),
                Text('Mis Favoritos', style: TextStyle(fontSize: 18),)
            ],
          )
        )
      ],
    );
  }
}

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
        CarouselIndicator(
          count: widget.children.length,
          index: pageIndex,
          activeColor: Theme.of(context).colorScheme.primary,
          color: Color.fromRGBO(225, 224, 230, 1),
          height: 3,
          width: 50,
          cornerRadius: 0,
        ),
      ],
    );
  }
}
