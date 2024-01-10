// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;
  AccountCurrency get currency => throw _privateConstructorUsedError;
  AccountType get type => throw _privateConstructorUsedError;
  AccountCashbackModel? get cashback => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountModelCopyWith<AccountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountModelCopyWith<$Res> {
  factory $AccountModelCopyWith(
          AccountModel value, $Res Function(AccountModel) then) =
      _$AccountModelCopyWithImpl<$Res, AccountModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      double balance,
      AccountCurrency currency,
      AccountType type,
      AccountCashbackModel? cashback});

  $AccountCashbackModelCopyWith<$Res>? get cashback;
}

/// @nodoc
class _$AccountModelCopyWithImpl<$Res, $Val extends AccountModel>
    implements $AccountModelCopyWith<$Res> {
  _$AccountModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? balance = null,
    Object? currency = null,
    Object? type = null,
    Object? cashback = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as AccountCurrency,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AccountType,
      cashback: freezed == cashback
          ? _value.cashback
          : cashback // ignore: cast_nullable_to_non_nullable
              as AccountCashbackModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AccountCashbackModelCopyWith<$Res>? get cashback {
    if (_value.cashback == null) {
      return null;
    }

    return $AccountCashbackModelCopyWith<$Res>(_value.cashback!, (value) {
      return _then(_value.copyWith(cashback: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AccountModelImplCopyWith<$Res>
    implements $AccountModelCopyWith<$Res> {
  factory _$$AccountModelImplCopyWith(
          _$AccountModelImpl value, $Res Function(_$AccountModelImpl) then) =
      __$$AccountModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      double balance,
      AccountCurrency currency,
      AccountType type,
      AccountCashbackModel? cashback});

  @override
  $AccountCashbackModelCopyWith<$Res>? get cashback;
}

/// @nodoc
class __$$AccountModelImplCopyWithImpl<$Res>
    extends _$AccountModelCopyWithImpl<$Res, _$AccountModelImpl>
    implements _$$AccountModelImplCopyWith<$Res> {
  __$$AccountModelImplCopyWithImpl(
      _$AccountModelImpl _value, $Res Function(_$AccountModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? balance = null,
    Object? currency = null,
    Object? type = null,
    Object? cashback = freezed,
  }) {
    return _then(_$AccountModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as AccountCurrency,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AccountType,
      cashback: freezed == cashback
          ? _value.cashback
          : cashback // ignore: cast_nullable_to_non_nullable
              as AccountCashbackModel?,
    ));
  }
}

/// @nodoc

class _$AccountModelImpl extends _AccountModel {
  const _$AccountModelImpl(
      {required this.id,
      required this.name,
      required this.balance,
      required this.currency,
      required this.type,
      this.cashback})
      : super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final double balance;
  @override
  final AccountCurrency currency;
  @override
  final AccountType type;
  @override
  final AccountCashbackModel? cashback;

  @override
  String toString() {
    return 'AccountModel(id: $id, name: $name, balance: $balance, currency: $currency, type: $type, cashback: $cashback)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.cashback, cashback) ||
                other.cashback == cashback));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, balance, currency, type, cashback);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountModelImplCopyWith<_$AccountModelImpl> get copyWith =>
      __$$AccountModelImplCopyWithImpl<_$AccountModelImpl>(this, _$identity);
}

abstract class _AccountModel extends AccountModel {
  const factory _AccountModel(
      {required final String id,
      required final String name,
      required final double balance,
      required final AccountCurrency currency,
      required final AccountType type,
      final AccountCashbackModel? cashback}) = _$AccountModelImpl;
  const _AccountModel._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  double get balance;
  @override
  AccountCurrency get currency;
  @override
  AccountType get type;
  @override
  AccountCashbackModel? get cashback;
  @override
  @JsonKey(ignore: true)
  _$$AccountModelImplCopyWith<_$AccountModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AccountCashbackModel {
  int get amount => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountCashbackModelRubles value) rubles,
    required TResult Function(AccountCashbackModelPoints value) points,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountCashbackModelRubles value)? rubles,
    TResult? Function(AccountCashbackModelPoints value)? points,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountCashbackModelRubles value)? rubles,
    TResult Function(AccountCashbackModelPoints value)? points,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountCashbackModelCopyWith<AccountCashbackModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountCashbackModelCopyWith<$Res> {
  factory $AccountCashbackModelCopyWith(AccountCashbackModel value,
          $Res Function(AccountCashbackModel) then) =
      _$AccountCashbackModelCopyWithImpl<$Res, AccountCashbackModel>;
  @useResult
  $Res call({int amount});
}

