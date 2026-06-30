import 'package:flutter/material.dart';

class GradientBorderPainter extends CustomPainter {
  late Rect rect;
  late RRect rrect;
  final List<Color> colorList;
  final double rotationAngle;
  final double blurRadius;

  GradientBorderPainter({
    required this.colorList,
    required this.rotationAngle,
    required this.blurRadius,
  });
  @override
  void paint(Canvas canvas, Size size) {
    var Size(:width, :height) = size;
    rect = Rect.fromLTWH(0, 0, width, height);
    rrect = RRect.fromRectAndRadius(rect, Radius.circular(20));

    Paint borderGlow = Paint()
      ..style = PaintingStyle.stroke
      ..shader = LinearGradient(
        transform: GradientRotation(rotationAngle),
        colors: colorList,
      ).createShader(rect)
      ..strokeWidth = width * 0.009
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurRadius);
    canvas.drawRRect(rrect, borderGlow);

    Paint borderPainter = Paint()
      ..style = PaintingStyle.stroke
      ..shader = LinearGradient(
        transform: GradientRotation(rotationAngle),
        colors: colorList,
      ).createShader(rect)
      ..strokeWidth = width * 0.002;
    canvas.drawRRect(rrect, borderPainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
