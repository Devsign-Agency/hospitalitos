import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_app/shared/shared.dart';
import 'package:provider/provider.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../../core/app_export.dart';
import '../../../../widgets/widgets.dart';

class LiturgiaCalendarScreen extends StatefulWidget {
  static const String route = 'calendar-route';
  const LiturgiaCalendarScreen({Key? key}) : super(key: key);

  @override
  State<LiturgiaCalendarScreen> createState() => _LiturgiaCalendarScreenState();
}

class _LiturgiaCalendarScreenState extends State<LiturgiaCalendarScreen> {
   dynamic posts;

  @override
  void initState() {

 rootBundle
        .loadString('assets/liturgia/sync/2024/mar/12/index.html')
        .then((String contents) {
         posts = contents;
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LiturgyService liturgyService = Provider.of<LiturgyService>(context);
    print('$posts');
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Liturgiaaaa',
        backgroundColor: ColorConstant.gray50,
      ),
      body: SingleChildScrollView(child: Html(data: posts)),
    );
  }

  loadAsset(data) async {
    await rootBundle
        .loadString('assets/liturgia/sync/2024/mar/12/index.html')
        .then((String contents) {
      data = contents;
      setState(() {});
    });
  }
}
