part of 'security_bloc.dart';

@freezed
class SecurityEvent with _$SecurityEvent {
  const factory SecurityEvent.initialized() = _Initialized;
  const factory SecurityEvent.unlocked() = _Unlocked;
}
