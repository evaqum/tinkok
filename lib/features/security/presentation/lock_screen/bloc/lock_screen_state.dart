part of 'lock_screen_bloc.dart';

enum LockScreenStatus {
  idle,
  validating,
  unlocking,
}

enum LockScreenPasscodeError {
  invalid,
}

@freezed
class LockScreenState with _$LockScreenState {
  const LockScreenState._();

  const factory LockScreenState({
    @Default(4) int passcodeLength,
    @Default('') String passcode,
    @Default(LockScreenStatus.idle) LockScreenStatus status,
    LockScreenPasscodeError? passcodeError,
  }) = _LockScreenState;
}
