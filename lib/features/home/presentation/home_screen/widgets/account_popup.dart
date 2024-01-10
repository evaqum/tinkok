import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../accounts/presentation/bloc/accounts_bloc.dart';
import '../../../../app/presentation/navigation/routes.dart';
import '../../../../app/presentation/widgets/pro_badge.dart';
import '../../../../security/presentation/lock_screen/lock_screen.dart';
import '../../../../transactions/bloc/transactions_bloc.dart';
import 'account_button.dart';

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
    pageBuilder: (popupContext, animation, secondaryAnimation) {
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
              onTap: () => Navigator.of(popupContext).pop(),
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
              builder: (_, child) {
                return Transform.scale(
                  alignment: popupOriginAlignment,
                  scale: scaleTween.evaluate(animation),
                  child: _Popup(
                    accountsBloc: context.read(),
                    transactionsBloc: context.read(),
                    itemPadding: EdgeInsets.symmetric(
                      horizontal: targetPosition.dx - sideOffset,
                    ),
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
  final EdgeInsetsGeometry itemPadding;
  final AccountsBloc accountsBloc;
  final TransactionsBloc transactionsBloc;
  final lockIconKey = GlobalKey();

  _Popup({
    required this.itemPadding,
    required this.accountsBloc,
    required this.transactionsBloc,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(16.0);

    return ClipRRect(
      borderRadius: borderRadius,
      child: Material(
        type: MaterialType.transparency,
        child: Ink(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: const Color(0xFF262626),
          ),
          padding: const EdgeInsets.only(
            top: 12.0,
            bottom: 6.0,
          ),
          child: Column(
            children: [
              Padding(
                padding: itemPadding,
                child: Row(
                  children: [
                    Text(
                      'Tinkok User',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w800,
                        fontSize: 18.0,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                    const Gap(6.0),
                    const ProBadge(),
                  ],
                ),
              ),
              const Gap(8.0),
              Padding(
                padding: itemPadding,
                child: const SizedBox(
                  height: 2.0,
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: ShapeDecoration(
                      shape: StadiumBorder(),
                      color: Color.fromRGBO(255, 255, 255, 0.1),
                    ),
                  ),
                ),
              ),
              const Gap(8.0),
              _PopupItem(
                itemPadding: itemPadding,
                onTapUp: (_) {
                  accountsBloc.add(const AccountsEvent.refreshAccounts());
                  Navigator.pop(context);
                },
                icon: Icons.refresh_rounded,
                text: 'Refresh accounts',
              ),
              _PopupItem(
                itemPadding: itemPadding,
                onTapUp: (_) {
                  transactionsBloc.add(const TransactionsEvent.fetchTransactions());
                  Navigator.pop(context);
                },
                icon: Icons.refresh_rounded,
                text: 'Refresh transactions',
              ),
              _PopupItem(
                itemPadding: itemPadding,
                onTapUp: (_) {
                  accountsBloc.add(const AccountsEvent.refreshAccounts());
                  transactionsBloc.add(const TransactionsEvent.fetchTransactions());
                  Navigator.pop(context);
                },
                icon: Icons.refresh_rounded,
                text: 'Refresh everything',
              ),
              _PopupItem(
                itemPadding: itemPadding,
                onTapUp: (_) {},
                icon: Icons.settings_outlined,
                text: 'Settings',
              ),
              _PopupItem(
                itemPadding: itemPadding,
                onTapUp: (details) {
                  final lockIconBox = lockIconKey.currentContext!.findRenderObject()! as RenderBox;
                  final lockIconSize = lockIconBox.size;
                  final center = lockIconBox.localToGlobal(Offset.zero) +
                      Offset(
                        lockIconSize.width / 2,
                        lockIconSize.height / 2,
                      );

                  LockScreenRoute($extra: (center: center,)).go(context);
                },
                iconChild: Hero(
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
                  child: _PopupItemIcon(
                    icon: Icons.lock_outlined,
                    key: lockIconKey,
                  ),
                ),
                text: 'Lock',
              ),
              _PopupItem(
                itemPadding: itemPadding,
                onTapUp: (_) {},
                icon: Icons.exit_to_app_rounded,
                text: 'Log out',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PopupItemIcon extends StatelessWidget {
  final IconData icon;

  const _PopupItemIcon({
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 20.0,
      color: Colors.white.withOpacity(0.5),
    );
  }
}

class _PopupItem extends StatelessWidget {
  final EdgeInsetsGeometry itemPadding;
  final IconData? icon;
  final Widget? iconChild;
  final String text;
  final ValueChanged<TapUpDetails> onTapUp;

  const _PopupItem({
    required this.itemPadding,
    required this.text,
    required this.onTapUp,
    this.icon,
    this.iconChild,
  }) : assert(icon != null || iconChild != null);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapUp: onTapUp,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: itemPadding.horizontal / 2,
          vertical: 6.0 + itemPadding.vertical,
        ),
        child: Row(
          children: [
            iconChild ?? _PopupItemIcon(icon: icon!),
            const Gap(6.0),
            Text(
              text,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
                color: Colors.white.withOpacity(0.75),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
