// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accounts_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountsEvent {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAccountsEvent value) fetchAccounts,
    required TResult Function(_RefreshAccountsEvent value) refreshAccounts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAccountsEvent value)? fetchAccounts,
    TResult? Function(_RefreshAccountsEvent value)? refreshAccounts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAccountsEvent value)? fetchAccounts,
    TResult Function(_RefreshAccountsEvent value)? refreshAccounts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountsEventCopyWith<$Res> {
  factory $AccountsEventCopyWith(
          AccountsEvent value, $Res Function(AccountsEvent) then) =
      _$AccountsEventCopyWithImpl<$Res, AccountsEvent>;
}

/// @nodoc
class _$AccountsEventCopyWithImpl<$Res, $Val extends AccountsEvent>
    implements $AccountsEventCopyWith<$Res> {
  _$AccountsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchAccountsEventImplCopyWith<$Res> {
  factory _$$FetchAccountsEventImplCopyWith(_$FetchAccountsEventImpl value,
          $Res Function(_$FetchAccountsEventImpl) then) =
      __$$FetchAccountsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchAccountsEventImplCopyWithImpl<$Res>
    extends _$AccountsEventCopyWithImpl<$Res, _$FetchAccountsEventImpl>
    implements _$$FetchAccountsEventImplCopyWith<$Res> {
  __$$FetchAccountsEventImplCopyWithImpl(_$FetchAccountsEventImpl _value,
      $Res Function(_$FetchAccountsEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchAccountsEventImpl implements _FetchAccountsEvent {
  const _$FetchAccountsEventImpl();

  @override
  String toString() {
    return 'AccountsEvent.fetchAccounts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchAccountsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAccountsEvent value) fetchAccounts,
    required TResult Function(_RefreshAccountsEvent value) refreshAccounts,
  }) {
    return fetchAccounts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAccountsEvent value)? fetchAccounts,
    TResult? Function(_RefreshAccountsEvent value)? refreshAccounts,
  }) {
    return fetchAccounts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAccountsEvent value)? fetchAccounts,
    TResult Function(_RefreshAccountsEvent value)? refreshAccounts,
    required TResult orElse(),
  }) {
    if (fetchAccounts != null) {
      return fetchAccounts(this);
    }
    return orElse();
  }
}

abstract class _FetchAccountsEvent implements AccountsEvent {
  const factory _FetchAccountsEvent() = _$FetchAccountsEventImpl;
}

/// @nodoc
abstract class _$$RefreshAccountsEventImplCopyWith<$Res> {
  factory _$$RefreshAccountsEventImplCopyWith(_$RefreshAccountsEventImpl value,
          $Res Function(_$RefreshAccountsEventImpl) then) =
      __$$RefreshAccountsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshAccountsEventImplCopyWithImpl<$Res>
    extends _$AccountsEventCopyWithImpl<$Res, _$RefreshAccountsEventImpl>
    implements _$$RefreshAccountsEventImplCopyWith<$Res> {
  __$$RefreshAccountsEventImplCopyWithImpl(_$RefreshAccountsEventImpl _value,
      $Res Function(_$RefreshAccountsEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RefreshAccountsEventImpl implements _RefreshAccountsEvent {
  const _$RefreshAccountsEventImpl();

  @override
  String toString() {
    return 'AccountsEvent.refreshAccounts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshAccountsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAccountsEvent value) fetchAccounts,
    required TResult Function(_RefreshAccountsEvent value) refreshAccounts,
  }) {
    return refreshAccounts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAccountsEvent value)? fetchAccounts,
    TResult? Function(_RefreshAccountsEvent value)? refreshAccounts,
  }) {
    return refreshAccounts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAccountsEvent value)? fetchAccounts,
    TResult Function(_RefreshAccountsEvent value)? refreshAccounts,
    required TResult orElse(),
  }) {
    if (refreshAccounts != null) {
      return refreshAccounts(this);
    }
    return orElse();
  }
}

