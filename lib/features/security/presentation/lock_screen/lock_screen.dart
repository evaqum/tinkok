import 'dart:math';

import 'package:bloc_hooks/bloc_hooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/range.dart';
import '../../../app/di/configure_dependencies.dart';
import '../../../app/presentation/navigation/routes.dart';
import '../../bloc/security_bloc.dart';
import 'bloc/lock_screen_bloc.dart';

const kLockScreenLockIconSize = 48.0;
const kLockScreenLockIconColor = Color(0x30FFFFFF);

class LockScreen extends StatelessWidget {
  final Animation<double> entryAnimation;
  const LockScreen({
    super.key,
    required this.entryAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LockScreenBloc(
        lockRepository: get(),
      ),
      child: _LockScreen(
        entryAnimation: entryAnimation,
      ),
    );
  }
}

class _LockScreen extends HookWidget {
  final Animation<double> entryAnimation;

  const _LockScreen({
    this.entryAnimation = const AlwaysStoppedAnimation(1.0),
  });

  @override
  Widget build(BuildContext context) {
    final securityBloc = useBloc<SecurityBloc>();

    useBlocListener(
      listenWhen: (LockScreenState previous, LockScreenState current) {
        return previous.status != current.status;
      },
      (LockScreenBloc _, LockScreenState state) async {
        if (state.status != LockScreenStatus.unlocking) {
          return;
        }

        securityBloc.add(const SecurityEvent.unlocked());

        await Future.delayed(const Duration(milliseconds: 700));
        if (context.mounted) {
          const HomeScreenRoute().go(context);
        }
      },
    );

    return Scaffold(
      body: FadeTransition(
        opacity: entryAnimation,
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const Gap(92.0),
                Hero(
                  tag: 'lock_icon',
                  createRectTween: (begin, end) {
                    return RectTween(begin: begin, end: end);
                  },
                  child: const Icon(
                    Icons.lock_outlined,
                    size: kLockScreenLockIconSize,
                    color: kLockScreenLockIconColor,
                  ),
                ),
                const Gap(16.0),
                Text(
                  'Tinkok User',
                  style: GoogleFonts.inter(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Spacer(flex: 2),
                const _PinInput(),
                const Spacer(flex: 5),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: _PinPad(),
                ),
                const Gap(24.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PinInput extends HookWidget {
  const _PinInput();

  @override
  Widget build(BuildContext context) {
    final passcodeAnimationController = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );

    final passcodeAnimation = CurvedAnimation(
      parent: passcodeAnimationController,
      curve: Curves.easeInOutSine,
    );

    final (passcode, status, error, passcodeLength) = useBlocSelector(
      (LockScreenBloc _, LockScreenState state) => (
        state.passcode,
        state.status,
        state.passcodeError,
        state.passcodeLength,
      ),
    );

    useBlocListener<LockScreenBloc, LockScreenState>(
      listenWhen: (previous, current) {
        return previous.passcodeError != current.passcodeError;
      },
      (_, state) {
        if (state.passcodeError == null) {
          return;
        }

        passcodeAnimationController.forward(from: 0.0);
      },
    );

    // useBlocListener<LockScreenBloc, LockScreenState>(
    //   listenWhen: (previous, current) {
    //     return previous.status != current.status;
    //   },
    //   (_, state) {
    //     if (state.status != LockScreenStatus.unlocking) {
    //       return;
    //     }

    //     passcodeAnimationController.forward(from: 0.0);
    //   },
    // );

    return AnimatedBuilder(
      animation: passcodeAnimationController,
      builder: (context, child) {
        const shakeByPixels = 8; // 200 for funny
        const shakeCount = 3;

        final v = passcodeAnimation.value;
        final s = sin(v * 2 * pi * shakeCount) * shakeByPixels;

        return Transform(
          transform: Matrix4.identity()
            ..translate(
              error != null ? s : 0.0,
              // status == LockScreenStatus.unlocking ? s : 0.0,
            ),
          // wtf
          // transform: Matrix4(
          //   1.0, 0.1, 0.0, 0.0,
          //   0.5, 1.0, 0.0, 0.01,
          //   0.0, 0.0, 1.0, 0.0,
          //   0.0, 0.0, 0.0, 1.0,
          // ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (final i in range(0, passcodeLength)) ...[
                _PinInputCircle(
                  isFilled: i < passcode.length,
                  status: status,
                  hasError: error != null,
                ),
                if (i < passcodeLength - 1) const Gap(12.0),
              ],
            ],
          ),
        );
      },
    );
  }
}

class _PinInputCircle extends StatefulWidget {
  final bool isFilled;
  final LockScreenStatus status;
  final bool hasError;

  const _PinInputCircle({
    required this.isFilled,
    required this.status,
    this.hasError = false,
  });

  @override
  State<_PinInputCircle> createState() => _PinInputCircleState();
}

class _PinInputCircleState extends State<_PinInputCircle> {
  Color get _borderColor {
    return switch (widget.status) {
      LockScreenStatus.unlocking => Colors.green,
      LockScreenStatus.validating => Colors.yellow,
      LockScreenStatus.idle when widget.isFilled => const Color(0xFF0075FF),
      LockScreenStatus.idle when widget.hasError => Colors.red,
      LockScreenStatus.idle => Colors.white.withOpacity(0.3),
    };
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 20.0,
      width: 20.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutCubic,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: _borderColor,
          width: widget.isFilled ? 10.0 : 2.0,
        ),
      ),
    );
  }
}

