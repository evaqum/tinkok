import 'package:flutter/material.dart';

import 'scope.dart';

class StaggeredAnimationItem extends StatefulWidget {
  final Widget child;
  final Widget Function(BuildContext context, Animation<double> animation, Widget child) animationBuilder;

  const StaggeredAnimationItem({
    super.key,
    required this.child,
    required this.animationBuilder,
  });

  @override
  State<StaggeredAnimationItem> createState() => _StaggeredAnimationItemState();
}

class _StaggeredAnimationItemState extends State<StaggeredAnimationItem> {
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _animation = StaggeredAnimationScope.registerAnimationChild(context);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) => widget.animationBuilder(context, _animation, child!),
      child: widget.child,
    );
  }
}
