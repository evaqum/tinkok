import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class GradientActionButton extends StatelessWidget {
  final VoidCallback? onTap;
  final List<Color> colors;
  final Widget child;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;

  const GradientActionButton({
    this.onTap,
    required this.colors,
    required this.child,
    this.height,
    this.width,
    this.borderRadius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final child = SizedBox(
      height: height,
      width: width,
      child: _Background(
        colors: colors,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: this.child,
          ),
        ),
      ),
    );

    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius!,
        child: child,
      );
    }

    return child;
  }
}

class _Background extends StatelessWidget {
  final Widget child;
  final List<Color> colors;

  const _Background({
    required this.child,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BackgroundPainter(
        context: context,
        colors: colors,
        scrollableState: Scrollable.of(context),
      ),
      child: child,
    );
  }
}

class _BackgroundPainter extends CustomPainter {
  final List<Color> colors;
  final BuildContext context;
  final ScrollableState scrollableState;

  _BackgroundPainter({
    required this.colors,
    required this.context,
    required this.scrollableState,
  }) : super(repaint: scrollableState.position);

  @override
  bool shouldRepaint(_BackgroundPainter oldDelegate) {
    return oldDelegate.colors != colors || oldDelegate.context != context || oldDelegate.scrollableState != scrollableState;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final scrollableBox = scrollableState.context.findRenderObject() as RenderBox;
    final scrollableRect = Offset.zero & scrollableBox.size;
    final buttonBox = context.findRenderObject() as RenderBox;

    final origin = buttonBox.localToGlobal(Offset.zero, ancestor: scrollableBox);

    final paint = Paint()
      ..shader = ui.Gradient.radial(
        scrollableRect.topCenter,
        scrollableRect.height / 2,
        colors,
        [
          for (int i = 0; i < colors.length; i++) i / (colors.length - 1),
        ],
        TileMode.clamp,
        Matrix4.translationValues(-origin.dx, -origin.dy, 0.0).storage,
      );

    canvas.drawRect(Offset.zero & size, paint);
  }
}
