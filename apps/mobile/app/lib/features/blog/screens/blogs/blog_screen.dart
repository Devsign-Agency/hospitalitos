import 'package:flutter/material.dart';

import '../../../../core/app_export.dart';
import '../../../../widgets/widgets.dart';
import '../../widgets/widgets.dart';

class BlogScreen extends StatelessWidget {
  static const String route = 'blog';

  const BlogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> articles = ['1', '2', '3', '4'];

    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [_ArticlesHeader(), _ArticlesList(articles: articles)],
      ),
    ));
  }
}

class _ArticlesList extends StatelessWidget {
  final List<String> articles;

  const _ArticlesList({
    super.key,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: 5,
            separatorBuilder: (_, __) => SizedBox(height: 20),
            itemBuilder: (_, int index) {
              return ArticleCard();
            }),
      ),
    );
  }
}

class _ArticlesHeader extends StatelessWidget {
  const _ArticlesHeader({
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
            height: 48,
            width: 48,
            variant: IconButtonVariant.NoFill,
            child: CustomImageView(
              color: ColorConstant.whiteA700,
              svgPath: ImageConstant.imgArrowleftGray800,
            ),
          ),
          Expanded(
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Blog', style: AppStyle.txtNunitoSansSemiBold26)),
          ),
          CustomIconButton(
            height: 48,
            width: 48,
            variant: IconButtonVariant.FillGray300,
            child: CustomImageView(
              color: ColorConstant.gray800,
              svgPath: ImageConstant.imgSearch,
            ),
          ),
        ],
      ),
    );
  }
}
