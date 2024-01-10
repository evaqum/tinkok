import '../models/transaction.dart';

abstract interface class TransactionsRepository {
  Future<List<TransactionModel>> getTransactions();
}
