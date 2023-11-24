import 'package:flutter/material.dart';

class BorderedIcon extends StatelessWidget {
  final IconData icon;

  const BorderedIcon({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            border: Border.all(
                width: 2, color: Theme.of(context).colorScheme.tertiary)),
        child: Center(
          child: Icon(icon, size: 28, color: Theme.of(context).colorScheme.onTertiary),
        ),
      ),
    );
  }
}
