import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class LinearPainter extends CustomPainter {
  final Animation<Offset> line1;
  final Animation<Offset> line2;
  final Offset  linepoint1;
  final Offset  linepoint2;
  final Offset  commonline;


  LinearPainter (this.line1,  this.line2, this.linepoint1, this.linepoint2, this.commonline,);
  @override
  void paint(Canvas canvas, Size size) {
    final radious= 3.0;
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 5;

    if(line1.value != linepoint1) {
      canvas.drawCircle(linepoint1, radious , paint);
    }
    canvas.drawLine(linepoint1, line1.value, paint);
    if(line1.value != linepoint1) {
      canvas.drawCircle(commonline, radious, paint);
    }
    canvas.drawLine(commonline, line2.value, paint);
    if(line2.value != commonline) {
      canvas.drawCircle(line2.value, radious, paint);
    }

    // double radius = min(size.width / 2, size.height / 2);

    // Draw a circle
    // canvas.drawCircle(Offset(size.width / 2, size.height / 2), radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>true; // Return true if you want to trigger a repaint
  }
