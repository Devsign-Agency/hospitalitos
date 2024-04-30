import 'package:flutter/material.dart';
import 'package:mobile_app/core/app_export.dart';
import 'package:mobile_app/widgets/widgets.dart';

class DetailLiturgyScreen extends StatelessWidget {
  static const String route = 'detail-liturgy';
  const DetailLiturgyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic params = ModalRoute.of(context)?.settings.arguments;
    String title = params['title'];
    String desc = params['description'];

    print('$title');
    return Scaffold(
      appBar: CustomAppBar(title: title),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                desc,
                style: AppStyle.txtNunitoSansRegular16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
