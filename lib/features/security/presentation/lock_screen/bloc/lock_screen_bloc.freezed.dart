// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lock_screen_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LockScreenEvent {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DigitEntered value) digitEntered,
    required TResult Function(_BackspacePressed value) backspacePressed,
    required TResult Function(_FinishedEntering value) finishedEntering,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DigitEntered value)? digitEntered,
    TResult? Function(_BackspacePressed value)? backspacePressed,
    TResult? Function(_FinishedEntering value)? finishedEntering,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DigitEntered value)? digitEntered,
    TResult Function(_BackspacePressed value)? backspacePressed,
    TResult Function(_FinishedEntering value)? finishedEntering,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LockScreenEventCopyWith<$Res> {
  factory $LockScreenEventCopyWith(
          LockScreenEvent value, $Res Function(LockScreenEvent) then) =
      _$LockScreenEventCopyWithImpl<$Res, LockScreenEvent>;
}

/// @nodoc
class _$LockScreenEventCopyWithImpl<$Res, $Val extends LockScreenEvent>
    implements $LockScreenEventCopyWith<$Res> {
  _$LockScreenEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DigitEnteredImplCopyWith<$Res> {
  factory _$$DigitEnteredImplCopyWith(
          _$DigitEnteredImpl value, $Res Function(_$DigitEnteredImpl) then) =
      __$$DigitEnteredImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String digit});
}

/// @nodoc
class __$$DigitEnteredImplCopyWithImpl<$Res>
    extends _$LockScreenEventCopyWithImpl<$Res, _$DigitEnteredImpl>
    implements _$$DigitEnteredImplCopyWith<$Res> {
  __$$DigitEnteredImplCopyWithImpl(
      _$DigitEnteredImpl _value, $Res Function(_$DigitEnteredImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? digit = null,
  }) {
    return _then(_$DigitEnteredImpl(
      null == digit
          ? _value.digit
          : digit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DigitEnteredImpl implements _DigitEntered {
  const _$DigitEnteredImpl(this.digit);

  @override
  final String digit;

  @override
  String toString() {
    return 'LockScreenEvent.digitEntered(digit: $digit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DigitEnteredImpl &&
            (identical(other.digit, digit) || other.digit == digit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, digit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DigitEnteredImplCopyWith<_$DigitEnteredImpl> get copyWith =>
      __$$DigitEnteredImplCopyWithImpl<_$DigitEnteredImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DigitEntered value) digitEntered,
    required TResult Function(_BackspacePressed value) backspacePressed,
    required TResult Function(_FinishedEntering value) finishedEntering,
  }) {
    return digitEntered(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DigitEntered value)? digitEntered,
    TResult? Function(_BackspacePressed value)? backspacePressed,
    TResult? Function(_FinishedEntering value)? finishedEntering,
  }) {
    return digitEntered?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DigitEntered value)? digitEntered,
    TResult Function(_BackspacePressed value)? backspacePressed,
    TResult Function(_FinishedEntering value)? finishedEntering,
    required TResult orElse(),
  }) {
    if (digitEntered != null) {
      return digitEntered(this);
    }
    return orElse();
  }
}

abstract class _DigitEntered implements LockScreenEvent {
  const factory _DigitEntered(final String digit) = _$DigitEnteredImpl;

  String get digit;
  @JsonKey(ignore: true)
  _$$DigitEnteredImplCopyWith<_$DigitEnteredImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BackspacePressedImplCopyWith<$Res> {
  factory _$$BackspacePressedImplCopyWith(_$BackspacePressedImpl value,
          $Res Function(_$BackspacePressedImpl) then) =
      __$$BackspacePressedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BackspacePressedImplCopyWithImpl<$Res>
    extends _$LockScreenEventCopyWithImpl<$Res, _$BackspacePressedImpl>
    implements _$$BackspacePressedImplCopyWith<$Res> {
  __$$BackspacePressedImplCopyWithImpl(_$BackspacePressedImpl _value,
      $Res Function(_$BackspacePressedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BackspacePressedImpl implements _BackspacePressed {
  const _$BackspacePressedImpl();

  @override
  String toString() {
    return 'LockScreenEvent.backspacePressed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BackspacePressedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DigitEntered value) digitEntered,
    required TResult Function(_BackspacePressed value) backspacePressed,
    required TResult Function(_FinishedEntering value) finishedEntering,
  }) {
    return backspacePressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DigitEntered value)? digitEntered,
    TResult? Function(_BackspacePressed value)? backspacePressed,
    TResult? Function(_FinishedEntering value)? finishedEntering,
  }) {
    return backspacePressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DigitEntered value)? digitEntered,
    TResult Function(_BackspacePressed value)? backspacePressed,
    TResult Function(_FinishedEntering value)? finishedEntering,
    required TResult orElse(),
  }) {
    if (backspacePressed != null) {
      return backspacePressed(this);
    }
    return orElse();
  }
}

abstract class _BackspacePressed implements LockScreenEvent {
  const factory _BackspacePressed() = _$BackspacePressedImpl;
}

