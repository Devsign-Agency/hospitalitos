import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  final Function onSetVolumen;
  final IconData icon;
  final String indicator;
  final String label;
  final TextStyle labelStyle;
  final Color iconColor;
  final double min;
  final double max;
  final double value;

  CustomSlider(
      {super.key,
      required this.onSetVolumen,
      required this.icon,
      required this.indicator,
      required this.label,
      required this.labelStyle,
      required this.iconColor,
      required this.min,
      required this.max,
      required this.value});

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
    print('volumen up: ${widget.value}');
    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            widget.icon,
            size: 34,
            color: widget.iconColor,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Text(widget.label, style: widget.labelStyle),
                ),
                Slider(
                  value: valueSlider,
                  onChanged: (newVolume) {
                    // volume = newVolume;
                    valueSlider = newVolume;
                    widget.onSetVolumen(newVolume);
                    setState(() {});
                    // widget.onSetVolumen(newVolume);
                  },
                  min: 0.0,
                  max: 1.0,
                  divisions: 10,
                  label: widget.indicator,
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
