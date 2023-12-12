import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tinkok/features/app/presentation/widgets/staggered/staggered_animations.dart';

typedef AnimatedWidgetBuilder = Widget Function(
  BuildContext context,
  Animation<double> animation,
  Widget child,
);

class StaggeredAnimationExecutor extends StatefulWidget {
  final Duration duration;
  final Duration delay;
  final List<AnimatedWidgetBuilder> animations;
  final Widget child;

  const StaggeredAnimationExecutor({
    super.key,
    required this.duration,
    this.delay = Duration.zero,
    required this.animations,
    required this.child,
  });

  @override
  State<StaggeredAnimationExecutor> createState() => _StaggeredAnimationExecutorState();
}

class _StaggeredAnimationExecutorState extends State<StaggeredAnimationExecutor> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    if (StaggeredAnimationsScope.shouldAnimate(context)) {
      _timer = Timer(widget.delay, _controller.forward);
    } else {
      _controller.value = 1.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        for (final animation in widget.animations) {
          child = animation(context, _controller, child!);
        }

        return child!;
      },
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }
}
