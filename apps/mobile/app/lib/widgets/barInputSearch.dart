import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/custom_text_form_field.dart';

import '../core/app_export.dart';
import 'widgets.dart';

class BarInputSearch extends StatelessWidget {
  final Function onChange;

  const BarInputSearch({
    super.key,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(left: 16, right: 16),
      child: CustomTextFormField(
          onChanged: (String value) {
            onChange(value);
          },
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
