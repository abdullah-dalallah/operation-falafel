import 'dart:async';
import 'dart:ui';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class CustomSliderThumbCircle extends SliderComponentShape {
  final double thumbRadius;
  final int min;
  final int max;
  final ImageProvider imageProvider;

  const CustomSliderThumbCircle({
    required this.thumbRadius,
    this.min = 0,
    this.max = 10,
    required this.imageProvider,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  Future<void> paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double value,
        required double textScaleFactor,
        required Size sizeWithOverflow,
      }) async {
    final Canvas canvas = context.canvas;

    final paint = Paint()
      ..color = Colors.white //Thumb Background Color
      ..style = PaintingStyle.fill;

    TextSpan span = new TextSpan(
      style: new TextStyle(
        fontSize: thumbRadius * .8,
        fontWeight: FontWeight.w700,
        color: sliderTheme.thumbColor, //Text Color of Value on Thumb
      ),
      text: formatNumberWithK(getValue(value)),
    );

    TextPainter tp = new TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    tp.layout();
    Offset textCenter =
    Offset(center.dx - (tp.width / 2), center.dy - (tp.height / 2));



    // final ui.Image image = await imageProviderToImage(imageProvider);
    // final imageWidth = thumbRadius * 2;
    // final imageHeight = thumbRadius * 2;
    // final imageOffset = center - Offset(thumbRadius, thumbRadius);
    // canvas.drawImageRect(
    //   image,
    //   Rect.fromLTWH(0, 0, imageWidth, imageHeight),
    //   Rect.fromPoints(imageOffset, Offset(imageOffset.dx + imageWidth, imageOffset.dy + imageHeight)),
    //   Paint(),
    // );

    canvas.drawCircle(center, thumbRadius * .9, paint);
    tp.paint(canvas, textCenter);
  }

  int getValue(double value) {
    return (min+(max-min)*value).round();
  }





  String formatNumberWithK(int number) {
    if (number >= 1000) {
      double result = number / 1000;
      return result.toStringAsFixed(1) + "K";
    } else {
      return number.toString();
    }
  }
}
