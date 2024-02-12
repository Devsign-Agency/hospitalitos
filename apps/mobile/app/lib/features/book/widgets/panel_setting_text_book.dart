import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/app_export.dart';
import '../../../shared/providers/providers.dart';
import '../../../themes/themes.dart';
import '../../../widgets/widgets.dart';

class PanelSettingTextBook extends StatelessWidget {
  final Function onSetVolumen;
  final Function onSetPitch;
  final Function onSetRate;
  final double volume;
  final double rate;

  const PanelSettingTextBook({
    super.key,
    required this.onSetVolumen,
    required this.onSetPitch,
    required this.onSetRate,
    required this.volume,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkMode = themeProvider.currentTheme == DarkTheme.theme;
    return Padding(
      padding: getPadding(left: 16, right: 16, bottom: 20),
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
          _buildSliders(isDarkMode, volume, rate),
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
    return Column(
      children: [
        CustomSlider(
            onSetVolumen: onSetVolumen,
            icon: Icons.volume_up_rounded,
            indicator: 'Tamaño de texto',
            label: 'Tamaño de texto',
            labelStyle: labelStyle,
            iconColor: iconColor,
            min: 0,
            max: 3,
            divisions: 3,
            value: volume),
        CustomSlider(
            onSetVolumen: onSetRate,
            icon: Icons.flash_on_rounded,
            indicator: 'Velocidad',
            label: 'Velocidad',
            labelStyle: labelStyle,
            iconColor: iconColor,
            min: 0,
            max: 3,
            divisions: 3,
            value: rate),
      ],
    );
  }
}
