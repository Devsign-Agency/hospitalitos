import 'package:flutter/material.dart';
import 'package:mobile_app/core/app_export.dart';

class CustomStepper extends StatelessWidget {
  final int step;
  final int range;

  const CustomStepper({
    required this.step,
    required this.range,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: getMargin(top: 60),
      height: getVerticalSize(40),
      width: getHorizontalSize(296),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate((2 * range) - 1, (index) {
            return index % 2 == 0
                ? _Step(step: (index ~/ 2) + 1, currentStep: step)
                : _Separator(isActive: index < (step - 1) * 2);
          })),
    );
  }
}

class _Separator extends StatelessWidget {
  final bool isActive;

  const _Separator({
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            height: 7,
            color:
                isActive ? ColorConstant.amber300 : ColorConstant.amber30050));
  }
}

class _Step extends StatelessWidget {
  final int step;
  final int currentStep;

  const _Step({required this.step, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: currentStep == step ? 40 : 40,
      height: currentStep == step ? 40 : 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: currentStep >= step
            ? ColorConstant.amber300
            : ColorConstant.amber30050,
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Text('$step',
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppStyle.txtNunitoSansSemiBold20),
    );
  }
}
