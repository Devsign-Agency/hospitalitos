import 'package:flutter/material.dart';

import '../../../../core/app_export.dart';
import '../../../../widgets/widgets.dart';

class HelpScreen extends StatelessWidget {
  static const String route = 'profile-help';

  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(
        body: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            // AppBar
            _CustomAppBar(),

            SizedBox(height: 24),
            // Menu
            _CardMenuQuestion(),

            SizedBox(height: 24),
          ]),
        ),
      ),
    );
  }
}

class _CardMenuQuestion extends StatelessWidget {
  const _CardMenuQuestion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> questions = List<Map<String, dynamic>>.generate(
        5,
        (index) => ({
              'id': '$index',
              'title': 'Pregunta $index',
              'description':
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              'isSelected': false,
            }));

    final boxShadow = [
      BoxShadow(
        color: Color.fromRGBO(24, 39, 75, 0.08),
        offset: const Offset(0.0, 12.0),
        blurRadius: 42.0,
        spreadRadius: -4.0,
      ), //BoxSha
      BoxShadow(
        color: Color.fromRGBO(24, 39, 75, 0.08),
        offset: const Offset(0.0, 8.0),
        blurRadius: 18.0,
        spreadRadius: -6.0,
      ), //BoxShadow
    ];
    return Container(
        margin: getMargin(left: 16, right: 16),
        width: double.infinity,
        decoration: BoxDecoration(
            color: ColorConstant.whiteA700,
            borderRadius: BorderRadius.circular(12),
            boxShadow: boxShadow),
        child: _ListQuestion(questions: questions));
  }
}

class _ListQuestion extends StatefulWidget {
  final List<Map<String, dynamic>> questions;
  const _ListQuestion({
    super.key,
    required this.questions,
  });

  @override
  State<_ListQuestion> createState() => _ListQuestionState();
}

class _ListQuestionState extends State<_ListQuestion> {
  int selectedIndex = 1000;

  void _changeSelected(Map question) {
    // selectedIndex = index;
    question['isSelected'] = !question['isSelected'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (_, int index) {
        final Map<String, dynamic> question = widget.questions[index];
        return Container(
          padding: getPadding(left: 16, right: 16, top: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  '${question['title']}',
                  style: AppStyle.txtNunitoSansSemiBold20Black900,
                ),
                CustomImageView(
                  color: ColorConstant.whiteA700,
                  svgPath: !question['isSelected']
                      ? ImageConstant.imgArrowright
                      : ImageConstant.imgArrowdownGray900,
                  onTap: () => _changeSelected(question),
                )
              ]),
              if (question['isSelected'])
                Text(
                  '${question['description']}',
                  style: AppStyle.txtNunitoSansRegular14Black900,
                )
            ],
          ),
        );
      },
      separatorBuilder: (_, __) => Container(
        width: double.infinity,
        height: 1,
        margin: getMargin(left: 16, right: 16),
        color: ColorConstant.gray400,
      ),
      itemCount: widget.questions.length,
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
          left: 14.0, right: 14.0, top: 8.0, bottom: 24.0),
      child: Row(
        children: [
          CustomIconButton(
            height: getSize(48),
            width: getSize(48),
            variant: IconButtonVariant.NoFill,
            child: CustomImageView(
                color: ColorConstant.whiteA700,
                svgPath: ImageConstant.imgArrowleftGray800),
            onTap: () => Navigator.of(context).pop(),
          ),
          Expanded(
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Ayuda', style: AppStyle.txtNunitoSansSemiBold26)),
          ),
        ],
      ),
    );
  }
}
