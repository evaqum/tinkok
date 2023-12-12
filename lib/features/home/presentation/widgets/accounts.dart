import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tinkok/core/utils/range.dart';
import 'package:tinkok/features/app/presentation/tinkok_icons.dart';

import '../../../app/presentation/widgets/animated_text.dart';
import 'gradient_action_button.dart';
import 'tab_button.dart';

class HomeScreenAccounts extends HookWidget {
  const HomeScreenAccounts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final accountIndex = useState(0);
    final currentAccount = accounts[accountIndex.value];

    return SliverList.list(
      children: [
        Row(
          children: [
            for (final i in intRange(accounts.length)) ...[
              GestureDetector(
                onTap: () => accountIndex.value = i,
                child: HomeScreenTabButton(
                  icon: accounts[i].icon,
                  isActive: i == accountIndex.value,
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
        ),
        const Gap(16.0),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
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
              Row(
                children: [
                  AnimatedText(
                    currentAccount.name,
                    alignment: AnimatedTextAlignment.left,
                    style: GoogleFonts.inter(
                      color: Colors.white.withOpacity(0.4),
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                    ),
                  ),
                  const Gap(8.0),
                  if (currentAccount.cashback != null)
                    Container(
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
                            currentAccount.cashback!.isPoints ? 'assets/icons/star.png' : 'assets/icons/crown.png',
                            width: 10.0,
                          ),
                          const Gap(2.0),
                          Text(
                            '${currentAccount.cashback!.amount} ${currentAccount.cashback!.isPoints ? 'points' : '₽'}',
                            style: GoogleFonts.inter(fontWeight: FontWeight.w800, fontSize: 10.0, letterSpacing: -0.1),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
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
                      key: ValueKey(accountIndex.value),
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '${currentAccount.balance} ',
                            style: const TextStyle(
                              fontSize: 32.0,
                            ),
                          ),
                          TextSpan(
                            text: currentAccount.currency,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white.withOpacity(0.4),
                            ),
                          ),
                        ],
                      ),
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
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
        ),
        // Row(
        //   children: [
        //     for (final i in range(3)) ...[
        //       GestureDetector(
        //         // onTap: () => accountIndex.value = i,
        //         child: _AccountIcon(
        //           isActive: i == 0,
        //         ),
        //       ),
        //       if (i != 2) const Gap(8.0),
        //     ],
        //   ],
        // ),
      ],
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

const accounts = <_Account>[
  _Account(
    name: 'Main account',
    balance: '20 492.20',
    currency: '₽',
    cashback: _Cashback(
      amount: '1 452',
    ),
    icon: Tinkok.ruble,
  ),
  _Account(
    name: 'Credit account',
    balance: '150 000',
    currency: '₽',
    cashback: _Cashback(
      amount: '392',
      isPoints: true,
    ),
    icon: Tinkok.percent,
  ),
  _Account(
    name: 'Burger account',
    balance: '15',
    currency: r'$',
    icon: Tinkok.dollar,
  ),
];

class _Account {
  final String name;
  final String balance;
  final String currency;
  final _Cashback? cashback;
  final IconData icon;

  const _Account({
    required this.name,
    required this.balance,
    required this.currency,
    this.cashback,
    this.icon = Tinkok.star,
  });
}

class _Cashback {
  final String amount;
  final bool isPoints;

  const _Cashback({
    required this.amount,
    this.isPoints = false,
  });
}
