import 'dart:ui';

import 'package:bloc_hooks/bloc_hooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tinkok/features/app/presentation/widgets/pro_badge.dart';
import 'package:tinkok/features/home/presentation/cubit/home_screen_cubit.dart';

import '../../app/presentation/widgets/animated_text.dart';
import 'widgets/accounts.dart';
import 'widgets/app_bar.dart';
import 'widgets/tab_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HomeScreen();
  }
}

class _HomeScreen extends HookWidget {
  static const _contentPadding = EdgeInsets.symmetric(horizontal: 24.0);

  const _HomeScreen();

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.paddingOf(context).top;
    final scrollController = useScrollController();
    final scrollOffsetNotifier = useValueNotifier(0.0);

    useEffect(() {
      scrollController.addListener(() {
        scrollOffsetNotifier.value = scrollController.offset;
      });
      return null;
    }, []);

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Stack(
        children: [
          CustomScrollView(
            controller: scrollController,
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
              SliverPadding(
                padding: _contentPadding,
                sliver: _TabContent(),
              )
            ],
          ),
          Align(
            alignment: Alignment.topCenter,
            child: HomeScreenAppBar(
              scrollOffsetListenable: scrollOffsetNotifier,
            ),
          ),
        ],
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
      inferBloc: inferBlocType<HomeScreenCubit>,
      (HomeScreenState state) => state.currentTab,
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

typedef _TabItemsBuilder = List<Widget> Function(BuildContext context);

class _TabContent extends HookWidget {
  _TabContent();

  late final Map<HomeScreenTab, _TabItemsBuilder> _tabItems = {
    HomeScreenTab.cashback: _buildCashbackTabItems,
    HomeScreenTab.transactions: _buildTransactionsTabItems,
  };

