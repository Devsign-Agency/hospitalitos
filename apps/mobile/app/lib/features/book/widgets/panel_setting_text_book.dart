import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/app_export.dart';
import '../../../shared/providers/providers.dart';
import '../../../themes/themes.dart';
import '../../../widgets/widgets.dart';

class PanelSettingTextBook extends StatefulWidget {
  final Function onSetFontSize;
  final Function onSetPitch;
  final Function onSetRate;
  final Function onSetMargin;
  final Function onSetLineHeight;
  final double fontSize;
  final double margin;
  final double lineHeight;
  final CircleButtonModel selectedCircleButton;
  final Function onSetColor;

  const PanelSettingTextBook({
    super.key,
    required this.onSetFontSize,
    required this.onSetPitch,
    required this.onSetRate,
    required this.fontSize,
    required this.lineHeight,
    required this.onSetColor,
    required this.onSetMargin,
    required this.margin,
    required this.onSetLineHeight,
    required this.selectedCircleButton,
  });

  @override
  State<PanelSettingTextBook> createState() => _PanelSettingTextBookState();
}

class _PanelSettingTextBookState extends State<PanelSettingTextBook> {
  CircleButtonType selectedCircleButtonType = CircleButtonType.black;

  @override
  initState() {
    super.initState();
    selectedCircleButtonType = widget.selectedCircleButton.name;
  }

  void onTapped(CircleButtonType type) {}

  setColor(CircleButtonModel newCircleButton) {
    setState(() {
      selectedCircleButtonType = newCircleButton.name;
      widget.onSetColor(newCircleButton);
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkMode = themeProvider.currentTheme == DarkTheme.theme;
    return Padding(
      padding: getPadding(left: 40, right: 40, bottom: 20),
      child: Wrap(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: getMargin(top: 16, bottom: 28),
              width: 32,
              height: 4,
              color: ColorConstant.indigo900,
            ),
          ),
          _buildSliders(isDarkMode),
        ],
      ),
    );
  }

  Widget _buildSliders(bool isDarkMode) {
    TextStyle labelStyle = isDarkMode
        ? AppStyle.txtNunitoSansSemiBold16WhiteA700
        : AppStyle.txtNunitoSansSemiBold16Indigo900;
    Color iconColor =
        isDarkMode ? ColorConstant.whiteA700 : ColorConstant.indigo90075;
    Color iconColorTrailing =
        isDarkMode ? ColorConstant.whiteA700 : ColorConstant.black900;

    List<CircleButtonModel> circleButtonList = [
      CircleButtonModel(CircleButtonType.white, Colors.white),
      CircleButtonModel(CircleButtonType.brown, Colors.brown),
      CircleButtonModel(CircleButtonType.grey, Colors.grey),
      CircleButtonModel(CircleButtonType.black, Colors.black),
    ];

    return SingleChildScrollView(
      child: ListView(shrinkWrap: true, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Colors section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // spacing: 8.0,
              children: [
                ...circleButtonList.map((circleButton) => _CircleButton(
                    item: circleButton,
                    selected: circleButton.name == selectedCircleButtonType,
                    onTapped: setColor))
              ],
            ),
            SizedBox(height: 14),

            // Bar division
            Container(
              width: double.infinity,
              height: 0.5,
              decoration: BoxDecoration(
                  color: isDarkMode
                      ? ColorConstant.whiteA700.withOpacity(0.4)
                      : ColorConstant.indigo900.withOpacity(0.4)),
            ),
            SizedBox(height: 14),

            // Sizes section
            CustomSlider(
                onChange: widget.onSetFontSize,
                indicator: 'Tamaño',
                label: 'Texto',
                labelStyle: labelStyle.copyWith(fontSize: 14),
                iconColor: iconColor,
                iconTrailing: ImageConstant.imgMathCase,
                iconTrailingColor: iconColorTrailing,
                min: 1.0,
                max: 9.0,
                divisions: 8,
                value: widget.fontSize),
            CustomSlider(
                onChange: widget.onSetMargin,
                indicator: 'Tamaño',
                label: 'Margen',
                labelStyle: labelStyle.copyWith(fontSize: 14),
                iconColor: iconColor,
                iconTrailing: ImageConstant.imgWidthFit,
                iconTrailingColor: iconColorTrailing,
                min: 1.0,
                max: 5.0,
                divisions: 4,
                value: widget.margin),
            CustomSlider(
                onChange: widget.onSetLineHeight,
                indicator: 'Tamaño',
                label: 'Interlineado',
                labelStyle: labelStyle.copyWith(fontSize: 14),
                iconColor: iconColor,
                iconTrailing: ImageConstant.imgHeadline,
                iconTrailingColor: iconColorTrailing,
                min: 1.0,
                max: 5.0,
                divisions: 4,
                value: widget.lineHeight),
          ],
        ),
      ]),
    );
  }
}

class _CircleButton extends StatelessWidget {
  final bool selected;
  final Function onTapped;
  final CircleButtonModel item;
  const _CircleButton(
      {super.key,
      this.selected = false,
      required this.onTapped,
      required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 54,
        height: 54,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0),
            border: selected
                ? Border.all(
                    width: 4.0, color: ColorConstant.black900.withOpacity(0.6))
                : null),
        child: Center(
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: item.color, borderRadius: BorderRadius.circular(20.0)),
            child: Text(''),
          ),
        ),
      ),
      onTap: () => onTapped(item),
    );
  }
}
