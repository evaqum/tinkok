// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'security_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SecurityEvent {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Unlocked value) unlocked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Unlocked value)? unlocked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Unlocked value)? unlocked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecurityEventCopyWith<$Res> {
  factory $SecurityEventCopyWith(
          SecurityEvent value, $Res Function(SecurityEvent) then) =
      _$SecurityEventCopyWithImpl<$Res, SecurityEvent>;
}

/// @nodoc
class _$SecurityEventCopyWithImpl<$Res, $Val extends SecurityEvent>
    implements $SecurityEventCopyWith<$Res> {
  _$SecurityEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitializedImplCopyWith<$Res> {
  factory _$$InitializedImplCopyWith(
          _$InitializedImpl value, $Res Function(_$InitializedImpl) then) =
      __$$InitializedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$SecurityEventCopyWithImpl<$Res, _$InitializedImpl>
    implements _$$InitializedImplCopyWith<$Res> {
  __$$InitializedImplCopyWithImpl(
      _$InitializedImpl _value, $Res Function(_$InitializedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitializedImpl implements _Initialized {
  const _$InitializedImpl();

  @override
  String toString() {
    return 'SecurityEvent.initialized()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitializedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Unlocked value) unlocked,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Unlocked value)? unlocked,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Unlocked value)? unlocked,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements SecurityEvent {
  const factory _Initialized() = _$InitializedImpl;
}

/// @nodoc
abstract class _$$UnlockedImplCopyWith<$Res> {
  factory _$$UnlockedImplCopyWith(
          _$UnlockedImpl value, $Res Function(_$UnlockedImpl) then) =
      __$$UnlockedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnlockedImplCopyWithImpl<$Res>
    extends _$SecurityEventCopyWithImpl<$Res, _$UnlockedImpl>
    implements _$$UnlockedImplCopyWith<$Res> {
  __$$UnlockedImplCopyWithImpl(
      _$UnlockedImpl _value, $Res Function(_$UnlockedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnlockedImpl implements _Unlocked {
  const _$UnlockedImpl();

  @override
  String toString() {
    return 'SecurityEvent.unlocked()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnlockedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Unlocked value) unlocked,
  }) {
    return unlocked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Unlocked value)? unlocked,
  }) {
    return unlocked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Unlocked value)? unlocked,
    required TResult orElse(),
  }) {
    if (unlocked != null) {
      return unlocked(this);
    }
    return orElse();
  }
}

abstract class _Unlocked implements SecurityEvent {
  const factory _Unlocked() = _$UnlockedImpl;
}

/// @nodoc
mixin _$SecurityState {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SecurityStateInitial value) initial,
    required TResult Function(SecurityStateUnlocked value) unlocked,
    required TResult Function(SecurityStateLocked value) locked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SecurityStateInitial value)? initial,
    TResult? Function(SecurityStateUnlocked value)? unlocked,
    TResult? Function(SecurityStateLocked value)? locked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SecurityStateInitial value)? initial,
    TResult Function(SecurityStateUnlocked value)? unlocked,
    TResult Function(SecurityStateLocked value)? locked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecurityStateCopyWith<$Res> {
  factory $SecurityStateCopyWith(
          SecurityState value, $Res Function(SecurityState) then) =
      _$SecurityStateCopyWithImpl<$Res, SecurityState>;
}

/// @nodoc
class _$SecurityStateCopyWithImpl<$Res, $Val extends SecurityState>
    implements $SecurityStateCopyWith<$Res> {
  _$SecurityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SecurityStateInitialImplCopyWith<$Res> {
  factory _$$SecurityStateInitialImplCopyWith(_$SecurityStateInitialImpl value,
          $Res Function(_$SecurityStateInitialImpl) then) =
      __$$SecurityStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SecurityStateInitialImplCopyWithImpl<$Res>
    extends _$SecurityStateCopyWithImpl<$Res, _$SecurityStateInitialImpl>
    implements _$$SecurityStateInitialImplCopyWith<$Res> {
  __$$SecurityStateInitialImplCopyWithImpl(_$SecurityStateInitialImpl _value,
      $Res Function(_$SecurityStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SecurityStateInitialImpl implements SecurityStateInitial {
  const _$SecurityStateInitialImpl();

  @override
  String toString() {
    return 'SecurityState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SecurityStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SecurityStateInitial value) initial,
    required TResult Function(SecurityStateUnlocked value) unlocked,
    required TResult Function(SecurityStateLocked value) locked,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SecurityStateInitial value)? initial,
    TResult? Function(SecurityStateUnlocked value)? unlocked,
    TResult? Function(SecurityStateLocked value)? locked,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SecurityStateInitial value)? initial,
    TResult Function(SecurityStateUnlocked value)? unlocked,
    TResult Function(SecurityStateLocked value)? locked,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class SecurityStateInitial implements SecurityState {
  const factory SecurityStateInitial() = _$SecurityStateInitialImpl;
}

/// @nodoc
abstract class _$$SecurityStateUnlockedImplCopyWith<$Res> {
  factory _$$SecurityStateUnlockedImplCopyWith(
          _$SecurityStateUnlockedImpl value,
          $Res Function(_$SecurityStateUnlockedImpl) then) =
      __$$SecurityStateUnlockedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SecurityStateUnlockedImplCopyWithImpl<$Res>
    extends _$SecurityStateCopyWithImpl<$Res, _$SecurityStateUnlockedImpl>
    implements _$$SecurityStateUnlockedImplCopyWith<$Res> {
  __$$SecurityStateUnlockedImplCopyWithImpl(_$SecurityStateUnlockedImpl _value,
      $Res Function(_$SecurityStateUnlockedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SecurityStateUnlockedImpl implements SecurityStateUnlocked {
  const _$SecurityStateUnlockedImpl();

  @override
  String toString() {
    return 'SecurityState.unlocked()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SecurityStateUnlockedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SecurityStateInitial value) initial,
    required TResult Function(SecurityStateUnlocked value) unlocked,
    required TResult Function(SecurityStateLocked value) locked,
  }) {
    return unlocked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SecurityStateInitial value)? initial,
    TResult? Function(SecurityStateUnlocked value)? unlocked,
    TResult? Function(SecurityStateLocked value)? locked,
  }) {
    return unlocked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SecurityStateInitial value)? initial,
    TResult Function(SecurityStateUnlocked value)? unlocked,
    TResult Function(SecurityStateLocked value)? locked,
    required TResult orElse(),
  }) {
    if (unlocked != null) {
      return unlocked(this);
    }
    return orElse();
  }
}

abstract class SecurityStateUnlocked implements SecurityState {
  const factory SecurityStateUnlocked() = _$SecurityStateUnlockedImpl;
}

/// @nodoc
abstract class _$$SecurityStateLockedImplCopyWith<$Res> {
  factory _$$SecurityStateLockedImplCopyWith(_$SecurityStateLockedImpl value,
          $Res Function(_$SecurityStateLockedImpl) then) =
      __$$SecurityStateLockedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SecurityStateLockedImplCopyWithImpl<$Res>
    extends _$SecurityStateCopyWithImpl<$Res, _$SecurityStateLockedImpl>
    implements _$$SecurityStateLockedImplCopyWith<$Res> {
  __$$SecurityStateLockedImplCopyWithImpl(_$SecurityStateLockedImpl _value,
      $Res Function(_$SecurityStateLockedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SecurityStateLockedImpl implements SecurityStateLocked {
  const _$SecurityStateLockedImpl();

  @override
  String toString() {
    return 'SecurityState.locked()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SecurityStateLockedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SecurityStateInitial value) initial,
    required TResult Function(SecurityStateUnlocked value) unlocked,
    required TResult Function(SecurityStateLocked value) locked,
  }) {
    return locked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SecurityStateInitial value)? initial,
    TResult? Function(SecurityStateUnlocked value)? unlocked,
    TResult? Function(SecurityStateLocked value)? locked,
  }) {
    return locked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SecurityStateInitial value)? initial,
    TResult Function(SecurityStateUnlocked value)? unlocked,
    TResult Function(SecurityStateLocked value)? locked,
    required TResult orElse(),
  }) {
    if (locked != null) {
      return locked(this);
    }
    return orElse();
  }
}

abstract class SecurityStateLocked implements SecurityState {
  const factory SecurityStateLocked() = _$SecurityStateLockedImpl;
}
