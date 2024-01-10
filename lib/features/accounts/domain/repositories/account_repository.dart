import '../models/account.dart';

abstract interface class AccountRepository {
  Future<List<AccountModel>> getAccounts();
}
