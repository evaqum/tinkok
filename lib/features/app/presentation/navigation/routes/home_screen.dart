part of '../routes.dart';

@TypedGoRoute<HomeScreenRoute>(path: '/home')
class HomeScreenRoute extends GoRouteData {
  const HomeScreenRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(
      child: HomeScreen(),
    );
  }
}
