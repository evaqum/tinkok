import 'package:bloc_hooks/bloc_hooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/format.dart';
import '../../../../../core/utils/range.dart';
import '../../../../accounts/domain/models/account.dart';
import '../../../../accounts/presentation/bloc/accounts_bloc.dart';
import '../../../../app/presentation/tinkok_icons.dart';
import '../../../../app/presentation/widgets/animated_text.dart';
import '../../../../app/presentation/widgets/shimmer/placeholders/circle.dart';
import '../../../../app/presentation/widgets/shimmer/placeholders/container.dart';
import '../../../../app/presentation/widgets/shimmer/placeholders/text.dart';
import '../../../../app/presentation/widgets/shimmer/switcher.dart';
import '../cubit/home_screen_cubit.dart';
import 'gradient_action_button.dart';
import 'tab_button.dart';

class HomeScreenAccounts extends HookWidget {
  const HomeScreenAccounts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.list(
      children: const [
        _AccountSelectRow(),
        Gap(16.0),
        // _CurrentAccountCardPlaceholder(),
        _AccountCard(),
      ],
    );
  }
}

class _AccountSelectRow extends HookWidget {
  const _AccountSelectRow();

  IconData _iconForAccount(AccountModel account) {
    return switch ((account.type, account.currency)) {
      (AccountType.credit, _) => Tinkok.percent,
      (_, AccountCurrency.rub) => Tinkok.ruble,
      (_, AccountCurrency.usd) => Tinkok.dollar,
      _ => Tinkok.star,
    };
  }

  @override
  Widget build(BuildContext context) {
    final homeScreenCubit = useBloc<HomeScreenCubit>();

    final accountIndex = useBlocSelector(
      (HomeScreenCubit _, HomeScreenState state) => state.selectedAccountIndex,
    );

    final accounts = useBlocSelector(
      (AccountsBloc _, AccountsState state) => state.accounts,
    );

    return ShimmerSwitcher(
      showPlaceholder: accounts == null,
      placeholder: const _AccountSelectRowPlaceholder(),
      childBuilder: (context) {
        accounts!;

        final accountIndexSafe = accountIndex >= accounts.length ? 0 : accountIndex;

        return Row(
          children: [
            for (final i in range(0, accounts.length)) ...[
              GestureDetector(
                onTap: () => homeScreenCubit.selectAccount(i),
                child: HomeScreenTabButton(
                  icon: _iconForAccount(accounts[i]),
                  isActive: i == accountIndexSafe,
                ),
              ),
              if (i != accounts.length - 1) const Gap(8.0),
            ],
            const Spacer(),
            Image.asset(
              'assets/icons/create_account_because_im_too_lazy.png',
              height: 36.0,
            ),
          ],
        );
      },
    );
  }
}

class _AccountSelectRowPlaceholder extends StatelessWidget {
  const _AccountSelectRowPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (final i in range(0, 3)) ...[
          const ShimmerCirclePlaceholder(diameter: 36.0),
          if (i != 3) const Gap(8.0),
        ],
        const Spacer(),
        const ShimmerCirclePlaceholder(diameter: 36.0),
      ],
    );
  }
}

class _AccountCard extends HookWidget {
  const _AccountCard();

  @override
  Widget build(BuildContext context) {
    final accountIndex = useBlocSelector(
      (HomeScreenCubit _, HomeScreenState state) => state.selectedAccountIndex,
    );

    final accounts = useBlocSelector(
      (AccountsBloc _, AccountsState state) => state.accounts,
    );

    return ShimmerSwitcher(
      showPlaceholder: accounts == null,
      placeholder: const _CurrentAccountCardPlaceholder(),
      childBuilder: (context) {
        accounts!;

        final accountIndexSafe = accountIndex >= accounts.length ? 0 : accountIndex;

        final currentAccount = accounts[accountIndexSafe];

        return _CurrentAccountCard(
          key: const ValueKey('account_card'),
          currentAccount: currentAccount,
        );
      },
    );
  }
}

class _CurrentAccountCardPlaceholder extends StatelessWidget {
  const _CurrentAccountCardPlaceholder();

