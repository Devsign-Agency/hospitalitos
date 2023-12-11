import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/widgets.dart';

class BottomChatBar extends StatelessWidget {
  const BottomChatBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstant.gray50,
      height: 100,
      width: double.infinity,
      padding: getPadding(top: 16, left: 16, right: 16, bottom: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomImageView(
            svgPath: ImageConstant.imgFaceEmogi,
            width: getSize(24),
            height: getSize(24),
            color: ColorConstant.indigo900,
          ),
          SizedBox(width: 14),
          Expanded(
            child: CustomTextFormField(
                width: 250,
                shape: TextFormFieldShape.RoundedBorder12,
                variant: TextFormFieldVariant.None,
                textInputType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                isObscureText: false,
                hintText: 'Escribir...',
                prefixConstraints:
                    BoxConstraints(maxHeight: getVerticalSize(56))),
          ),
          SizedBox(width: 14),
          CustomIconButton(
            height: 48,
            width: 48,
            shape: IconButtonShape.CircleBorder24,
            variant: IconButtonVariant.OutlinePurple50,
            child: CustomImageView(
              color: ColorConstant.indigo900,
              svgPath: ImageConstant.imgSend,
            ),
            onTap: () => Navigator.of(context).pushNamed('profile'),
          ),
        ],
      ),
    );
  }
}
