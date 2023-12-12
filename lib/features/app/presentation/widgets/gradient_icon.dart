import 'package:flutter/material.dart';

class GradientIcon extends StatelessWidget {
  final IconData icon;
  final Gradient gradient;
  final double? fill;
  final double? grade;
  final double? size;
  final double? opticalSize;
  final double? weight;
  final TextDirection? textDirection;

  const GradientIcon(
    this.icon, {
    required this.gradient,
    this.fill,
    this.grade,
    this.size,
    this.opticalSize,
    this.weight,
    this.textDirection,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return gradient.createShader(bounds);
      },
      child: Icon(
        icon,
        color: Colors.white,
        fill: fill,
        grade: grade,
        size: size,
        opticalSize: opticalSize,
        weight: weight,
        textDirection: textDirection,
      ),
    );
  }
}