  @override
  Widget build(BuildContext context) {
    return ShimmerContainerPlaceholder(
      borderRadius: BorderRadius.circular(16.0),
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 12),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ShimmerTextPlaceholder(
                'account name',
                style: GoogleFonts.inter(
                  height: 1.0,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                ),
              ),
              const SizedBox(height: 18.0),
            ],
          ),
          const Gap(8.0),
          ShimmerTextPlaceholder(
            '128 256 ₽',
            style: GoogleFonts.inter(
              height: 1.0,
              fontSize: 32.0,
              fontWeight: FontWeight.w800,
            ),
          ),
          const Gap(16.0),
          const Row(
            children: [
              _AccountActionButtonPlaceholder(),
              Gap(8.0),
              _AccountActionButtonPlaceholder(),
              Gap(8.0),
              _AccountActionButtonPlaceholder(),
            ],
          ),
        ],
      ),
    );
  }
}

class _CurrentAccountCard extends StatelessWidget {
  final AccountModel currentAccount;

  const _CurrentAccountCard({
    super.key,
    required this.currentAccount,
  });

  @override
  Widget build(BuildContext context) {
    final cashback = currentAccount.cashback;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF363636),
            Color(0xFF1D1D1D),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.05),
            blurRadius: 50.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    AnimatedText(
                      currentAccount.name,
                      alignment: AnimatedTextAlignment.left,
                      style: GoogleFonts.inter(
                        height: 1.0,
                        color: Colors.white.withOpacity(0.4),
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                      ),
                    ),
                    const Gap(8.0),
                    SizedBox(
                      height: 18.0,
                      child: cashback != null //
                          ? _AccountCashbackChip(cashback: cashback)
                          : null,
                    )
                  ],
                ),
                const Gap(8.0),
                Row(
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    AnimatedSwitcher(
                      duration: const Duration(
                        milliseconds: 120,
                      ),
                      layoutBuilder: (currentChild, previousChildren) {
                        return Stack(
                          alignment: Alignment.centerLeft,
                          children: <Widget>[
                            ...previousChildren,
                            if (currentChild != null) currentChild,
                          ],
                        );
                      },
                      child: Text.rich(
                        key: ValueKey(currentAccount.id),
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '${currentAccount.balance.formatMoney()} ',
                              style: const TextStyle(
                                fontSize: 32.0,
                              ),
                            ),
                            TextSpan(
                              text: currentAccount.currency.symbol,
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white.withOpacity(0.4),
                              ),
                            ),
                          ],
                        ),
                        style: GoogleFonts.inter(
                          height: 1.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Gap(16.0),
          const Row(
            children: [
              Expanded(
                child: AccountActionButton(text: 'Pay'),
              ),
              Gap(8.0),
              Expanded(
                child: AccountActionButton(text: 'Deposit'),
              ),
              Gap(8.0),
              Expanded(
                child: AccountActionButton(text: 'Transfer'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AccountCashbackChip extends StatelessWidget {
  const _AccountCashbackChip({
    required this.cashback,
  });

  final AccountCashbackModel cashback;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 2.0,
        horizontal: 6.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF3E3E3E),
            Color(0x00666666),
          ],
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            switch (cashback) {
              AccountCashbackModelRubles() => 'assets/icons/crown.png',
              AccountCashbackModelPoints() => 'assets/icons/star.png',
            },
            width: 10.0,
          ),
          const Gap(2.0),
          Text(
            switch (cashback) {
              AccountCashbackModelRubles() => '${cashback.amount.formatMoney()} ₽',
              AccountCashbackModelPoints() => '${cashback.amount.formatMoney()} points',
            },
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w800,
              fontSize: 10.0,
              letterSpacing: -0.1,
            ),
          ),
        ],
      ),
    );
  }
}

class _AccountActionButtonPlaceholder extends StatelessWidget {
  const _AccountActionButtonPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ShimmerContainerPlaceholder(
        height: 52.0,
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }
}

class AccountActionButton extends StatelessWidget {
  final String text;
  final List<Color>? colors;

  const AccountActionButton({
    required this.text,
    this.colors,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GradientActionButton(
      onTap: () {},
      colors: colors ??
          const [
            Color(0xFF333333),
            Color(0xFF555555),
          ],
      height: 52.0,
      borderRadius: BorderRadius.circular(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 18.0,
            width: 18.0,
            padding: const EdgeInsets.all(3.0),
            decoration: ShapeDecoration(
              color: Colors.white.withOpacity(0.3),
              shape: const CircleBorder(),
            ),
            child: Container(
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.3),
                shape: const CircleBorder(),
              ),
            ),
          ),
          const Gap(4.0),
          Text(
            text,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 12.0,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }
}
