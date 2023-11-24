import 'package:flutter/widgets.dart';

import 'carousel_indicator.dart';

/// Base Painter class to draw indicator
abstract class BasePainter extends CustomPainter {
  final CarouselIndicator widget;
  final double page;
  final Paint _paint;

  BasePainter(this.widget, this.page, this._paint);

  /// This method will get body to class extending [BasePainter] and this method will draw the sliding indicator which slide over changing index.
  void draw(Canvas canvas, double space, double width, double height,
      double xOffset, double yOffset, double cornerRadius);

  @override
  void paint(Canvas canvas, Size size) {
    _paint.color = widget.color;
    double space = widget.space;
    double width = widget.width;
    double height = widget.height;
    double distance = width + space;
    double yOffset = 15;
    double xOffset = width / 2;
    for (int? i = 0, c = widget.count; i! < c!; ++i) {
      canvas.drawRRect(
          RRect.fromRectAndRadius(
              Rect.fromCenter(
                  center: Offset(xOffset + (i * distance), yOffset),
                  width: width,
                  height: height),
              Radius.circular(widget.cornerRadius)),
          _paint);
    }

    _paint.color = widget.activeColor;
    draw(canvas, space, width, height, xOffset, yOffset, widget.cornerRadius);
  }

  @override
  bool shouldRepaint(BasePainter oldDelegate) {
    return oldDelegate.page != page;
  }
}

/// This class we draw the indicator which slides.
class SlidePainter extends BasePainter {
  SlidePainter(CarouselIndicator widget, double page, Paint paint)
      : super(widget, page, paint);

  @override
  void draw(Canvas canvas, double space, double width, double height,
      double xOffset, double yOffset, double cornerRadius) {
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromCenter(
                center: Offset(xOffset + (page * (width + space)), yOffset),
                width: width,
                height: height),
            Radius.circular(cornerRadius)),
        _paint);
  }
}
