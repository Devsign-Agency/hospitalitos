import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_export.dart';
import '../../../../shared/shared.dart';
import '../../../../widgets/custom_text_form_field.dart';
import '../../../../widgets/widgets.dart';
import '../../../security/widgets/widgets.dart';

class InterestScreen extends StatefulWidget {
  static const String route = 'interests';
  const InterestScreen({Key? key}) : super(key: key);

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  late List<Category> categories = [];
  int maxQty = 0;

  @override
  initState() {
    _findCategories();
    super.initState();
  }

  @override
  void dispose() {
    categories.clear();
    super.dispose();
  }

  _findCategories() async {
    final categoryService =
        Provider.of<CategoryService>(context, listen: false);
    categories = await categoryService.getAll();
    print(categories);
    maxQty = min(3, categories.length);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            // AppBar
            _CustomAppBar(),

            // Categories selected
            _Preferences(totalPreferences: 2, maxQty: categories.length),
            // Search
            _BarInputSearch(),
            // list of categories
            _ListCategory(categories: categories),
          ]),
        ),
      ),
    );
  }
}

class _BarInputSearch extends StatelessWidget {
  const _BarInputSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(left: 16, right: 16),
      child: CustomTextFormField(
          margin: getMargin(top: 16),
          shape: TextFormFieldShape.RoundedBorder12,
          variant: TextFormFieldVariant.None,
          textInputType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          isObscureText: false,
          hintText: 'Buscar',
          suffix: Container(
              margin: getMargin(left: 12, top: 16, right: 12, bottom: 16),
              child: CustomImageView(
                  svgPath: ImageConstant.imgSearch,
                  color: ColorConstant.gray600)),
          prefixConstraints: BoxConstraints(maxHeight: getVerticalSize(56))),
    );
  }
}

class _ListCategory extends StatelessWidget {
  final List<Category> categories;

  const _ListCategory({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: getPadding(top: 32, left: 33, right: 33),
        child: Wrap(
            runSpacing: getVerticalSize(5),
            spacing: getHorizontalSize(5),
            children: List<Widget>.generate(categories.length, (index) {
              final category = categories[index];
              return ChipviewinputchipItemWidget(
                  text: category.name,
                  hasDeleteIcon: false,
                  onSelected: (value) {},
                  selected: false);
            })));
  }
}

class _Preferences extends StatelessWidget {
  final int maxQty;
  final int totalPreferences;

  const _Preferences({
    super.key,
    required this.maxQty,
    required this.totalPreferences,
  });

  void onDelete() {
    print('Chip Delete!');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: getPadding(top: 32, left: 10, right: 10),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Guardados', style: AppStyle.txtNunitoSansSemiBold23),
            Text('$totalPreferences/$maxQty',
                style: AppStyle.txtNunitoSansSemiBold13Gray800)
          ]),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              ...List<Widget>.generate(
                  5,
                  (index) => Padding(
                        padding: getPadding(right: 8),
                        child: ChipviewinputchipItemWidget(
                            text: 'Doctrinas',
                            hasDeleteIcon: true,
                            onDeleted: (value) => onDelete(),
                            onSelected: (value) {},
                            selected: true),
                      ))
            ]),
          )
        ]));
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
                child:
                    Text('Intereses', style: AppStyle.txtNunitoSansSemiBold26)),
          ),
        ],
      ),
    );
  }
}
