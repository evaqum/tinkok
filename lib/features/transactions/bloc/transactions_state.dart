part of 'transactions_bloc.dart';

enum TransactionsLoadingStatus {
  initial,
  loading,
  success,
  error,
}

@freezed
class TransactionsState with _$TransactionsState {
  const factory TransactionsState({
    required List<TransactionModel>? transactions,
    required TransactionsLoadingStatus loadingStatus,
  }) = _TransactionsState;
  factory TransactionsState.initial() {
    return const TransactionsState(
      transactions: null,
      loadingStatus: TransactionsLoadingStatus.initial,
    );
  }
}