abstract class _RefreshAccountsEvent implements AccountsEvent {
  const factory _RefreshAccountsEvent() = _$RefreshAccountsEventImpl;
}

/// @nodoc
mixin _$AccountsState {
  List<AccountModel>? get accounts => throw _privateConstructorUsedError;
  AccountsLoadingStatus get accountsLoadingStatus =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountsStateCopyWith<AccountsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountsStateCopyWith<$Res> {
  factory $AccountsStateCopyWith(
          AccountsState value, $Res Function(AccountsState) then) =
      _$AccountsStateCopyWithImpl<$Res, AccountsState>;
  @useResult
  $Res call(
      {List<AccountModel>? accounts,
      AccountsLoadingStatus accountsLoadingStatus});
}

/// @nodoc
class _$AccountsStateCopyWithImpl<$Res, $Val extends AccountsState>
    implements $AccountsStateCopyWith<$Res> {
  _$AccountsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accounts = freezed,
    Object? accountsLoadingStatus = null,
  }) {
    return _then(_value.copyWith(
      accounts: freezed == accounts
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<AccountModel>?,
      accountsLoadingStatus: null == accountsLoadingStatus
          ? _value.accountsLoadingStatus
          : accountsLoadingStatus // ignore: cast_nullable_to_non_nullable
              as AccountsLoadingStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountsStateImplCopyWith<$Res>
    implements $AccountsStateCopyWith<$Res> {
  factory _$$AccountsStateImplCopyWith(
          _$AccountsStateImpl value, $Res Function(_$AccountsStateImpl) then) =
      __$$AccountsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<AccountModel>? accounts,
      AccountsLoadingStatus accountsLoadingStatus});
}

/// @nodoc
class __$$AccountsStateImplCopyWithImpl<$Res>
    extends _$AccountsStateCopyWithImpl<$Res, _$AccountsStateImpl>
    implements _$$AccountsStateImplCopyWith<$Res> {
  __$$AccountsStateImplCopyWithImpl(
      _$AccountsStateImpl _value, $Res Function(_$AccountsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accounts = freezed,
    Object? accountsLoadingStatus = null,
  }) {
    return _then(_$AccountsStateImpl(
      accounts: freezed == accounts
          ? _value._accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<AccountModel>?,
      accountsLoadingStatus: null == accountsLoadingStatus
          ? _value.accountsLoadingStatus
          : accountsLoadingStatus // ignore: cast_nullable_to_non_nullable
              as AccountsLoadingStatus,
    ));
  }
}

/// @nodoc

class _$AccountsStateImpl implements _AccountsState {
  const _$AccountsStateImpl(
      {required final List<AccountModel>? accounts,
      required this.accountsLoadingStatus})
      : _accounts = accounts;

  final List<AccountModel>? _accounts;
  @override
  List<AccountModel>? get accounts {
    final value = _accounts;
    if (value == null) return null;
    if (_accounts is EqualUnmodifiableListView) return _accounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final AccountsLoadingStatus accountsLoadingStatus;

  @override
  String toString() {
    return 'AccountsState(accounts: $accounts, accountsLoadingStatus: $accountsLoadingStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountsStateImpl &&
            const DeepCollectionEquality().equals(other._accounts, _accounts) &&
            (identical(other.accountsLoadingStatus, accountsLoadingStatus) ||
                other.accountsLoadingStatus == accountsLoadingStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_accounts), accountsLoadingStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountsStateImplCopyWith<_$AccountsStateImpl> get copyWith =>
      __$$AccountsStateImplCopyWithImpl<_$AccountsStateImpl>(this, _$identity);
}

abstract class _AccountsState implements AccountsState {
  const factory _AccountsState(
          {required final List<AccountModel>? accounts,
          required final AccountsLoadingStatus accountsLoadingStatus}) =
      _$AccountsStateImpl;

  @override
  List<AccountModel>? get accounts;
  @override
  AccountsLoadingStatus get accountsLoadingStatus;
  @override
  @JsonKey(ignore: true)
  _$$AccountsStateImplCopyWith<_$AccountsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