class _PinPad extends StatelessWidget {
  const _PinPad();

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            _DigitPinPadButton('1'),
            Gap(6.0),
            _DigitPinPadButton('2'),
            Gap(6.0),
            _DigitPinPadButton('3'),
          ],
        ),
        Gap(6.0),
        Row(
          children: [
            _DigitPinPadButton('4'),
            Gap(6.0),
            _DigitPinPadButton('5'),
            Gap(6.0),
            _DigitPinPadButton('6'),
          ],
        ),
        Gap(6.0),
        Row(
          children: [
            _DigitPinPadButton('7'),
            Gap(6.0),
            _DigitPinPadButton('8'),
            Gap(6.0),
            _DigitPinPadButton('9'),
          ],
        ),
        Gap(6.0),
        Row(
          children: [
            _BackspacePinPadButton(),
            Gap(6.0),
            _DigitPinPadButton('0'),
            Gap(6.0),
            Spacer(),
          ],
        )
      ],
    );
  }
}

class _RawPinPadButton extends StatelessWidget {
  final BorderRadius borderRadius = const BorderRadius.all(
    Radius.circular(6.0),
  );
  final Widget child;
  final VoidCallback? onTap;
  final bool decorate;

  const _RawPinPadButton({
    required this.child,
    this.decorate = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    BoxDecoration? decoration;
    if (decorate) {
      decoration = BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: borderRadius,
      );
    }

    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius,
      child: Ink(
        height: 44.0,
        decoration: decoration,
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}

class _DigitPinPadButton extends HookWidget {
  final String digit;

  const _DigitPinPadButton(this.digit);

  @override
  Widget build(BuildContext context) {
    final lockScreenBloc = useBloc<LockScreenBloc>();
    final canType = useBlocSelector(
      (LockScreenBloc _, LockScreenState state) => state.status == LockScreenStatus.idle,
    );

    VoidCallback? onTap;
    if (canType) {
      onTap = () {
        lockScreenBloc.add(LockScreenEvent.digitEntered(digit));
      };
    }

    return Expanded(
      child: _RawPinPadButton(
        decorate: true,
        onTap: onTap,
        child: Text(
          digit,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: canType ? Colors.white : Colors.white30,
          ),
        ),
      ),
    );
  }
}

class _BackspacePinPadButton extends HookWidget {
  const _BackspacePinPadButton();

  @override
  Widget build(BuildContext context) {
    final lockScreenBloc = useBloc<LockScreenBloc>();
    final canType = useBlocSelector(
      (LockScreenBloc _, LockScreenState state) => state.status == LockScreenStatus.idle,
    );

    VoidCallback? onTap;
    if (canType) {
      onTap = () {
        lockScreenBloc.add(const LockScreenEvent.backspacePressed());
      };
    }

    final color = canType ? Colors.white : Colors.white30;

    return Expanded(
      child: _RawPinPadButton(
        decorate: false,
        onTap: onTap,
        child: Icon(
          Icons.backspace_outlined,
          color: color,
        ),
      ),
    );
  }
}
