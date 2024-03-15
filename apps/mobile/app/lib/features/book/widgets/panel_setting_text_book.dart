import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:mobile_app/features/book/pages/chapter.page.dart';
import 'package:provider/provider.dart';

import '../../../core/app_export.dart';
import '../../../shared/providers/providers.dart';
import '../../../themes/themes.dart';
import '../../../widgets/widgets.dart';

class PanelSettingTextBook extends StatefulWidget {
  final Map<String, dynamic> initialValues;
  final void Function(dynamic) onChange;

  const PanelSettingTextBook({
    super.key,
    required this.onChange,
    required this.initialValues,
  });

  @override
  State<PanelSettingTextBook> createState() => _PanelSettingTextBookState();
}

class _PanelSettingTextBookState extends State<PanelSettingTextBook> {
  CircleButtonType _selectedCircleButtonType = CircleButtonType.black;
  Map<dynamic, dynamic> _setting = {};
  final Map<dynamic, FontSize> fontSizes = {
    '1.0': FontSize.xSmall,
    '2.0': FontSize.xxSmall,
    '3.0': FontSize.smaller,
    '4.0': FontSize.small,
    '5.0': FontSize.medium,
    '6.0': FontSize.large,
    '7.0': FontSize.larger,
    '8.0': FontSize.xLarge,
    '9.0': FontSize.xxLarge,
  };

  Map<dynamic, double> marginValues = {
    '1.0': 14.0,
    '2.0': 18.0,
    '3.0': 24.0,
    '4.0': 28.0,
    '5.0': 32.0,
  };

  Map<dynamic, LineHeight> lineHeightValues = {
    '1.0': LineHeight.number(1.2),
    '2.0': LineHeight.number(1.4),
    '3.0': LineHeight.number(1.6),
    '4.0': LineHeight.number(1.8),
    '5.0': LineHeight.number(2.0),
  };

  @override
  initState() {
    super.initState();
    print(widget.initialValues);
    _setting = {
      'fontSize': fontSizes[widget.initialValues['fontSize'].toString()],
      'margin': marginValues[widget.initialValues['margin'].toString()],
      'lineHeight':
          lineHeightValues[widget.initialValues['lineHeight'].toString()],
    };
    _selectedCircleButtonType = CircleButtonType.black;
  }

  // setColor(CircleButtonModel newCircleButton) {
  //   setState(() {
  //     selectedCircleButtonType = newCircleButton.name;
  //     widget.onSetColor(newCircleButton);
  //   });
  // }

  setColor(CircleButtonModel newCircleButton) {
    setState(() {
      _setting['color'] = newCircleButton.color;
      widget.onChange(_setting);
      _selectedCircleButtonType = newCircleButton.name;
      // selectedCircleButton =
      //     CircleButtonModel(newCircleButton.name, newCircleButton.color);
    });
  }

  setFontSize(double newFontSize) async {
    setState(() {
      _setting['fontSize'] = fontSizes[newFontSize.toString()]!;
      widget.onChange(_setting);
    });
  }

  setMargin(double value) {
    setState(() {
      _setting['margin'] = marginValues[value.toString()]!;
      widget.onChange(_setting);
    });
  }

  setLineHeight(double value) {
    setState(() {
      _setting['lineHeight'] = lineHeightValues[value.toString()]!;
      widget.onChange(_setting);
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
                    selected: circleButton.name == _selectedCircleButtonType,
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
                onChange: setFontSize,
                indicator: 'Tamaño',
                label: 'Texto',
                labelStyle: labelStyle.copyWith(fontSize: 14),
                iconColor: iconColor,
                iconTrailing: ImageConstant.imgMathCase,
                iconTrailingColor: iconColorTrailing,
                min: 1.0,
                max: 9.0,
                divisions: 8,
                value: widget.initialValues['fontSize']),
            CustomSlider(
                onChange: setMargin,
                indicator: 'Tamaño',
                label: 'Margen',
                labelStyle: labelStyle.copyWith(fontSize: 14),
                iconColor: iconColor,
                iconTrailing: ImageConstant.imgWidthFit,
                iconTrailingColor: iconColorTrailing,
                min: 1.0,
                max: 5.0,
                divisions: 4,
                value: widget.initialValues['margin']),
            CustomSlider(
                onChange: setLineHeight,
                indicator: 'Tamaño',
                label: 'Interlineado',
                labelStyle: labelStyle.copyWith(fontSize: 14),
                iconColor: iconColor,
                iconTrailing: ImageConstant.imgHeadline,
                iconTrailingColor: iconColorTrailing,
                min: 1.0,
                max: 5.0,
                divisions: 4,
                value: widget.initialValues['lineHeight']),
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
