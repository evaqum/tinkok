part of 'security_bloc.dart';

@freezed
class SecurityState with _$SecurityState {
  const factory SecurityState.initial() = SecurityStateInitial;
  const factory SecurityState.unlocked() = SecurityStateUnlocked;
  const factory SecurityState.locked() = SecurityStateLocked;
}
