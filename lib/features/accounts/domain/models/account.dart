import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';

enum AccountCurrency {
  rub('₽'),
  usd('\$'),
  eur('€'),
  gbp('£');

  final String symbol;

  const AccountCurrency(this.symbol);
}

enum AccountType {
  debit,
  credit,
}

@freezed
class AccountModel with _$AccountModel {
  const AccountModel._();

  const factory AccountModel({
    required String id,
    required String name,
    required double balance,
    required AccountCurrency currency,
    required AccountType type,
    AccountCashbackModel? cashback,
  }) = _AccountModel;
}

@freezed
sealed class AccountCashbackModel with _$AccountCashbackModel {
  const factory AccountCashbackModel.rubles(int amount) = AccountCashbackModelRubles;
  const factory AccountCashbackModel.points(int amount) = AccountCashbackModelPoints;
}
