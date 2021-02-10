import 'package:flutter/material.dart';
import 'dart:math';

class CircularProgressPaint extends CustomPainter {
  double currentProgress;
  CircularProgressPaint(this.currentProgress);

  @override
  void paint(Canvas canvas, Size size) {
    //Outer Circle
    Paint outerCircle = Paint()
      ..strokeWidth = 7
      ..color = Colors.grey.shade400
      ..style = PaintingStyle.stroke;

    //complete arc
    Paint completeArc = Paint()
      ..strokeWidth = 7
      ..style = PaintingStyle.stroke
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width/2, size.height/2);
    double radius = min(size.width/2, size.height/2) - 7;

    canvas.drawCircle(center, radius, outerCircle);

    double angle = 2 * pi * (currentProgress/8);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi/2, angle, false, completeArc);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
