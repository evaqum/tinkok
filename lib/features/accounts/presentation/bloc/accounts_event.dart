part of 'accounts_bloc.dart';

@freezed
class AccountsEvent with _$AccountsEvent {
  const factory AccountsEvent.fetchAccounts() = _FetchAccountsEvent;
  const factory AccountsEvent.refreshAccounts() = _RefreshAccountsEvent;
}
