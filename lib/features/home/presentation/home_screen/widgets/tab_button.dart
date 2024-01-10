import 'package:flutter/material.dart';

import '../../../../app/presentation/widgets/gradient_icon.dart';

class HomeScreenTabButtonShimmerPlaceholder extends StatelessWidget {
  const HomeScreenTabButtonShimmerPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36.0,
      height: 36.0,
      decoration: const ShapeDecoration(
        shape: CircleBorder(),
        color: Colors.black,
      ),
    );
  }
}

class HomeScreenTabButton extends StatelessWidget {
  final bool isActive;
  final IconData icon;

  const HomeScreenTabButton({
    required this.icon,
    this.isActive = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 120),
      child: Container(
        key: ValueKey(isActive),
        alignment: Alignment.center,
        height: 36.0,
        width: 36.0,
        decoration: ShapeDecoration(
          shape: const CircleBorder(),
          gradient: LinearGradient(
            colors: isActive
                ? [
                    const Color(0xFF438BF9),
                    const Color(0xFF2E80FF),
                  ]
                : [
                    const Color.fromRGBO(0x6D, 0x6D, 0x6D, 0.15),
                    const Color.fromRGBO(0x61, 0x61, 0x61, 0.17),
                  ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: GradientIcon(
          icon,
          gradient: isActive
              ? const LinearGradient(
                  colors: [
                    Color.fromRGBO(255, 255, 255, 1.0),
                    Color.fromRGBO(255, 255, 255, 0.66),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              : const LinearGradient(colors: [
                  Color.fromRGBO(255, 255, 255, 0.33),
                  Color.fromRGBO(255, 255, 255, 0.33),
                ]),
        ),
      ),
    );
  }
}
