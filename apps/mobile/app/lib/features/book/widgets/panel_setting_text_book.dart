import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

import '../../../core/app_export.dart';
import '../../../shared/providers/providers.dart';
import '../../../themes/themes.dart';
import '../../../widgets/widgets.dart';

class PanelSettingTextBook extends StatefulWidget {
  final Function onSetVolumen;
  final Function onSetPitch;
  final Function onSetRate;
  final double volume;
  final double rate;
  final CircleButtonType selectedColor;
  final Function onSetColor;

  const PanelSettingTextBook({
    super.key,
    required this.onSetVolumen,
    required this.onSetPitch,
    required this.onSetRate,
    required this.volume,
    required this.rate,
    this.selectedColor = CircleButtonType.black,
    required this.onSetColor,
  });

  @override
  State<PanelSettingTextBook> createState() => _PanelSettingTextBookState();
}

class _PanelSettingTextBookState extends State<PanelSettingTextBook> {
  CircleButtonType selectedCircleButtonType = CircleButtonType.black;

  @override
  initState() {
    super.initState();
    selectedCircleButtonType = widget.selectedColor;
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
      padding: getPadding(left: 18, right: 18, bottom: 20),
      child: Wrap(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: getMargin(top: 16, bottom: 28),
              width: 32,
              height: 4,
              color: ColorConstant.gray600,
            ),
          ),
          _buildSliders(isDarkMode, widget.volume, widget.rate),
        ],
      ),
    );
  }

  Widget _buildSliders(bool isDarkMode, double volume, double rate) {
    TextStyle labelStyle = isDarkMode
        ? AppStyle.txtNunitoSansSemiBold16WhiteA700
        : AppStyle.txtNunitoSansSemiBold16Indigo900;
    Color iconColor =
        isDarkMode ? ColorConstant.whiteA700 : ColorConstant.indigo90075;

    List<CircleButtonModel> circleButtonList = [
      CircleButtonModel(CircleButtonType.black, Colors.black),
      CircleButtonModel(CircleButtonType.red, Colors.red),
      CircleButtonModel(CircleButtonType.blue, Colors.blue),
      CircleButtonModel(CircleButtonType.yellow, Colors.yellow),
      CircleButtonModel(CircleButtonType.green, Colors.green),
      CircleButtonModel(CircleButtonType.purple, Colors.purple),
      CircleButtonModel(CircleButtonType.brown, Colors.brown),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // margin: getMargin(left: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Color',
                style: labelStyle,
              ),
              SizedBox(height: 14.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // spacing: 8.0,
                children: [
                  ...circleButtonList.map((circleButton) => _CircleButton(
                      item: circleButton,
                      selected: circleButton.name == selectedCircleButtonType,
                      onTapped: setColor))
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 20),
        CustomSlider(
            onSetVolumen: widget.onSetVolumen,
            indicator: 'Tamaño',
            label: 'Tamaño de fuente',
            labelStyle: labelStyle,
            iconColor: iconColor,
            min: 0,
            max: 3,
            divisions: 3,
            value: volume),
      ],
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
        width: 46,
        height: 46,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border:
                selected ? Border.all(width: 2.0, color: Colors.black) : null),
        child: Center(
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: item.color, borderRadius: BorderRadius.circular(10)),
            // border: selected
            //     ? Border.all(width: 4.0, color: Colors.white)
            //     : null),
            child: Text(''),
          ),
        ),
      ),
      onTap: () => onTapped(item),
    );
  }
}
