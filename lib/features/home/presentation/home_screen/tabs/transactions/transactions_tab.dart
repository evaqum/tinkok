import 'package:bloc_hooks/bloc_hooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../transactions/bloc/transactions_bloc.dart';
import 'widgets/transactions_list.dart';

class HomeTransactionsTab extends HookWidget {
  const HomeTransactionsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = useBlocSelector(
      (TransactionsBloc _, TransactionsState state) => state.transactions,
    );
    if (transactions == null) {
      return const HomeTransactionsList.placeholder();
    }

    return HomeTransactionsList(
      transactions: transactions,
    );
  }
}
