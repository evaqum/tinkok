import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../app/presentation/widgets/shimmer/placeholders/circle.dart';
import '../../../../../../app/presentation/widgets/shimmer/placeholders/text.dart';

class HomeTransactionTile extends StatelessWidget {
  final IconData icon;
  final String name;
  final String category;
  final bool isIncome;
  final String amount;
  final bool failed;

  HomeTransactionTile({
    super.key,
    this.icon = Icons.receipt,
    this.name = 'Chich',
    this.category = 'Transfer',
    this.isIncome = false,
    this.amount = '100',
    this.failed = false,
  });

  static Widget placeholder() {
    return const _TransactionTilePlaceholder();
  }

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
        SizedBox(
          height: 40.0,
          width: 40.0,
          child: DecoratedBox(
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
              TextSpan(
                children: [
                  TextSpan(text: '${isIncome ? '+' : '-'} $amount '),
                  TextSpan(
                    text: '₽',
                    style: TextStyle(color: Colors.white.withOpacity(0.3)),
                  ),
                ],
              ),
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
              ),
            ],
          ],
        ),
      ],
    );
  }
}

class _TransactionTilePlaceholder extends StatelessWidget {
  const _TransactionTilePlaceholder();

  @override
  Widget build(BuildContext context) {
    final transactionNameStyle = GoogleFonts.inter(
      fontSize: 15.0,
      fontWeight: FontWeight.w800,
      height: 1.0,
    );
    final transactionCategoryStyle = GoogleFonts.inter(
      fontSize: 13.0,
      fontWeight: FontWeight.w500,
      height: 1.0,
    );

    return Row(
      children: [
        const ShimmerCirclePlaceholder(diameter: 40.0),
        const Gap(12.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerTextPlaceholder(
              'Transfer to someone idk',
              style: transactionNameStyle,
            ),
            const Gap(4.0),
            ShimmerTextPlaceholder(
              'Transfers',
              style: transactionCategoryStyle,
            ),
          ],
        ),
        const Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ShimmerTextPlaceholder(
              '1 000 ₽',
              style: GoogleFonts.inter(
                fontSize: 15.0,
                height: 1.0,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
