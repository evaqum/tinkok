import 'package:flutter/material.dart';

import 'container.dart';

class ShimmerTextPlaceholder extends StatelessWidget {
  final TextStyle? style;
  final String text;

  const ShimmerTextPlaceholder(
    this.text, {
    super.key,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
        color: kShimmerPlaceholderColor,
      ),
      child: Visibility.maintain(
        visible: false,
        child: Text(text, style: style),
      ),
    );
  }
}
