import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/models/transaction.dart';
import '../domain/repositories/transactions_repository.dart';

part 'transactions_bloc.freezed.dart';
part 'transactions_event.dart';
part 'transactions_state.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  final TransactionsRepository _transactionsRepository;

  TransactionsBloc({
    required TransactionsRepository transactionsRepository,
  })  : _transactionsRepository = transactionsRepository,
        super(TransactionsState.initial()) {
    on(_handleFetchTransactions);
  }

  void _handleFetchTransactions(
    _FetchTransactions event,
    Emitter<TransactionsState> emit,
  ) async {
    emit(state.copyWith(
      transactions: null,
    ));

    try {
      final transactions = await _transactionsRepository.getTransactions();
      emit(state.copyWith(
        transactions: transactions,
      ));
    } catch (_) {}
  }
}
