// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeScreenRoute,
      $lockScreenRoute,
      $splashScreenRoute,
    ];

RouteBase get $homeScreenRoute => GoRouteData.$route(
      path: '/home',
      factory: $HomeScreenRouteExtension._fromState,
    );

extension $HomeScreenRouteExtension on HomeScreenRoute {
  static HomeScreenRoute _fromState(GoRouterState state) =>
      const HomeScreenRoute();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $lockScreenRoute => GoRouteData.$route(
      path: '/lock',
      factory: $LockScreenRouteExtension._fromState,
    );

extension $LockScreenRouteExtension on LockScreenRoute {
  static LockScreenRoute _fromState(GoRouterState state) => LockScreenRoute(
        $extra: state.extra as ({Offset? center})?,
      );

  String get location => GoRouteData.$location(
        '/lock',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

RouteBase get $splashScreenRoute => GoRouteData.$route(
      path: '/splash',
      factory: $SplashScreenRouteExtension._fromState,
    );

extension $SplashScreenRouteExtension on SplashScreenRoute {
  static SplashScreenRoute _fromState(GoRouterState state) =>
      const SplashScreenRoute();

  String get location => GoRouteData.$location(
        '/splash',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
