import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';

import 'account_button.dart';
import 'account_popup.dart';

const kAppBarHeight = kToolbarHeight + 12.0;

class HomeScreenAppBar extends HookWidget {
  final ScrollController _scrollableScrollController;

  const HomeScreenAppBar({
    super.key,
    required ScrollController scrollableScrollController,
  }) : _scrollableScrollController = scrollableScrollController;

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.paddingOf(context).top;
    final scrollController = useListenable(_scrollableScrollController);
    final scrollOffset = scrollController.offset;
    final blurSigma = (scrollOffset / 4).clamp(0.0, 20.0);

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
                    const _UserButton(),
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

class _UserButton extends StatelessWidget {
  const _UserButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showAccountPopup(context),
      child: const Hero(
        tag: 'account_button',
        child: AccountButton(),
      ),
    );
  }
}
