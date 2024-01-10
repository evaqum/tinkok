part of 'accounts_bloc.dart';

enum AccountsLoadingStatus {
  initial,
  loading,
  success,
  error,
}

@freezed
class AccountsState with _$AccountsState {
  const factory AccountsState({
    required List<AccountModel>? accounts,
    required AccountsLoadingStatus accountsLoadingStatus,
  }) = _AccountsState;

  factory AccountsState.initial() {
    return const AccountsState(
      accounts: null,
      accountsLoadingStatus: AccountsLoadingStatus.initial,
    );
  }
}
