import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class GradientMaskContainer extends StatelessWidget {
  final Widget? child;
  final Gradient gradient;
  final BorderRadius? borderRadius;

  const GradientMaskContainer({
    super.key,
    required this.gradient,
    this.borderRadius,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _GradientMaskContainerPainter(
        containerContext: context,
        scrollableState: Scrollable.of(context),
        gradient: gradient,
        borderRadius: borderRadius,
        textDirection: Directionality.maybeOf(context),
      ),
      child: child,
    );
  }
}

class _GradientMaskContainerPainter extends CustomPainter {
  final BuildContext containerContext;
  final ScrollableState scrollableState;
  final Gradient gradient;
  final BorderRadius? borderRadius;
  final TextDirection? textDirection;

  _GradientMaskContainerPainter({
    required this.containerContext,
    required this.scrollableState,
    required this.gradient,
    required this.borderRadius,
    required this.textDirection,
  }) : super(repaint: scrollableState.position);

  @override
  bool shouldRepaint(_GradientMaskContainerPainter oldDelegate) {
    return oldDelegate.scrollableState != scrollableState ||
        oldDelegate.gradient != gradient ||
        oldDelegate.containerContext != containerContext;
  }

  ui.Gradient _createGradient(
    Rect scrollableRect,
    Offset origin,
  ) {
    late final transform = Matrix4.translationValues(-origin.dx, -origin.dy, 0.0).storage;
    final gradient = this.gradient;
    final Gradient(
      :colors,
      :stops,
    ) = gradient;

    List<double> implyStops() {
      if (stops != null) {
        return stops;
      }

      final diff = 1.0 / (colors.length - 1);
      return List.generate(
        colors.length,
        (index) => index * diff,
        growable: false,
      );
    }

    switch (gradient) {
      case LinearGradient(
          :final begin,
          :final end,
          :final tileMode,
        ):
        return ui.Gradient.linear(
          begin.resolve(textDirection).withinRect(scrollableRect),
          end.resolve(textDirection).withinRect(scrollableRect),
          colors,
          implyStops(),
          tileMode,
          transform,
        );
      case RadialGradient(
          :final center,
          :final radius,
          :final focal,
          :final focalRadius,
          :final tileMode,
        ):
        return ui.Gradient.radial(
          center.resolve(textDirection).withinRect(scrollableRect),
          radius * scrollableRect.shortestSide,
          colors,
          implyStops(),
          tileMode,
          transform,
          focal?.resolve(textDirection).withinRect(scrollableRect),
          focalRadius * scrollableRect.shortestSide,
        );

      case SweepGradient(
          :final center,
          :final startAngle,
          :final endAngle,
          :final tileMode,
        ):
        return ui.Gradient.sweep(
          center.resolve(textDirection).withinRect(scrollableRect),
          colors,
          implyStops(),
          tileMode,
          startAngle,
          endAngle,
          transform,
        );
    }

    throw UnimplementedError('Unknown gradient type: $gradient');
  }

  @override
  void paint(Canvas canvas, Size size) {
    final scrollableBox = scrollableState.context.findRenderObject() as RenderBox;
    final containerBox = containerContext.findRenderObject() as RenderBox;
    final origin = containerBox.localToGlobal(
      Offset.zero,
      ancestor: scrollableBox,
    );

    final scrollableRect = Offset.zero & scrollableBox.size;

    final boxRect = Offset.zero & size;

    final paint = Paint() //
      ..shader = _createGradient(scrollableRect, origin);

    if (borderRadius != null) {
      canvas.drawRRect(borderRadius!.toRRect(boxRect), paint);
    } else {
      canvas.drawRect(boxRect, paint);
    }
  }
}
