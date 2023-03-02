import 'package:flutter/material.dart';
import 'package:mobile_app/features/main/pages/home/widgets/widget.dart';
import 'package:mobile_app/core/app_export.dart';

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
        // Header
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
        // News Slider
        Container(
          margin: const EdgeInsets.only(left: 14.0, right: 14.0, bottom: 10.0),
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 10.0, bottom: 14.0),
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

        // My Favorites
        Container(
            margin:
                const EdgeInsets.only(left: 14.0, right: 14.0, bottom: 14.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
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
                Text(
                  'Mis Favoritos',
                  style: TextStyle(fontSize: 18),
                )
              ],
            )),

        // Recently viewed
        Column(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.0),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Visto recientemente',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtNunitoSansSemiBold23,
                      ),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        children: [
                          Text('Ver más',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w300)),
                          Icon(Icons.chevron_right_outlined)
                        ],
                      ),
                    ),
                  ],
                )),
            Container(
              margin: EdgeInsets.symmetric(vertical: 14.0),
              height: 136.0,
              width: double.infinity,
              child: ListView(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SizedBox(width: 14.0),
                  ViewedPreview(
                    backgroundImage: AssetImage('assets/images/proto.png'),
                    progressValue: 0.25,
                    title: 'Título',
                  ),
                  ViewedPreview(
                    backgroundImage: AssetImage('assets/images/proto.png'),
                    progressValue: 0.25,
                    title: 'Título',
                  ),
                  ViewedPreview(
                    backgroundImage: AssetImage('assets/images/proto.png'),
                    progressValue: 0.25,
                    title: 'Título',
                  ),
                  ViewedPreview(
                    backgroundImage: AssetImage('assets/images/proto.png'),
                    progressValue: 0.25,
                    title: 'Título',
                  ),
                  ViewedPreview(
                    backgroundImage: AssetImage('assets/images/proto.png'),
                    progressValue: 0.25,
                    title: 'Título',
                  ),
                  ViewedPreview(
                    backgroundImage: AssetImage('assets/images/proto.png'),
                    progressValue: 0.25,
                    title: 'Título',
                  ),
                  ViewedPreview(
                    backgroundImage: AssetImage('assets/images/proto.png'),
                    progressValue: 0.25,
                    title: 'Título',
                  ),
                  SizedBox(width: 6),
                ],
              ),
            ),
          ],
        ),

        // Daily activities
        Column(
          children: [
            Padding(
                padding: EdgeInsets.only(left: 14.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Actividades diarias',
                      style: TextStyle(fontSize: 18)),
                )),
            SizedBox(height: 14),
            Padding(
              padding: EdgeInsets.only(left: 14.0, right: 14.0, bottom: 14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ExpandedButton(icon: ImageConstant.imgButtonalerts, label: 'Lecturas'),
                  SizedBox(width: 14.0),
                  ExpandedButton(icon: ImageConstant.imgVolume, label: 'Oraciones'),
                  SizedBox(width: 14.0),
                  ExpandedButton(icon: ImageConstant.imgVolumeIndigo900, label: 'Blog')
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

class ViewedPreview extends StatelessWidget {
  final ImageProvider<Object> backgroundImage;
  final String title;
  final double progressValue;

  const ViewedPreview(
      {super.key,
      required this.backgroundImage,
      this.title = 'No Title',
      this.progressValue = 0.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      margin: EdgeInsets.only(right: 8),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(14))),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  image: DecorationImage(
                      opacity: 0.52,
                      image: AssetImage('assets/images/proto.png'),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 14.0),
              child: Column(
                children: [
                  Expanded(
                    child: Text(''),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Título',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                  SizedBox(height: 8.0),
                  LinearProgressIndicator(
                    backgroundColor: Colors.white54,
                    value: 0.25,
                    color: Colors.white,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
