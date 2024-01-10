part of '../routes.dart';

@TypedGoRoute<SplashScreenRoute>(path: '/splash')
class SplashScreenRoute extends GoRouteData {
  const SplashScreenRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(
      child: SplashScreen(),
    );
  }
}
