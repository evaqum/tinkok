import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'security_bloc.freezed.dart';
part 'security_event.dart';
part 'security_state.dart';

class SecurityBloc extends Bloc<SecurityEvent, SecurityState> {
  SecurityBloc() : super(const SecurityState.initial()) {
    on(_handleInitialized);
    on(_handleUnlocked);
  }

  void _handleInitialized(_Initialized event, Emitter<SecurityState> emit) {
    emit(const SecurityState.locked());
  }

  void _handleUnlocked(_Unlocked event, Emitter<SecurityState> emit) {
    emit(const SecurityState.unlocked());
  }
}
