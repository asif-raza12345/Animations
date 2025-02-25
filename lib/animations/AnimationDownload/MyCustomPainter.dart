import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ArcPainter extends CustomPainter {
  final double startAngle;
  final double  endAngle;
  ArcPainter({
    required this.startAngle,required this.endAngle
});

  @override
  void paint(Canvas canvas, Size size) {
    final Size(:width, :height) = size;

    var center = Offset.zero;
    Paint paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill
      ..strokeWidth = 10;

    final rect = Rect.fromCircle(center: center, radius: 30);
    canvas.drawArc(rect, startAngle, endAngle, true, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)  => true;// Return true if you want to trigger a repaint
  }

