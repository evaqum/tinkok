import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/account.dart';
import '../../domain/repositories/account_repository.dart';

part 'accounts_bloc.freezed.dart';
part 'accounts_event.dart';
part 'accounts_state.dart';

class AccountsBloc extends Bloc<AccountsEvent, AccountsState> {
  final AccountRepository accountRepository;

  AccountsBloc({
    required this.accountRepository,
  }) : super(AccountsState.initial()) {
    on(_handleFetchAccountsEvent);
    on(_handleRefreshAccountsEvent);
  }

  void _handleRefreshAccountsEvent(
    _RefreshAccountsEvent event,
    Emitter<AccountsState> emit,
  ) {
    emit(state.copyWith(
      accounts: null,
    ));

    add(const AccountsEvent.fetchAccounts());
  }

  void _handleFetchAccountsEvent(
    _FetchAccountsEvent event,
    Emitter<AccountsState> emit,
  ) async {
    emit(state.copyWith(
      accountsLoadingStatus: AccountsLoadingStatus.loading,
    ));

    try {
      final accounts = await accountRepository.getAccounts();

      emit(state.copyWith(
        accounts: accounts,
        accountsLoadingStatus: AccountsLoadingStatus.success,
      ));
    } catch (_) {
      emit(state.copyWith(
        accounts: null,
        accountsLoadingStatus: AccountsLoadingStatus.error,
      ));
    }
  }
}
