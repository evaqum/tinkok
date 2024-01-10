part of '../routes.dart';

class _CircleClipper extends CustomClipper<Rect> {
  static final _cachedRadiuses = <(Offset, Size), double>{};
  final Animation<double> animation;
  final Offset center;

  _CircleClipper({
    required this.animation,
    required this.center,
  }) : super(reclip: animation);

  double _maxRadiusForCenterAndSize(Size size) {
    return _cachedRadiuses.putIfAbsent(
      (center, size),
      () {
        final offsetFunctions = [
          size.bottomLeft,
          size.bottomRight,
          size.topLeft,
          size.topRight,
        ];
        final distances = offsetFunctions.map((f) => f(center).distanceSquared);
        final maxDistance = distances.reduce((a, b) => max(a, b));
        return maxDistance;
      },
    );
  }

  @override
  Rect getClip(Size size) {
    final d = Tween(begin: 0.0, end: _maxRadiusForCenterAndSize(size)).animate(animation).value;
    return Rect.fromCircle(
      center: center,
      radius: d,
    );
  }

  @override
  bool shouldReclip(_CircleClipper oldClipper) {
    return oldClipper.animation != animation || oldClipper.center != center;
  }
}

typedef WidgetBuilderWithAnimation = Widget Function(
  BuildContext context,
  Animation<double> animation,
);

class _LockScreenPageRoute extends PageRoute {
  final WidgetBuilderWithAnimation builder;
  final Offset? center;

  @override
  final bool maintainState = true;

  @override
  final Duration transitionDuration = const Duration(milliseconds: 500);

  @override
  final barrierColor = null;

  @override
  final barrierLabel = null;

  _LockScreenPageRoute({
    required this.builder,
    required _LockScreenPage page,
    this.center,
  }) : super(settings: page);

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return builder(context, animation);
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (center != null) {
      return ClipOval(
        clipper: _CircleClipper(
          animation: animation,
          center: center!,
        ),
        child: child,
      );
    }

    return child;
  }
}

class _LockScreenPage extends Page<void> {
  final Offset? center;

  const _LockScreenPage({
    required this.center,
  });

  @override
  Route<void> createRoute(BuildContext context) {
    return _LockScreenPageRoute(
      page: this,
      center: center,
      builder: (context, animation) => LockScreen(
        entryAnimation: animation,
      ),
    );
  }
}

@TypedGoRoute<LockScreenRoute>(path: '/lock')
class LockScreenRoute extends GoRouteData {
  final ({
    Offset? center,
  })? $extra;

  const LockScreenRoute({
    this.$extra,
  });

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _LockScreenPage(
      center: $extra?.center,
    );
  }
}
