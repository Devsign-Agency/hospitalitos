import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mobile_app/shared/providers/theme_provider.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../core/app_export.dart';
import '../themes/themes.dart';

class CustomSlider extends StatefulWidget {
  final Function onChange;
  final IconData? icon;
  final String? iconTrailing;
  final String indicator;
  final String label;
  final TextStyle labelStyle;
  final Color iconColor;
  final double min;
  final double max;
  final double value;
  final int? divisions;
  final Color? iconTrailingColor;

  CustomSlider(
      {super.key,
      required this.onChange,
      this.icon,
      required this.indicator,
      required this.label,
      required this.labelStyle,
      required this.iconColor,
      required this.min,
      required this.max,
      required this.value,
      this.divisions = 10,
      this.iconTrailing,
      this.iconTrailingColor = Colors.black});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double valueSlider = 0.0;

  @override
  void initState() {
    super.initState();
    valueSlider = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkMode = themeProvider.currentTheme == DarkTheme.theme;

    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text('data', style: TextStyle(fontSize: FontSize.),)
          if (widget.icon != null)
            Icon(
              widget.icon,
              size: 34,
              color: widget.iconColor,
            ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text('-',
                    //     style: TextStyle(
                    //         fontSize: 20.0,
                    //         fontWeight: FontWeight.bold,
                    //         color: Colors.black)),
                    Text(widget.label, style: widget.labelStyle),
                    // Text('+',
                    //     style: TextStyle(
                    //         fontSize: 20.0,
                    //         fontWeight: FontWeight.bold,
                    //         color: Colors.black)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text('-',
                    //     style: TextStyle(
                    //         fontSize: 20.0,
                    //         fontWeight: FontWeight.bold,
                    //         color: Colors.black)),
                    SizedBox(width: 10),
                    Expanded(
                      child: Slider(
                        value: valueSlider,
                        onChanged: (newVolume) {
                          // volume = newVolume;
                          valueSlider = newVolume;
                          widget.onChange(newVolume);
                          setState(() {});
                          // widget.onSetVolumen(newVolume);
                        },
                        min: widget.min,
                        max: widget.max,
                        divisions: widget.divisions,
                        label: widget.indicator,
                      ),
                    ),
                    SizedBox(width: 10),
                    // Text('Aa',
                    //     style: TextStyle(
                    //         fontSize: 20.0,
                    //         fontWeight: FontWeight.bold,
                    //         color: Colors.black)),
                    if (widget.iconTrailing != null)
                      CustomImageView(
                          width: 34,
                          height: 34,
                          svgPath: widget.iconTrailing,
                          color: widget.iconTrailingColor),
                    // Icon(Icons.notes_outlined)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
    ;
  }
}
