// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transactions_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TransactionsEvent {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchTransactions value) fetchTransactions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchTransactions value)? fetchTransactions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchTransactions value)? fetchTransactions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionsEventCopyWith<$Res> {
  factory $TransactionsEventCopyWith(
          TransactionsEvent value, $Res Function(TransactionsEvent) then) =
      _$TransactionsEventCopyWithImpl<$Res, TransactionsEvent>;
}

/// @nodoc
class _$TransactionsEventCopyWithImpl<$Res, $Val extends TransactionsEvent>
    implements $TransactionsEventCopyWith<$Res> {
  _$TransactionsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchTransactionsImplCopyWith<$Res> {
  factory _$$FetchTransactionsImplCopyWith(_$FetchTransactionsImpl value,
          $Res Function(_$FetchTransactionsImpl) then) =
      __$$FetchTransactionsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchTransactionsImplCopyWithImpl<$Res>
    extends _$TransactionsEventCopyWithImpl<$Res, _$FetchTransactionsImpl>
    implements _$$FetchTransactionsImplCopyWith<$Res> {
  __$$FetchTransactionsImplCopyWithImpl(_$FetchTransactionsImpl _value,
      $Res Function(_$FetchTransactionsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchTransactionsImpl implements _FetchTransactions {
  const _$FetchTransactionsImpl();

  @override
  String toString() {
    return 'TransactionsEvent.fetchTransactions()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchTransactionsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchTransactions value) fetchTransactions,
  }) {
    return fetchTransactions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchTransactions value)? fetchTransactions,
  }) {
    return fetchTransactions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchTransactions value)? fetchTransactions,
    required TResult orElse(),
  }) {
    if (fetchTransactions != null) {
      return fetchTransactions(this);
    }
    return orElse();
  }
}

abstract class _FetchTransactions implements TransactionsEvent {
  const factory _FetchTransactions() = _$FetchTransactionsImpl;
}

/// @nodoc
mixin _$TransactionsState {
  List<TransactionModel>? get transactions =>
      throw _privateConstructorUsedError;
  TransactionsLoadingStatus get loadingStatus =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionsStateCopyWith<TransactionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionsStateCopyWith<$Res> {
  factory $TransactionsStateCopyWith(
          TransactionsState value, $Res Function(TransactionsState) then) =
      _$TransactionsStateCopyWithImpl<$Res, TransactionsState>;
  @useResult
  $Res call(
      {List<TransactionModel>? transactions,
      TransactionsLoadingStatus loadingStatus});
}

/// @nodoc
class _$TransactionsStateCopyWithImpl<$Res, $Val extends TransactionsState>
    implements $TransactionsStateCopyWith<$Res> {
  _$TransactionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = freezed,
    Object? loadingStatus = null,
  }) {
    return _then(_value.copyWith(
      transactions: freezed == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>?,
      loadingStatus: null == loadingStatus
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as TransactionsLoadingStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionsStateImplCopyWith<$Res>
    implements $TransactionsStateCopyWith<$Res> {
  factory _$$TransactionsStateImplCopyWith(_$TransactionsStateImpl value,
          $Res Function(_$TransactionsStateImpl) then) =
      __$$TransactionsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TransactionModel>? transactions,
      TransactionsLoadingStatus loadingStatus});
}

/// @nodoc
class __$$TransactionsStateImplCopyWithImpl<$Res>
    extends _$TransactionsStateCopyWithImpl<$Res, _$TransactionsStateImpl>
    implements _$$TransactionsStateImplCopyWith<$Res> {
  __$$TransactionsStateImplCopyWithImpl(_$TransactionsStateImpl _value,
      $Res Function(_$TransactionsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = freezed,
    Object? loadingStatus = null,
  }) {
    return _then(_$TransactionsStateImpl(
      transactions: freezed == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>?,
      loadingStatus: null == loadingStatus
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as TransactionsLoadingStatus,
    ));
  }
}

/// @nodoc

class _$TransactionsStateImpl implements _TransactionsState {
  const _$TransactionsStateImpl(
      {required final List<TransactionModel>? transactions,
      required this.loadingStatus})
      : _transactions = transactions;

  final List<TransactionModel>? _transactions;
  @override
  List<TransactionModel>? get transactions {
    final value = _transactions;
    if (value == null) return null;
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final TransactionsLoadingStatus loadingStatus;

  @override
  String toString() {
    return 'TransactionsState(transactions: $transactions, loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionsStateImpl &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions) &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_transactions), loadingStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionsStateImplCopyWith<_$TransactionsStateImpl> get copyWith =>
      __$$TransactionsStateImplCopyWithImpl<_$TransactionsStateImpl>(
          this, _$identity);
}

abstract class _TransactionsState implements TransactionsState {
  const factory _TransactionsState(
          {required final List<TransactionModel>? transactions,
          required final TransactionsLoadingStatus loadingStatus}) =
      _$TransactionsStateImpl;

  @override
  List<TransactionModel>? get transactions;
  @override
  TransactionsLoadingStatus get loadingStatus;
  @override
  @JsonKey(ignore: true)
  _$$TransactionsStateImplCopyWith<_$TransactionsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
