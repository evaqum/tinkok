import 'dart:math';

import 'package:injectable/injectable.dart';

import '../../domain/models/transaction.dart';
import '../../domain/repositories/transactions_repository.dart';

@Injectable(as: TransactionsRepository)
class MockTransactionsRepository implements TransactionsRepository {
  final Random random;

  MockTransactionsRepository({
    required this.random,
  });

  @override
  Future<List<TransactionModel>> getTransactions() async {
    await Future.delayed(Duration(
      milliseconds: 1000 + random.nextInt(5000),
      // seconds: 1000 + random.nextInt(5000),
    ));

    return List.generate(40, (i) {
      final isIncoming = random.nextBool();
      late final status = switch (random.nextDouble()) {
        > 1 / 3 => TransactionStatus.failed,
        > 2 / 3 => TransactionStatus.pending,
        _ => TransactionStatus.success,
      };

      return TransactionModel(
        id: '#$i',
        title: 'Transaction $i',
        category: 'Category $i',
        amount: random.nextInt(200) + 15,
        incoming: isIncoming,
        status: isIncoming ? TransactionStatus.success : status,
      );
    });
  }
}
