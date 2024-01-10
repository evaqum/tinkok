import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';

enum TransactionStatus { pending, success, failed }

@freezed
class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    required String id,
    required String title,
    required String category,
    required double amount,
    required TransactionStatus status,
    required bool incoming,
  }) = _TransactionModel;
}
