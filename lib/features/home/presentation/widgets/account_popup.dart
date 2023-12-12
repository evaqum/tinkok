import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiver/iterables.dart';
import 'package:tinkok/features/app/presentation/widgets/pro_badge.dart';
import 'package:tinkok/features/home/presentation/widgets/account_button.dart';

import '../../../lock/presentation/lock_screen.dart';

Future<void> showAccountPopup(
  BuildContext context,
) {
  final targetBox = context.findRenderObject() as RenderBox;
  final overlay = Navigator.of(context).overlay!.context.findRenderObject() as RenderBox;
  final screenSize = MediaQuery.sizeOf(context);

  final targetPosition = targetBox.localToGlobal(Offset.zero, ancestor: overlay);
  final targetSize = targetBox.size;

  final sideOffset = targetPosition.dx / 2;
  final popupWidth = screenSize.width - sideOffset * 2;

  final targetCenterX = targetPosition.dx + targetSize.width / 2;
  final targetCenterXToPopupStart = targetCenterX - sideOffset;
  final targetCenterXToPopupAlignmentX = ((targetCenterXToPopupStart / popupWidth) - 0.5) * 2;

  final popupOriginAlignment = Alignment(
    targetCenterXToPopupAlignmentX,
    -1.0,
  );

  final scaleTween = Tween(begin: 0.7, end: 1.0);

  return Navigator.of(context).push(PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 175),
    reverseTransitionDuration: const Duration(milliseconds: 175),
    barrierColor: Colors.black.withOpacity(0.6),
    barrierDismissible: true,
    opaque: false,
    pageBuilder: (context, animation, secondaryAnimation) {
      animation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
      );

      return Stack(
        children: [
          Positioned(
            left: targetPosition.dx,
            top: targetPosition.dy,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Hero(
                tag: 'account_button',
                child: AccountButton(),
              ),
            ),
          ),
          Positioned(
            left: sideOffset,
            right: sideOffset,
            top: targetPosition.dy + targetSize.height + 8.0,
            child: AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return Transform.scale(
                  alignment: popupOriginAlignment,
                  scale: scaleTween.evaluate(animation),
                  child: _Popup(
                    sidePadding: targetPosition.dx - sideOffset,
                  ),
                );
              },
            ),
          ),
        ],
      );
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  ));
}

class _Popup extends StatelessWidget {
  final double sidePadding;
  final lockIconKey = GlobalKey();

  _Popup({
    required this.sidePadding,
  });

  Widget _applySidePadding(Widget child) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: sidePadding,
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: const Color(0xFF262626),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Material(
        type: MaterialType.transparency,
        child: Column(
          children: [
            _applySidePadding(Row(
              children: [
                Text(
                  'Олег 228',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w800,
                    fontSize: 18.0,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                const Gap(6.0),
                const ProBadge(),
              ],
            )),
            const Gap(8.0),
            _applySidePadding(const SizedBox(
              height: 2.0,
              width: double.infinity,
              child: DecoratedBox(
                decoration: ShapeDecoration(
                  shape: StadiumBorder(),
                  color: Color.fromRGBO(255, 255, 255, 0.1),
                ),
              ),
            )),
            const Gap(8.0),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: sidePadding,
                  vertical: 6.0,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.settings_outlined,
                      size: 20.0,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    const Gap(6.0),
                    Text(
                      'Settings',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        color: Colors.white.withOpacity(0.75),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTapUp: (details) {
                final lockIconBox = lockIconKey.currentContext!.findRenderObject()! as RenderBox;
                final lockIconSize = lockIconBox.size;
                final center = lockIconBox.localToGlobal(Offset.zero) +
                    Offset(
                      lockIconSize.width / 2,
                      lockIconSize.height / 2,
                    );

                Navigator.pushAndRemoveUntil(
                  context,
                  LockScreenPageRoute(
                    center: center,
                    builder: (context, animation) => LockScreen(
                      entryAnimation: animation,
                    ),
                  ),
                  (_) => false,
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: sidePadding,
                  vertical: 6.0,
                ),
                child: Row(
                  children: [
                    Hero(
                      tag: 'lock_icon',
                      flightShuttleBuilder: (flightContext, animation, flightDirection, fromHeroContext, toHeroContext) {
                        final colorT = ColorTween(
                          begin: Colors.white.withOpacity(0.5),
                          end: kLockScreenLockIconColor,
                        );
                        final sizeT = Tween(
                          begin: 20.0,
                          end: kLockScreenLockIconSize,
                        );

                        return AnimatedBuilder(
                          animation: animation,
                          builder: (context, child) {
                            return Icon(
                              Icons.lock_outlined,
                              size: sizeT.evaluate(animation),
                              color: colorT.evaluate(animation),
                            );
                          },
                        );
                      },
                      child: Icon(
                        key: lockIconKey,
                        Icons.lock_outlined,
                        size: 20.0,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    const Gap(6.0),
                    Text(
                      'Lock',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        color: Colors.white.withOpacity(0.75),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: sidePadding,
                  vertical: 6.0,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.exit_to_app_rounded,
                      size: 20.0,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    const Gap(6.0),
                    Text(
                      'Log out',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        color: Colors.white.withOpacity(0.75),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

typedef WidgetBuilderWithAnimation = Widget Function(
  BuildContext context,
  Animation<double> animation,
);

class LockScreenPageRoute extends PageRoute {
  final WidgetBuilderWithAnimation builder;
  final Offset center;

  @override
  final bool maintainState;

  @override
  final Duration transitionDuration = const Duration(milliseconds: 500);

  @override
  final barrierColor = null;

  @override
  final barrierLabel = null;

  LockScreenPageRoute({
    required this.builder,
    required this.center,
    this.maintainState = true,
  });

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
    return ClipOval(
      clipper: _CircleClipper(
        animation: animation,
        center: center,
      ),
      child: child,
    );
  }
}

class _CircleClipper extends CustomClipper<Rect> {
  // TODO: remove this? looks dumb, prob not even needed
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
        final distances = offsetFunctions.map((f) => f(center).distance);
        final maxDistance = max(distances)!;
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
