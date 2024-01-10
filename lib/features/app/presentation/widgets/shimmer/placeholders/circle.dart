import 'package:flutter/material.dart';

import 'container.dart';

class ShimmerCirclePlaceholder extends StatelessWidget {
  final double diameter;

  const ShimmerCirclePlaceholder({
    super.key,
    required this.diameter,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: diameter,
      width: diameter,
      child: const DecoratedBox(
        decoration: ShapeDecoration(
          shape: CircleBorder(),
          color: kShimmerPlaceholderColor,
        ),
      ),
    );
  }
}
