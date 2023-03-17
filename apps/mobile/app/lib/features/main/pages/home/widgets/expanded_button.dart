import 'package:flutter/material.dart';
import 'package:mobile_app/core/constants/color.constant.dart';
import 'package:mobile_app/widgets/widgets.dart';

class ExpandedButton extends StatelessWidget {
  final String icon;
  final String label;

  const ExpandedButton({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
              margin:
                  const EdgeInsets.only(bottom: 10.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 25.0),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: ColorConstant.whiteA700,
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
              child: CustomIconButton(
                  height: 48,
                  width: 48,
                  variant: IconButtonVariant.NoFill,
                  shape: IconButtonShape.CircleBorder24,
                  alignment: Alignment.center,
                  child: CustomImageView(
                    svgPath: icon,
                  ))),
          Text(
            label,
            style: TextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }
}
