import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AnimatedFadeText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final TextDirection? direction;
  final Duration duration;

  const AnimatedFadeText(
    this.text, {
    this.style,
    this.direction,
    this.duration = const Duration(milliseconds: 120),
    super.key,
  });

  @override
  State<AnimatedFadeText> createState() => _AnimatedFadeTextState();
}

class _AnimatedFadeTextState extends State<AnimatedFadeText> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var effectiveStyle = widget.style;
    if (effectiveStyle == null || effectiveStyle.inherit) {
      effectiveStyle = DefaultTextStyle.of(context).style.merge(effectiveStyle);
    }

    return _AnimatedFadeText(
      text: widget.text,
      style: effectiveStyle,
      direction: widget.direction ?? Directionality.of(context),
      vsync: this,
      duration: widget.duration,
    );
  }
}

class _AnimatedFadeText extends LeafRenderObjectWidget {
  final String text;
  final TextStyle style;
  final TextDirection direction;
  final TickerProvider vsync;
  final Duration duration;

  const _AnimatedFadeText({
    required this.text,
    required this.style,
    required this.direction,
    required this.vsync,
    required this.duration,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderAnimatedFadeText(
      text: text,
      style: style,
      direction: direction,
      vsync: vsync,
      duration: duration,
    );
  }

  @override
  void updateRenderObject(BuildContext context, RenderAnimatedFadeText renderObject) {
    renderObject
      ..text = text
      ..style = style
      ..direction = direction
      ..vsync = vsync;
  }
}

class RenderAnimatedFadeText extends RenderBox {
  late final AnimationController _controller;
  late final _sizeTween = Tween<Size>();
  double? _lastValue;

  late final TextPainter _textPainter;
  late final TextPainter _previousTextPainter;

  RenderAnimatedFadeText({
    required String text,
    required TextStyle style,
    required TextDirection direction,
    required TickerProvider vsync,
    required Duration duration,
  })  : _text = text,
        _style = style,
        _direction = direction,
        _vsync = vsync,
        _duration = duration;

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);

    _controller = AnimationController(
      vsync: vsync,
      duration: duration,
      value: 1.0,
    );

    _controller.addListener(() {
      if (_controller.value == _lastValue) {
        return;
      }

      _lastValue = _controller.value;
      markNeedsLayout();
    });

    _textPainter = TextPainter(
      text: _getTextSpan(text: text),
      textDirection: direction,
    );
    _previousTextPainter = TextPainter(
      textDirection: direction,
    );
  }

  TextSpan? _getTextSpan({
    required String? text,
    double alpha = 1.0,
  }) {
    if (text == null) {
      return null;
    }

    var style = this.style;
    if (alpha != 1.0 && style.color != null) {
      final color = style.color!;
      style = style.copyWith(
        color: color.withOpacity(color.opacity * alpha),
      );
    }

    return TextSpan(
      text: text,
      style: style,
    );
  }

  String? _previousText;

  String get text => _text;
  String _text;
  set text(String value) {
    if (value == _text) {
      return;
    }

    _previousText = text;
    _text = value;

    _textPainter.text = _getTextSpan(
      text: text,
      alpha: 0.0,
    );
    _previousTextPainter.text = _getTextSpan(
      text: _previousText!,
    );

    _lastValue = null;
    _controller.reset();
    _controller.forward();

    markNeedsLayout();
  }

  TextStyle get style => _style;
  TextStyle _style;
  set style(TextStyle value) {
    if (value == _style) {
      return;
    }

    _style = value;
    _textPainter.text = _getTextSpan(text: text);
    _previousTextPainter.text = _getTextSpan(text: _previousText);

    markNeedsLayout();
  }

  TextDirection get direction => _direction;
  TextDirection _direction;
  set direction(TextDirection value) {
    if (value == _direction) {
      return;
    }

    _direction = value;
    _textPainter.textDirection = direction;
    _previousTextPainter.textDirection = direction;

    markNeedsLayout();
  }

  TickerProvider get vsync => _vsync;
  TickerProvider _vsync;
  set vsync(TickerProvider value) {
    if (value == _vsync) {
      return;
    }

    _vsync = value;
    _controller.resync(vsync);
  }

  Duration get duration => _duration;
  Duration _duration;
  set duration(Duration value) {
    if (value == _duration) {
      return;
    }

    _duration = value;

    _controller.duration = duration;
  }

  late double _textWidth;
  late double _previousTextWidth;

  Size _doLayout(BoxConstraints constraints) {
    _textPainter.layout(maxWidth: constraints.maxWidth);
    final currentTextSize = _textPainter.size;
    _textWidth = currentTextSize.width;

    if (_sizeTween.end != currentTextSize) {
      _sizeTween.end = currentTextSize;
    }

    if (_previousTextPainter.text != null) {
      _previousTextPainter.layout(maxWidth: constraints.maxWidth);
      final previousTextSize = _previousTextPainter.size;
      _previousTextWidth = previousTextSize.width;

      if (_sizeTween.begin != previousTextSize) {
        _sizeTween.begin = previousTextSize;
      }
    } else {
      _sizeTween.begin = currentTextSize;
    }

    return _sizeTween.transform(_controller.value);
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    return _doLayout(constraints);
  }

  @override
  void performLayout() {
    size = _doLayout(constraints);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final t1 = (_controller.value * 2).clamp(0.0, 1.0);
    final t2 = ((_controller.value - 0.5) * 2).clamp(0.0, 1.0);

    final canvas = context.canvas;
    canvas.save();

    _textPainter.text = _getTextSpan(
      text: text,
    );

    RenderParagraph;
    canvas.saveLayer(
      offset & size,
      Paint(),
    );
    _textPainter.paint(canvas, offset);
    canvas.drawRect(
      offset & size,
      Paint()
        ..blendMode = BlendMode.modulate
        ..shader = ui.Gradient.linear(
          Offset(size.width * t2 - 30.01, 0.0),
          Offset(size.width * t2, 0.0),
          [
            Colors.white,
            const Color(0x00FFFFFF),
          ],
        ),
    );
    canvas.restore();

    // if (_previousText != null) {
    //   _previousTextPainter.text = _getTextSpan(
    //     text: _previousText!,
    //   );

    //   canvas.saveLayer(offset & size, Paint());

    //   _previousTextPainter.paint(canvas, offset);
    //   canvas.drawRect(
    //     offset & size,
    //     Paint()
    //       ..blendMode = BlendMode.modulate
    //       ..shader = ui.Gradient.linear(
    //         Offset(size.width * (1 - t1) - 0.00001, 0.0),
    //         Offset(size.width * (1 - t1), 0.0),
    //         [
    //           Colors.white,
    //           const Color(0x00FFFFFF),
    //         ],
    //       ),
    //   );

    //   canvas.restore();
    // }

    canvas.restore();
  }

  @override
  void detach() {
    _controller.dispose();

    super.detach();
  }
}