/// @nodoc
abstract class _$$FinishedEnteringImplCopyWith<$Res> {
  factory _$$FinishedEnteringImplCopyWith(_$FinishedEnteringImpl value,
          $Res Function(_$FinishedEnteringImpl) then) =
      __$$FinishedEnteringImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FinishedEnteringImplCopyWithImpl<$Res>
    extends _$LockScreenEventCopyWithImpl<$Res, _$FinishedEnteringImpl>
    implements _$$FinishedEnteringImplCopyWith<$Res> {
  __$$FinishedEnteringImplCopyWithImpl(_$FinishedEnteringImpl _value,
      $Res Function(_$FinishedEnteringImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FinishedEnteringImpl implements _FinishedEntering {
  const _$FinishedEnteringImpl();

  @override
  String toString() {
    return 'LockScreenEvent.finishedEntering()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FinishedEnteringImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DigitEntered value) digitEntered,
    required TResult Function(_BackspacePressed value) backspacePressed,
    required TResult Function(_FinishedEntering value) finishedEntering,
  }) {
    return finishedEntering(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DigitEntered value)? digitEntered,
    TResult? Function(_BackspacePressed value)? backspacePressed,
    TResult? Function(_FinishedEntering value)? finishedEntering,
  }) {
    return finishedEntering?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DigitEntered value)? digitEntered,
    TResult Function(_BackspacePressed value)? backspacePressed,
    TResult Function(_FinishedEntering value)? finishedEntering,
    required TResult orElse(),
  }) {
    if (finishedEntering != null) {
      return finishedEntering(this);
    }
    return orElse();
  }
}

abstract class _FinishedEntering implements LockScreenEvent {
  const factory _FinishedEntering() = _$FinishedEnteringImpl;
}

/// @nodoc
mixin _$LockScreenState {
  int get passcodeLength => throw _privateConstructorUsedError;
  String get passcode => throw _privateConstructorUsedError;
  LockScreenStatus get status => throw _privateConstructorUsedError;
  LockScreenPasscodeError? get passcodeError =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LockScreenStateCopyWith<LockScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LockScreenStateCopyWith<$Res> {
  factory $LockScreenStateCopyWith(
          LockScreenState value, $Res Function(LockScreenState) then) =
      _$LockScreenStateCopyWithImpl<$Res, LockScreenState>;
  @useResult
  $Res call(
      {int passcodeLength,
      String passcode,
      LockScreenStatus status,
      LockScreenPasscodeError? passcodeError});
}

/// @nodoc
class _$LockScreenStateCopyWithImpl<$Res, $Val extends LockScreenState>
    implements $LockScreenStateCopyWith<$Res> {
  _$LockScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passcodeLength = null,
    Object? passcode = null,
    Object? status = null,
    Object? passcodeError = freezed,
  }) {
    return _then(_value.copyWith(
      passcodeLength: null == passcodeLength
          ? _value.passcodeLength
          : passcodeLength // ignore: cast_nullable_to_non_nullable
              as int,
      passcode: null == passcode
          ? _value.passcode
          : passcode // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LockScreenStatus,
      passcodeError: freezed == passcodeError
          ? _value.passcodeError
          : passcodeError // ignore: cast_nullable_to_non_nullable
              as LockScreenPasscodeError?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LockScreenStateImplCopyWith<$Res>
    implements $LockScreenStateCopyWith<$Res> {
  factory _$$LockScreenStateImplCopyWith(_$LockScreenStateImpl value,
          $Res Function(_$LockScreenStateImpl) then) =
      __$$LockScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int passcodeLength,
      String passcode,
      LockScreenStatus status,
      LockScreenPasscodeError? passcodeError});
}

/// @nodoc
class __$$LockScreenStateImplCopyWithImpl<$Res>
    extends _$LockScreenStateCopyWithImpl<$Res, _$LockScreenStateImpl>
    implements _$$LockScreenStateImplCopyWith<$Res> {
  __$$LockScreenStateImplCopyWithImpl(
      _$LockScreenStateImpl _value, $Res Function(_$LockScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passcodeLength = null,
    Object? passcode = null,
    Object? status = null,
    Object? passcodeError = freezed,
  }) {
    return _then(_$LockScreenStateImpl(
      passcodeLength: null == passcodeLength
          ? _value.passcodeLength
          : passcodeLength // ignore: cast_nullable_to_non_nullable
              as int,
      passcode: null == passcode
          ? _value.passcode
          : passcode // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LockScreenStatus,
      passcodeError: freezed == passcodeError
          ? _value.passcodeError
          : passcodeError // ignore: cast_nullable_to_non_nullable
              as LockScreenPasscodeError?,
    ));
  }
}

/// @nodoc

class _$LockScreenStateImpl extends _LockScreenState {
  const _$LockScreenStateImpl(
      {this.passcodeLength = 4,
      this.passcode = '',
      this.status = LockScreenStatus.idle,
      this.passcodeError})
      : super._();

  @override
  @JsonKey()
  final int passcodeLength;
  @override
  @JsonKey()
  final String passcode;
  @override
  @JsonKey()
  final LockScreenStatus status;
  @override
  final LockScreenPasscodeError? passcodeError;

  @override
  String toString() {
    return 'LockScreenState(passcodeLength: $passcodeLength, passcode: $passcode, status: $status, passcodeError: $passcodeError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LockScreenStateImpl &&
            (identical(other.passcodeLength, passcodeLength) ||
                other.passcodeLength == passcodeLength) &&
            (identical(other.passcode, passcode) ||
                other.passcode == passcode) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.passcodeError, passcodeError) ||
                other.passcodeError == passcodeError));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, passcodeLength, passcode, status, passcodeError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LockScreenStateImplCopyWith<_$LockScreenStateImpl> get copyWith =>
      __$$LockScreenStateImplCopyWithImpl<_$LockScreenStateImpl>(
          this, _$identity);
}

abstract class _LockScreenState extends LockScreenState {
  const factory _LockScreenState(
      {final int passcodeLength,
      final String passcode,
      final LockScreenStatus status,
      final LockScreenPasscodeError? passcodeError}) = _$LockScreenStateImpl;
  const _LockScreenState._() : super._();

  @override
  int get passcodeLength;
  @override
  String get passcode;
  @override
  LockScreenStatus get status;
  @override
  LockScreenPasscodeError? get passcodeError;
  @override
  @JsonKey(ignore: true)
  _$$LockScreenStateImplCopyWith<_$LockScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
