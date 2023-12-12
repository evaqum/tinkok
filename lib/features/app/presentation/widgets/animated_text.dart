import 'package:flutter/material.dart';

enum AnimatedTextAlignment { left, center, right }

enum AnimatedTextSlideDirection { up, down }

class AnimatedText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final TextDirection? direction;
  final AnimatedTextAlignment alignment;
  final Duration duration;
  final AnimatedTextSlideDirection slideDirection;

  const AnimatedText(
    this.text, {
    this.style,
    this.direction,
    this.alignment = AnimatedTextAlignment.center,
    this.duration = const Duration(milliseconds: 120),
    this.slideDirection = AnimatedTextSlideDirection.up,
    super.key,
  });

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var effectiveStyle = widget.style;
    if (effectiveStyle == null || effectiveStyle.inherit) {
      effectiveStyle = DefaultTextStyle.of(context).style.merge(effectiveStyle);
    }

    return _AnimatedText(
      text: widget.text,
      style: effectiveStyle,
      direction: widget.direction ?? Directionality.of(context),
      vsync: this,
      alignment: widget.alignment,
      duration: widget.duration,
      slideDirection: widget.slideDirection,
    );
  }
}

class _AnimatedText extends LeafRenderObjectWidget {
  final String text;
  final TextStyle style;
  final TextDirection direction;
  final TickerProvider vsync;
  final AnimatedTextAlignment alignment;
  final Duration duration;
  final AnimatedTextSlideDirection slideDirection;

  const _AnimatedText({
    required this.text,
    required this.style,
    required this.direction,
    required this.vsync,
    required this.alignment,
    required this.duration,
    required this.slideDirection,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderAnimatedText(
      text: text,
      style: style,
      direction: direction,
      vsync: vsync,
      alignment: alignment,
      duration: duration,
      slideDirection: slideDirection,
    );
  }

  @override
  void updateRenderObject(BuildContext context, RenderAnimatedText renderObject) {
    renderObject
      ..text = text
      ..style = style
      ..direction = direction
      ..vsync = vsync
      ..alignment = alignment
      ..duration = duration
      ..slideDirection = slideDirection;
  }
}

class RenderAnimatedText extends RenderBox {
  late final AnimationController _controller;
  late final _sizeTween = Tween<Size>();
  double? _lastValue;

  late final TextPainter _textPainter;
  late final TextPainter _previousTextPainter;

  RenderAnimatedText({
    required String text,
    required TextStyle style,
    required TextDirection direction,
    required TickerProvider vsync,
    required AnimatedTextAlignment alignment,
    required Duration duration,
    required AnimatedTextSlideDirection slideDirection,
  })  : _text = text,
        _style = style,
        _direction = direction,
        _vsync = vsync,
        _alignment = alignment,
        _duration = duration,
        _slideDirection = slideDirection {
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

  AnimatedTextAlignment get alignment => _alignment;
  AnimatedTextAlignment _alignment;
  set alignment(AnimatedTextAlignment value) {
    if (value == _alignment) {
      return;
    }

    _alignment = value;

    markNeedsPaint();
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

  AnimatedTextSlideDirection get slideDirection => _slideDirection;
  AnimatedTextSlideDirection _slideDirection;
  set slideDirection(AnimatedTextSlideDirection value) {
    if (value == _slideDirection) {
      return;
    }

    _slideDirection = value;

    markNeedsPaint();
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

    return constraints.constrain(_sizeTween.transform(_controller.value));
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
    // epic
    const kOffsetByFraction = 1 / (1.618033988749 * 2);
    final kOffsetBy = kOffsetByFraction * (slideDirection == AnimatedTextSlideDirection.down ? 1 : -1);

    final canvas = context.canvas;
    canvas.save();

    final Size(:height) = size;
    final t = _controller.value;
    double calculateOffset(double textWidth) {
      return switch (alignment) {
        AnimatedTextAlignment.left => 0.0,
        AnimatedTextAlignment.center => (size.width - textWidth) / 2,
        AnimatedTextAlignment.right => size.width - textWidth,
      };
    }

    _textPainter.text = _getTextSpan(
      text: text,
      alpha: t,
    );

    _textPainter.paint(
      canvas,
      offset.translate(
        calculateOffset(_textWidth),
        height * kOffsetBy * (t - 1),
      ),
    );

    if (_previousText != null) {
      _previousTextPainter.text = _getTextSpan(
        text: _previousText!,
        alpha: 1.0 - t,
      );

      _previousTextPainter.paint(
        canvas,
        offset.translate(
          calculateOffset(_previousTextWidth),
          height * kOffsetBy * t,
        ),
      );
    }

    canvas.restore();
    Icon;
  }

  @override
  void detach() {
    _controller.stop();
    super.detach();
  }
}