/// @nodoc
class _$AccountCashbackModelCopyWithImpl<$Res,
        $Val extends AccountCashbackModel>
    implements $AccountCashbackModelCopyWith<$Res> {
  _$AccountCashbackModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountCashbackModelRublesImplCopyWith<$Res>
    implements $AccountCashbackModelCopyWith<$Res> {
  factory _$$AccountCashbackModelRublesImplCopyWith(
          _$AccountCashbackModelRublesImpl value,
          $Res Function(_$AccountCashbackModelRublesImpl) then) =
      __$$AccountCashbackModelRublesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int amount});
}

/// @nodoc
class __$$AccountCashbackModelRublesImplCopyWithImpl<$Res>
    extends _$AccountCashbackModelCopyWithImpl<$Res,
        _$AccountCashbackModelRublesImpl>
    implements _$$AccountCashbackModelRublesImplCopyWith<$Res> {
  __$$AccountCashbackModelRublesImplCopyWithImpl(
      _$AccountCashbackModelRublesImpl _value,
      $Res Function(_$AccountCashbackModelRublesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
  }) {
    return _then(_$AccountCashbackModelRublesImpl(
      null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AccountCashbackModelRublesImpl implements AccountCashbackModelRubles {
  const _$AccountCashbackModelRublesImpl(this.amount);

  @override
  final int amount;

  @override
  String toString() {
    return 'AccountCashbackModel.rubles(amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountCashbackModelRublesImpl &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountCashbackModelRublesImplCopyWith<_$AccountCashbackModelRublesImpl>
      get copyWith => __$$AccountCashbackModelRublesImplCopyWithImpl<
          _$AccountCashbackModelRublesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountCashbackModelRubles value) rubles,
    required TResult Function(AccountCashbackModelPoints value) points,
  }) {
    return rubles(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountCashbackModelRubles value)? rubles,
    TResult? Function(AccountCashbackModelPoints value)? points,
  }) {
    return rubles?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountCashbackModelRubles value)? rubles,
    TResult Function(AccountCashbackModelPoints value)? points,
    required TResult orElse(),
  }) {
    if (rubles != null) {
      return rubles(this);
    }
    return orElse();
  }
}

abstract class AccountCashbackModelRubles implements AccountCashbackModel {
  const factory AccountCashbackModelRubles(final int amount) =
      _$AccountCashbackModelRublesImpl;

  @override
  int get amount;
  @override
  @JsonKey(ignore: true)
  _$$AccountCashbackModelRublesImplCopyWith<_$AccountCashbackModelRublesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccountCashbackModelPointsImplCopyWith<$Res>
    implements $AccountCashbackModelCopyWith<$Res> {
  factory _$$AccountCashbackModelPointsImplCopyWith(
          _$AccountCashbackModelPointsImpl value,
          $Res Function(_$AccountCashbackModelPointsImpl) then) =
      __$$AccountCashbackModelPointsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int amount});
}

/// @nodoc
class __$$AccountCashbackModelPointsImplCopyWithImpl<$Res>
    extends _$AccountCashbackModelCopyWithImpl<$Res,
        _$AccountCashbackModelPointsImpl>
    implements _$$AccountCashbackModelPointsImplCopyWith<$Res> {
  __$$AccountCashbackModelPointsImplCopyWithImpl(
      _$AccountCashbackModelPointsImpl _value,
      $Res Function(_$AccountCashbackModelPointsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
  }) {
    return _then(_$AccountCashbackModelPointsImpl(
      null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AccountCashbackModelPointsImpl implements AccountCashbackModelPoints {
  const _$AccountCashbackModelPointsImpl(this.amount);

  @override
  final int amount;

  @override
  String toString() {
    return 'AccountCashbackModel.points(amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountCashbackModelPointsImpl &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountCashbackModelPointsImplCopyWith<_$AccountCashbackModelPointsImpl>
      get copyWith => __$$AccountCashbackModelPointsImplCopyWithImpl<
          _$AccountCashbackModelPointsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountCashbackModelRubles value) rubles,
    required TResult Function(AccountCashbackModelPoints value) points,
  }) {
    return points(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountCashbackModelRubles value)? rubles,
    TResult? Function(AccountCashbackModelPoints value)? points,
  }) {
    return points?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountCashbackModelRubles value)? rubles,
    TResult Function(AccountCashbackModelPoints value)? points,
    required TResult orElse(),
  }) {
    if (points != null) {
      return points(this);
    }
    return orElse();
  }
}

abstract class AccountCashbackModelPoints implements AccountCashbackModel {
  const factory AccountCashbackModelPoints(final int amount) =
      _$AccountCashbackModelPointsImpl;

  @override
  int get amount;
  @override
  @JsonKey(ignore: true)
  _$$AccountCashbackModelPointsImplCopyWith<_$AccountCashbackModelPointsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
