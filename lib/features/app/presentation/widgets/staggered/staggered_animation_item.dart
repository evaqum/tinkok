import 'package:flutter/material.dart';
import 'package:tinkok/features/app/presentation/widgets/staggered/staggered_animation_executor.dart';

class _StaggeredAnimationItemConfiguration extends InheritedWidget {
  final int position;
  final Duration duration;
  final Duration? delay;

  const _StaggeredAnimationItemConfiguration.syncronized({
    required this.duration,
    required super.child,
  })  : position = 0,
        delay = Duration.zero;

  const _StaggeredAnimationItemConfiguration.listItem({
    required this.position,
    required this.duration,
    this.delay,
    required super.child,
  });

  @override
  bool updateShouldNotify(_StaggeredAnimationItemConfiguration oldWidget) => false;

  static _StaggeredAnimationItemConfiguration of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_StaggeredAnimationItemConfiguration>()!;
  }
}

class StaggeredAnimationItem extends StatelessWidget {
  static const _defaultDuration = Duration(milliseconds: 225);

  final int position;
  final Duration duration;
  final Duration? delay;
  final Widget child;
  final List<AnimatedWidgetBuilder> animations;

  const StaggeredAnimationItem.syncronized({
    required this.animations,
    this.duration = _defaultDuration,
    required this.child,
    super.key,
  })  : position = 0,
        delay = Duration.zero;

  const StaggeredAnimationItem.listItem({
    required this.animations,
    required this.position,
    this.duration = _defaultDuration,
    this.delay,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StaggeredAnimationExecutor(
      duration: duration,
      delay: (delay ?? (duration ~/ 6)) * position,
      animations: animations,
      child: child,
    );
  }
}
