import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
    final String params = ModalRoute.of(context)?.settings.arguments as String;

    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          CustomAppBar(
            isExpanded: _isExpanded,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            ...List.generate(3, (int index) {
              return Padding(
                  padding: getPadding(all: 16),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    style: AppStyle.txtNunitoSansRegular18Black900,
                  ));
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
