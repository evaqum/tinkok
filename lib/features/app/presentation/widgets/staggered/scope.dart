import 'package:flutter/material.dart';

typedef AnimationBuilder = Widget Function(
  BuildContext context,
  Animation<double> animation,
  Widget child,
);

class StaggeredAnimationScope extends StatefulWidget {
  final Widget child;
  final Duration itemDuration;
  final Duration itemDelay;
  final Curve curve;
  final bool runOnInit;

  const StaggeredAnimationScope({
    super.key,
    this.runOnInit = true,
    this.itemDuration = const Duration(milliseconds: 225),
    this.itemDelay = const Duration(milliseconds: 20),
    this.curve = Curves.linear,
    required this.child,
  });

  @override
  State<StaggeredAnimationScope> createState() => StaggeredAnimationScopeState();

  static Animation<double> registerAnimationChild(BuildContext context) {
    final scopeProvider = context.getInheritedWidgetOfExactType<_StaggeredAnimationScopeProvider>()!;

    return scopeProvider._registerAnimationChild();
  }
}

class StaggeredAnimationScopeState extends State<StaggeredAnimationScope> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _curvedAnimation;
  final _childrenAnimations = <ProxyAnimation>[];
  bool _frameFinished = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
    _curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _frameFinished = true;
      if (widget.runOnInit) runAnimation();
    });
  }

  Animation<double> _registerChild() {
    final proxy = ProxyAnimation(const AlwaysStoppedAnimation(0.0));
    _childrenAnimations.add(proxy);

    return proxy;
  }

  @override
  void didUpdateWidget(StaggeredAnimationScope oldWidget) {
    super.didUpdateWidget(oldWidget);
    _childAnimationsDirty = widget.itemDuration != oldWidget.itemDuration || //
        widget.itemDelay != oldWidget.itemDelay ||
        widget.curve != oldWidget.curve;
  }

  bool _childAnimationsDirty = true;
  int? _previousChildrenCount;

  void runAnimation() {
    final animationsLength = _childrenAnimations.length;

    if (_childAnimationsDirty || _previousChildrenCount != animationsLength) {
      final fullDuration = widget.itemDuration + widget.itemDelay * (animationsLength - 1);
      _controller.duration = fullDuration;

      final itemDurationIntervalSize = (1.0 / fullDuration.inMicroseconds) * widget.itemDuration.inMicroseconds;
      final step = (1.0 - itemDurationIntervalSize) / (animationsLength - 1);

      for (final (i, p) in _childrenAnimations.indexed) {
        p.parent = CurvedAnimation(
          parent: _curvedAnimation,
          curve: Interval(
            step * i,
            itemDurationIntervalSize + step * i,
          ),
        );
      }
    }

    _childAnimationsDirty = false;
    _previousChildrenCount = animationsLength;

    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return _StaggeredAnimationScopeProvider(
      state: this,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _StaggeredAnimationScopeProvider extends InheritedWidget {
  final StaggeredAnimationScopeState _state;

  const _StaggeredAnimationScopeProvider({
    required super.child,
    required StaggeredAnimationScopeState state,
  }) : _state = state;

  @override
  bool updateShouldNotify(_StaggeredAnimationScopeProvider oldWidget) {
    return false;
  }

  Animation<double> _registerAnimationChild() {
    if (_state._frameFinished) {
      return const AlwaysStoppedAnimation(1.0);
    }

    return _state._registerChild();
  }
}
