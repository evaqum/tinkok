import 'dart:math';

import 'package:injectable/injectable.dart';

import '../../domain/models/account.dart';
import '../../domain/repositories/account_repository.dart';

@Injectable(as: AccountRepository)
class MockAccountRepository implements AccountRepository {
  late final Random random;

  MockAccountRepository({
    required this.random,
  });

  @override
  Future<List<AccountModel>> getAccounts() async {
    await Future.delayed(Duration(
      milliseconds: 1000 + random.nextInt(5000),
    ));

    return [
      const AccountModel(
        id: 'main',
        name: 'Main account',
        balance: 15.03,
        currency: AccountCurrency.rub,
        type: AccountType.debit,
        cashback: AccountCashbackModel.rubles(1452),
      ),
      const AccountModel(
        id: 'dollar',
        name: 'Dollar account',
        balance: 100.32,
        currency: AccountCurrency.usd,
        type: AccountType.debit,
      ),
      const AccountModel(
        id: 'credit',
        name: 'Credit account',
        balance: 150000,
        currency: AccountCurrency.rub,
        type: AccountType.credit,
        cashback: AccountCashbackModel.points(392),
      ),
    ];
  }
}
