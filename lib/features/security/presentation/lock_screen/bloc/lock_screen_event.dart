part of 'lock_screen_bloc.dart';

@freezed
class LockScreenEvent with _$LockScreenEvent {
  const factory LockScreenEvent.digitEntered(String digit) = _DigitEntered;
  const factory LockScreenEvent.backspacePressed() = _BackspacePressed;
  const factory LockScreenEvent.finishedEntering() = _FinishedEntering;
}
