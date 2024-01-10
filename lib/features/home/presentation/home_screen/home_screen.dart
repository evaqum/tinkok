import 'package:bloc_hooks/bloc_hooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../accounts/presentation/bloc/accounts_bloc.dart';
import '../../../app/di/configure_dependencies.dart';
import '../../../app/presentation/widgets/animated_text.dart';
import '../../../app/presentation/widgets/shimmer/shimmer_scope.dart';
import '../../../app/presentation/widgets/sliver_translate.dart';
import '../../../transactions/bloc/transactions_bloc.dart';
import 'cubit/home_screen_cubit.dart';
import 'tabs/transactions/transactions_tab.dart';
import 'widgets/accounts.dart';
import 'widgets/app_bar.dart';
import 'widgets/tab_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeScreenCubit(),
        ),
        BlocProvider(
          create: (context) => AccountsBloc(
            accountRepository: get(),
          )..add(const AccountsEvent.fetchAccounts()),
        ),
        BlocProvider(
          create: (context) => TransactionsBloc(
            transactionsRepository: get(),
          )..add(const TransactionsEvent.fetchTransactions()),
        )
      ],
      child: const _HomeScreen(),
    );
  }
}

class _HomeScreen extends HookWidget {
  static const _contentPadding = EdgeInsets.symmetric(horizontal: 24.0);

  const _HomeScreen();

  @override
  Widget build(BuildContext context) {
    final homeScreenCubit = useBloc<HomeScreenCubit>();

    final topPadding = MediaQuery.paddingOf(context).top;
    final scrollController = useScrollController();

    useBlocListener(
      listenWhen: (TransactionsState previous, TransactionsState current) {
        return previous.transactions != current.transactions;
      },
      (TransactionsBloc _, TransactionsState state) {
        final willAllowScroll = state.transactions != null;

        homeScreenCubit.toggleScrolling(willAllowScroll);

        if (!willAllowScroll) {
          scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOutCubic,
          );
        }
      },
    );

    final scrollingAllowed = useBlocSelector(
      (HomeScreenCubit _, HomeScreenState state) => state.scrollingAllowed,
    );

    return ShimmerScope(
      curve: Curves.easeOut,
      child: Scaffold(
        body: Stack(
          children: [
            CustomScrollView(
              controller: scrollController,
              physics: scrollingAllowed ? null : const NeverScrollableScrollPhysics(),
              slivers: [
                SliverGap(kAppBarHeight + topPadding + 8.0),
                const SliverPadding(
                  padding: _contentPadding,
                  sliver: HomeScreenAccounts(),
                ),
                const SliverGap(24.0),
                const SliverPadding(
                  padding: _contentPadding,
                  sliver: _TabHeader(),
                ),
                const SliverGap(16.0),
                const SliverPadding(
                  padding: _contentPadding,
                  sliver: _TabContent(),
                ),
                const SliverGap(16.0),
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: HomeScreenAppBar(scrollableScrollController: scrollController),
            ),
          ],
        ),
      ),
    );
  }
}

class _TabHeader extends HookWidget {
  const _TabHeader();

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<HomeScreenCubit>();
    final currentTab = useBlocSelector(
      (HomeScreenCubit _, HomeScreenState state) => state.currentTab,
    );

    return SliverList.list(
      children: [
        Row(
          children: [
            for (final tab in HomeScreenTab.values) ...[
              GestureDetector(
                onTap: () => cubit.setCurrentTab(tab),
                child: HomeScreenTabButton(
                  icon: tab.icon,
                  isActive: currentTab == tab,
                ),
              ),
              if (tab != HomeScreenTab.values.last) const Gap(8.0),
            ],
          ],
        ),
        const Gap(12.0),
        AnimatedText(
          currentTab.title,
          alignment: AnimatedTextAlignment.left,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w800,
            fontSize: 24.0,
          ),
        ),
      ],
    );
  }
}

class _TabContent extends HookWidget {
  const _TabContent();

  @override
  Widget build(BuildContext context) {
    final (currentTab, previousTab) = useBlocSelector(
      (HomeScreenCubit _, HomeScreenState state) => (
        state.currentTab,
        state.previousTab,
      ),
    );

    final shouldSlideLeftToRight = previousTab.index > currentTab.index;

    return AnimatedSwitcher(
      layoutBuilder: SliverAnimatedSwitcher.defaultLayoutBuilder,
      duration: const Duration(milliseconds: 120),
      transitionBuilder: (transitionChild, animation) {
        Widget Function(BuildContext, Animation<double>, Widget?) getTransitionBuilder({bool reverse = false}) {
          const slideBy = 24.0;
          final enterAt = shouldSlideLeftToRight ? -slideBy : slideBy;
          final tween = Tween<double>(
            begin: reverse ? 0.0 : enterAt,
            end: reverse ? -enterAt : 0.0,
          );

          return (context, animation, child) {
            return SliverTranslate(
              translation: Offset(
                tween.transform(animation.value),
                0.0,
              ),
              child: child,
            );
          };
        }

        final forwardBuilder = getTransitionBuilder();
        final reverseBuilder = getTransitionBuilder(reverse: true);

        final reversedAnimation = ReverseAnimation(animation);

        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            final isReverse = animation.status == AnimationStatus.reverse;
            final builder = isReverse ? reverseBuilder : forwardBuilder;

            return builder(context, isReverse ? reversedAnimation : animation, child);
          },
          child: SliverFadeTransition(
            opacity: animation,
            sliver: transitionChild,
          ),
        );
      },
      child: switch (currentTab) {
        HomeScreenTab.transactions => const HomeTransactionsTab(),
        HomeScreenTab.cashback => SliverToBoxAdapter(
            key: const ValueKey('red'),
            child: Container(
              color: Colors.red,
              height: 300.0,
            ),
          ),
        HomeScreenTab.foo => SliverToBoxAdapter(
            key: const ValueKey('blue'),
            child: Container(
              color: Colors.blue,
              height: 300.0,
            ),
          ),
        HomeScreenTab.bar => SliverToBoxAdapter(
            key: const ValueKey('green'),
            child: Container(
              color: Colors.green,
              height: 300.0,
            ),
          ),
      },
    );
  }
}