  List<Widget> _buildCashbackTabItems(BuildContext context) {
    return [
      SizedBox(
        height: 80.0,
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: double.infinity,
                padding: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF1D1D1D),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF3E3E3E),
                              Color(0xFF666666),
                            ],
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/crown.png',
                              width: 14.0,
                            ),
                            const Gap(6.0),
                            Text(
                              '1 452 ₽',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w800,
                                fontSize: 16.0,
                                color: Colors.white.withOpacity(0.9),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Gap(6.0),
                    Text(
                      '↘ 12 Dec.',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Gap(6.0),
            Expanded(
              child: Container(
                height: double.infinity,
                padding: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF1D1D1D),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF586269),
                              Color(0xFF3C4B56),
                            ],
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/star.png',
                              width: 14.0,
                            ),
                            const Gap(6.0),
                            Text(
                              '392 points',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w800,
                                fontSize: 16.0,
                                color: Colors.white.withOpacity(0.9),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      const Gap(12.0),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: const Color(0xFF1D1D1D),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Partner cashback',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w800,
                    fontSize: 16.0,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                const Gap(8.0),
                const ProBadge(),
              ],
            ),
            const Gap(8.0),
            SizedBox(
              height: 88.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  separatorBuilder: (_, __) => const Gap(6.0),
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: SizedBox.square(
                        dimension: 88.0,
                        child: DecoratedBox(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF232323),
                                Color(0xFF262626),
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Transform.translate(
                                  offset: const Offset(12.0, 12.0),
                                  child: ImageFiltered(
                                    imageFilter: ImageFilter.blur(
                                      sigmaX: 30.0,
                                      sigmaY: 30.0,
                                    ),
                                    child: Image.asset(
                                      'assets/images/blini.png',
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Transform.translate(
                                  offset: const Offset(18.0, 6.0),
                                  child: Image.asset(
                                    'assets/images/blini.png',
                                    width: 90.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Блины',
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.0,
                                        color: Colors.white.withOpacity(0.9),
                                      ),
                                    ),
                                    Text(
                                      '1% на блины',
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10.0,
                                        color: Colors.white.withOpacity(0.9),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> _buildTransactionsTabItems(BuildContext context) {
    final dateStyle = GoogleFonts.inter(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: Colors.white.withOpacity(0.5),
      height: 1.0,
    );

    const gap = Gap(16.0);
    const dateGap = Gap(20.0);

    return [
      // ---
      Text('Today', style: dateStyle),
      gap,
      _TransactionTile(
        icon: Icons.send_rounded,
        amount: '20 000',
        name: 'Иван)',
        category: 'Transfers',
        isIncome: true,
      ),
      gap,
      _TransactionTile(
        amount: '14',
        icon: Icons.shopping_bag_rounded,
        name: 'Ашан',
        category: 'Shop',
        isIncome: false,
      ),
      gap,
      _TransactionTile(),
      dateGap,
      // ---
      Text('Yesterday', style: dateStyle),
      gap,
      _TransactionTile(failed: true),
      dateGap,
      // ---
      Text('28 November', style: dateStyle), gap,
      _TransactionTile(), gap,
      _TransactionTile(amount: '100.39'), gap,
      _TransactionTile(), gap,
      _TransactionTile(), dateGap,
      // ---
      Text('27 November', style: dateStyle), gap,
      _TransactionTile(
        amount: '1 392 943',
      ),
      gap,
    ];
  }

  @override
  Widget build(BuildContext context) {
    final currentTab = useBlocSelector(
      inferBloc: inferBlocType<HomeScreenCubit>,
      (HomeScreenState state) => state.currentTab,
    );

    final tabItems = _tabItems[currentTab]!(context);

    return SliverList.builder(
      itemCount: tabItems.length,
      itemBuilder: (context, index) {
        return tabItems[index];
      },
    );

    // return StaggeredAnimationsScope(
    //   child: SliverList.builder(
    //     key: ValueKey(currentTab),
    //     itemCount: tabItems.length,
    //     itemBuilder: (context, index) {
    //       return StaggeredAnimationItem.listItem(
    //         position: index,
    //         duration: const Duration(milliseconds: 220),
    //         delay: const Duration(milliseconds: 20),
    //         animations: [
    //           (context, animation, child) {
    //             final curvedAnimation = CurvedAnimation(
    //               parent: animation,
    //               curve: Curves.easeOutCubic,
    //             );

    //             return FadeTransition(
    //               opacity: animation,
    //               child: MatrixTransition(
    //                 animation: curvedAnimation,
    //                 // position: Tween<Offset>(
    //                 //   begin: const Offset(0.0, 0.3),
    //                 //   end: Offset.zero,
    //                 // ).animate(curvedAnimation),
    //                 onTransform: (progress) {
    //                   return Matrix4.translationValues(
    //                     0.0,
    //                     20.0 * (1 - progress),
    //                     0.0,
    //                   );
    //                 },
    //                 child: ScaleTransition(
    //                   alignment: Alignment.topCenter,
    //                   scale: Tween<double>(
    //                     begin: 0.925,
    //                     end: 1.0,
    //                   ).animate(curvedAnimation),
    //                   child: child,
    //                 ),
    //               ),
    //             );
    //           },
    //         ],
    //         child: tabItems[index],
    //       );
    //     },
    //   ),
    // );
  }
}

class _TransactionTile extends StatelessWidget {
  final IconData icon;
  final String name;
  final String category;
  final bool isIncome;
  final String amount;
  final bool failed;

  _TransactionTile({
    this.icon = Icons.receipt,
    this.name = 'Chich',
    this.category = 'Transfer',
    this.isIncome = false,
    this.amount = '100',
    this.failed = false,
  });

  final transactionNameStyle = GoogleFonts.inter(
    fontSize: 15.0,
    fontWeight: FontWeight.w800,
    color: Colors.white.withOpacity(0.9),
    height: 1.0,
  );
  final transactionCategoryStyle = GoogleFonts.inter(
    fontSize: 13.0,
    fontWeight: FontWeight.w500,
    color: Colors.white.withOpacity(0.5),
    height: 1.0,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40.0,
          width: 40.0,
          decoration: ShapeDecoration(
            shape: const CircleBorder(),
            gradient: LinearGradient(
              colors: isIncome
                  ? [
                      const Color(0xFF1EA52C),
                      const Color(0xFF4EBE59),
                    ]
                  : [
                      const Color(0xFFA51E1E),
                      const Color(0xFFBE4E69),
                    ],
              begin: Alignment.bottomCenter,
              end: Alignment.topRight,
            ),
          ),
          child: Icon(icon),
        ),
        const Gap(12.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: transactionNameStyle,
            ),
            const Gap(4.0),
            Text(
              category,
              style: transactionCategoryStyle,
            ),
          ],
        ),
        const Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text.rich(
              TextSpan(children: [
                TextSpan(text: '${isIncome ? '+' : '-'} $amount '),
                TextSpan(
                  text: '₽',
                  style: TextStyle(color: Colors.white.withOpacity(0.3)),
                ),
              ]),
              style: GoogleFonts.inter(
                fontSize: 15.0,
                height: 1.0,
                fontWeight: FontWeight.w800,
                color: (failed ? const Color(0xFFFA7070) : Colors.white).withOpacity(0.9),
              ),
            ),
            if (failed) ...[
              const Gap(4.0),
              Text(
                'Failed',
                style: GoogleFonts.inter(
                  fontSize: 13.0,
                  height: 1.0,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFFFA7070).withOpacity(0.9),
                ),
              )
            ],
          ],
        ),
      ],
    );
  }
}
