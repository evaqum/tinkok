import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:tinkok/features/home/presentation/widgets/account_button.dart';
import 'package:tinkok/features/home/presentation/widgets/account_popup.dart';

const kAppBarHeight = kToolbarHeight + 12.0;

class HomeScreenAppBar extends HookWidget {
  final ValueListenable<double> scrollOffsetListenable;

  const HomeScreenAppBar({
    super.key,
    required this.scrollOffsetListenable,
  });

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.paddingOf(context).top;
    final scrollOffset = useValueListenable(scrollOffsetListenable);
    final blurSigma = (scrollOffset / 4).clamp(0.0, 20.0);
    debugPrint('sigma: $blurSigma');

    return SizedBox(
      height: kAppBarHeight + topPadding,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: blurSigma,
            sigmaY: blurSigma,
          ),
          child: ColoredBox(
            color: const Color(0xD0121212),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 24.0,
                  right: 24.0 + 4.0,
                  bottom: 12.0,
                ),
                child: Row(
                  children: [
                    Builder(builder: (context) {
                      return GestureDetector(
                        onTap: () => showAccountPopup(context),
                        child: const Hero(
                          tag: 'account_button',
                          child: AccountButton(),
                        ),
                      );
                    }),
                    const Gap(12.0),
                    Image.asset(
                      'assets/icons/gift.png',
                      height: 20.0,
                    ),
                    const Spacer(),
                    const Icon(Icons.search_rounded),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
