
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget? child;

  const Background({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          color: Theme.of(context).colorScheme.background
        ),
        ClipPath(
          clipper: _CurveClipperTop(),
          child: Container(
            color: Theme.of(context).colorScheme.primary,
            height: 200.0,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: 200,
          child: ClipPath(
            clipper: _CurveClipperBottom(),
            child: Container(
              color: Theme.of(context).colorScheme.secondary,
              height: 200.0,
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: child,
        ),
      ],
    );
  }
}

class _CurveClipperBottom extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double width = size.width / 3;

    Path path = Path()
      ..cubicTo(width / 8, size.height / 16, width / 4, size.height / 8,
          width / 2, size.height)
      ..lineTo(0, size.height)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _CurveClipperTop extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double width = 3 * size.width / 8;
    final Offset offset = Offset(size.width - width, 0);

    Path path = Path()
      ..moveTo(offset.dx, 0)
      ..cubicTo(
          offset.dx + (width / 4),
          3 * size.height / 4,
          offset.dx + (3 * width / 4),
          size.height / 4,
          offset.dx + width,
          size.height)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
