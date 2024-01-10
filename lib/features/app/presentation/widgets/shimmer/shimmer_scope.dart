import 'package:flutter/material.dart';

typedef Unregister = void Function();

const kDefaultShimmerTransparencyColor = Color.fromRGBO(255, 255, 255, 0.5);
const kDefaultShimmerGradient = LinearGradient(
  colors: [
    kDefaultShimmerTransparencyColor,
    Color.fromRGBO(255, 255, 255, 1.0),
    kDefaultShimmerTransparencyColor,
  ],
  stops: [
    0.0,
    0.3,
    0.6,
  ],
  begin: Alignment.topLeft,
  end: Alignment.topRight,
  tileMode: TileMode.clamp,
);

class ShimmerScope extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;

  const ShimmerScope({
    super.key,
    required this.child,
    this.curve = Curves.linear,
    this.duration = const Duration(milliseconds: 1250),
  });

  @override
  State<ShimmerScope> createState() => ShimmerScopeState();

  static ShimmerScopeState? of(BuildContext context) {
    return context.findAncestorStateOfType<ShimmerScopeState>();
  }
}

class ShimmerScopeState extends State<ShimmerScope> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  int _childrenCount = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = Tween(begin: -2.5, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));
  }

  Unregister register() {
    if (_childrenCount == 0) {
      _controller.value = 0.0;
      _controller.repeat();
    }

    _childrenCount += 1;

    var unregistered = false;
    void unregister() {
      assert(!unregistered, 'ShimmerScopeState.unregister() called more than once');
      if (unregistered) return;

      unregistered = true;
      _childrenCount -= 1;

      if (_childrenCount == 0) {
        _controller.reset();
      }
    }

    return unregister;
  }

  LinearGradient get gradient {
    const g = kDefaultShimmerGradient;

    return LinearGradient(
      colors: g.colors,
      stops: g.stops,
      begin: g.begin,
      end: g.end,
      transform: _SlidingGradientTransform(
        slidePercent: _animation.value,
      ),
    );
  }

  bool get isSized => (context.findRenderObject() as RenderBox).hasSize;
  Size get size => (context.findRenderObject() as RenderBox).size;

  Listenable get shimmerChanges => _controller;

  Offset getDescendantOffset({
    required RenderBox descendant,
    Offset offset = Offset.zero,
  }) {
    final shimmerBox = context.findRenderObject() as RenderBox;
    return descendant.localToGlobal(offset, ancestor: shimmerBox);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({
    required this.slidePercent,
  });

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}
