import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tinkok/core/utils/range.dart';
import 'package:tinkok/features/home/presentation/home_screen.dart';

import '../../home/presentation/cubit/home_screen_cubit.dart';

const kLockScreenLockIconSize = 48.0;
const kLockScreenLockIconColor = Color(0x30FFFFFF);

class LockScreen extends HookWidget {
  static const pinLength = 4;

  final Animation<double> entryAnimation;

  const LockScreen({
    super.key,
    this.entryAnimation = const AlwaysStoppedAnimation(1.0),
  });

  @override
  Widget build(BuildContext context) {
    final pin = useState('');

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
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
                  child: GestureDetector(
                    onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => HomeScreenCubit(),
                          child: const HomeScreen(),
                        ),
                      ),
                    ),
                    child: const Icon(
                      Icons.lock_outlined,
                      size: kLockScreenLockIconSize,
                      color: kLockScreenLockIconColor,
                    ),
                  ),
                ),
                const Gap(16.0),
                Text(
                  'Олег 228',
                  style: GoogleFonts.inter(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Spacer(flex: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (final i in intRange(pinLength)) ...[
                      _PinInputCircle(
                        isFilled: i < pin.value.length,
                      ),
                      if (i < pinLength - 1) const Gap(12.0),
                    ],
                  ],
                ),
                const Spacer(flex: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: _PinPad(pin: pin),
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

class _PinInputCircle extends StatefulWidget {
  final bool isFilled;

  const _PinInputCircle({
    super.key,
    required this.isFilled,
  });

  @override
  State<_PinInputCircle> createState() => _PinInputCircleState();
}

class _PinInputCircleState extends State<_PinInputCircle> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<BorderSide> _borderAnimation;
  late final Animation<Color?> _fillAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      value: widget.isFilled ? 1.0 : 0.0,
    );

    _borderAnimation = TweenSequence<BorderSide>([
      // TweenSequenceItem(
      //   weight: 1.0,
      //   tween: BorderSideTween(
      //     begin: BorderSide(
      //       color: Colors.white.withOpacity(0.3),
      //       width: 2.0,
      //     ),
      //     end: BorderSide(
      //       color: Colors.white.withOpacity(0.3),
      //       width: 10.0,
      //     ),
      //   ),
      // ),
      TweenSequenceItem(
        weight: 1.0,
        tween: BorderSideTween(
          begin: BorderSide(
            color: Colors.white.withOpacity(0.3),
            width: 2.0,
          ),
          end: const BorderSide(
            color: Color(0xFF0075FF),
            width: 10.0,
          ),
        ),
      ),
      // TweenSequenceItem(
      //   weight: 1.0,
      //   tween: BorderSideTween(
      //     begin: const BorderSide(
      //       color: Color(0xFF0075FF),
      //       width: 0.0,
      //     ),
      //     end: const BorderSide(
      //       color: Color(0xFF0075FF),
      //       width: 10.0,
      //     ),
      //   ),
      // ),
    ]).animate(_controller);

    _fillAnimation = TweenSequence<Color?>([
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: const Color(0x000075FF),
          end: const Color(0x000075FF),
        ),
      ),
      // TweenSequenceItem(
      //   weight: 1.0,
      //   tween: ColorTween(
      //     begin: Colors.white.withOpacity(0.3),
      //     end: Colors.white.withOpacity(0.0),
      //   ),
      // ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: const Color(0x000075FF),
          end: const Color(0xFF0075FF),
        ),
      ),
    ]).animate(_controller);
  }

  @override
  void didUpdateWidget(covariant _PinInputCircle oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isFilled != oldWidget.isFilled) {
      _controller.animateTo(
        widget.isFilled ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutCubic,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 20.0,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return DecoratedBox(
            decoration: ShapeDecoration(
              shape: CircleBorder(
                side: _borderAnimation.value,
              ),
              // color: _fillAnimation.value,
            ),
          );
        },
      ),
    );
  }
}

class BorderSideTween extends Tween<BorderSide> {
  BorderSideTween({
    BorderSide super.begin = BorderSide.none,
    BorderSide super.end = BorderSide.none,
  });

  @override
  set begin(BorderSide? value) => super.begin = value ?? BorderSide.none;

  @override
  BorderSide get begin => super.begin!;

  @override
  set end(BorderSide? value) => super.end = value ?? BorderSide.none;

  @override
  BorderSide get end => super.end!;

  @override
  BorderSide lerp(double t) => BorderSide.lerp(begin, end, t);
}

class _PinPad extends StatelessWidget {
  const _PinPad({
    super.key,
    required this.pin,
  });

  final ValueNotifier<String> pin;

  Widget _button([String? v, bool decorate = true, VoidCallback? onTap]) {
    if (v == null) {
      return const Expanded(
        child: _PinPadButton(
          text: '',
          decorate: false,
        ),
      );
    }

    return Expanded(
      child: _PinPadButton(
        text: v,
        onTap: onTap ?? () => pin.value += v,
        decorate: decorate,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            _button('1'),
            const Gap(6.0),
            _button('2'),
            const Gap(6.0),
            _button('3'),
          ],
        ),
        const Gap(6.0),
        Row(
          children: [
            _button('4'),
            const Gap(6.0),
            _button('5'),
            const Gap(6.0),
            _button('6'),
          ],
        ),
        const Gap(6.0),
        Row(
          children: [
            _button('7'),
            const Gap(6.0),
            _button('8'),
            const Gap(6.0),
            _button('9'),
          ],
        ),
        const Gap(6.0),
        Row(
          children: [
            _button('\u2190', false, () {
              if (pin.value.isNotEmpty) {
                pin.value = pin.value.substring(0, pin.value.length - 1);
              }
            }),
            const Gap(6.0),
            _button('0'),
            const Gap(6.0),
            _button(),
          ],
        )
      ],
    );
  }
}

class _PinPadButton extends StatelessWidget {
  final String text;
  final bool decorate;
  final VoidCallback? onTap;

  const _PinPadButton({
    super.key,
    required this.text,
    this.decorate = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(6.0),
      onTap: onTap,
      child: Ink(
        height: 44.0,
        decoration: decorate
            ? BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6.0),
              )
            : null,
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
