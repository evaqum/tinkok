import 'package:flutter/material.dart';

class StaggeredAnimationsScope extends StatefulWidget {
  final Widget child;

  const StaggeredAnimationsScope({
    super.key,
    required this.child,
  });

  @override
  State<StaggeredAnimationsScope> createState() => _StaggeredAnimationsScopeState();

  static bool shouldAnimate(BuildContext context) {
    return _StaggeredAnimationsScopeProvider.of(context).shouldAnimate;
  }
}

class _StaggeredAnimationsScopeState extends State<StaggeredAnimationsScope> {
  bool _shouldAnimate = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() => _shouldAnimate = false);
    });
  }

  @override
  void didUpdateWidget(StaggeredAnimationsScope oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.child != oldWidget.child) {
      setState(() {
        _shouldAnimate = true;
      });

      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() => _shouldAnimate = false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _StaggeredAnimationsScopeProvider(
      shouldAnimate: _shouldAnimate,
      child: widget.child,
    );
  }
}

class _StaggeredAnimationsScopeProvider extends InheritedWidget {
  final bool shouldAnimate;

  const _StaggeredAnimationsScopeProvider({
    required this.shouldAnimate,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static _StaggeredAnimationsScopeProvider of(BuildContext context) {
    return context.getInheritedWidgetOfExactType<_StaggeredAnimationsScopeProvider>()!;
  }
}
