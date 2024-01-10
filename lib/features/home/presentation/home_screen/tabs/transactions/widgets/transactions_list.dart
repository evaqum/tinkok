import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../core/utils/format.dart';
import '../../../../../../../core/utils/kt.dart';
import '../../../../../../app/presentation/widgets/shimmer/placeholders/text.dart';
import '../../../../../../app/presentation/widgets/shimmer/shimmer_container.dart';
import '../../../../../../transactions/domain/models/transaction.dart';
import 'transaction_tile.dart';

class HomeTransactionsList extends StatelessWidget {
  final List<TransactionModel>? transactions;

  const HomeTransactionsList({
    super.key,
    required this.transactions,
  });

  const HomeTransactionsList.placeholder({
    super.key,
  }) : transactions = null;

  Widget _itemBuilder(BuildContext context, int index) {
    if (index == 0) {
      return const _TransactionListDate(text: 'Today');
    }

    index -= 1;

    final transaction = transactions![index];

    return HomeTransactionTile(
      amount: transaction.amount.formatMoney(),
      category: transaction.category,
      failed: transaction.status == TransactionStatus.failed,
      isIncome: transaction.incoming,
      name: transaction.title,
    );
  }

  Widget _placeholderBuilder(BuildContext context, int index) {
    final placeholder = switch (index) {
      0 => const _TransactionListDatePlaceholder(),
      _ => HomeTransactionTile.placeholder(),
    };

    return ShimmerContainer(
      placeholder: placeholder,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => const Gap(12.0),
      itemCount: transactions.let((l) => l.length + 1) ?? 20,
      itemBuilder: transactions != null ? _itemBuilder : _placeholderBuilder,
    );
  }
}

class _TransactionListDate extends StatelessWidget {
  final String text;

  const _TransactionListDate({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: Colors.white.withOpacity(0.5),
        height: 1.0,
      ),
    );
  }
}

class _TransactionListDatePlaceholder extends StatelessWidget {
  const _TransactionListDatePlaceholder();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ShimmerTextPlaceholder(
        'Today',
        style: GoogleFonts.inter(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          height: 1.0,
        ),
      ),
    );
  }
}
