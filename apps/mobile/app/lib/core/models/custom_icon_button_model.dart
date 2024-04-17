import 'package:mobile_app/widgets/widgets.dart';

class CustomIconButtonModel {
  const CustomIconButtonModel(this.color, this.variant, this.action,
      {required this.icon});
  final String icon;
  final String? color;
  final IconButtonVariant? variant;
  final Function action;
}
