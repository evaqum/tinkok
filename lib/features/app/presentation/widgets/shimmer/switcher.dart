import 'package:flutter/material.dart';

import 'shimmer_container.dart';

class ShimmerSwitcher extends StatelessWidget {
  final Widget placeholder;
  final WidgetBuilder childBuilder;
  final bool showPlaceholder;

  const ShimmerSwitcher({
    super.key,
    required this.placeholder,
    required this.childBuilder,
    this.showPlaceholder = false,
  });

  @override
  Widget build(BuildContext context) {
    final child = showPlaceholder //
        ? ShimmerContainer(
            key: const ValueKey('placeholder'),
            placeholder: placeholder,
          )
        : Builder(
            key: const ValueKey('builder'),
            builder: childBuilder,
          );

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: child,
    );
  }
}
