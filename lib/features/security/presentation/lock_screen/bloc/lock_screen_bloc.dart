import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/repositories/lock_repository.dart';

part 'lock_screen_bloc.freezed.dart';
part 'lock_screen_event.dart';
part 'lock_screen_state.dart';

class LockScreenBloc extends Bloc<LockScreenEvent, LockScreenState> {
  final LockRepository _lockRepository;

  LockScreenBloc({
    required LockRepository lockRepository,
  })  : _lockRepository = lockRepository,
        super(const LockScreenState()) {
    on(_handleDigitEntered);
    on(_handleBackspacePressed);
    on(_handleFinishedEntering);
  }

  LockScreenState get _state {
    return state.copyWith(
      passcodeError: null,
    );
  }

  void _handleDigitEntered(_DigitEntered event, Emitter<LockScreenState> emit) {
    final passcode = state.passcode + event.digit;

    emit(_state.copyWith(
      passcode: passcode,
    ));

    if (passcode.length == state.passcodeLength) {
      add(const LockScreenEvent.finishedEntering());
    }
  }

  void _handleBackspacePressed(_BackspacePressed event, Emitter<LockScreenState> emit) {
    if (state.passcode.isEmpty) return;
    emit(_state.copyWith(
      passcode: state.passcode.substring(0, state.passcode.length - 1),
    ));
  }

  void _handleFinishedEntering(
    _FinishedEntering event,
    Emitter<LockScreenState> emit,
  ) async {
    final passcode = state.passcode;

    emit(_state.copyWith(
      status: LockScreenStatus.validating,
    ));

    final isCorrect = await _lockRepository.checkPasscode(passcode);

    if (isCorrect) {
      emit(_state.copyWith(
        status: LockScreenStatus.unlocking,
      ));

      return;
    }

    emit(_state.copyWith(
      passcodeError: LockScreenPasscodeError.invalid,
      status: LockScreenStatus.idle,
      passcode: '',
    ));
  }
}
