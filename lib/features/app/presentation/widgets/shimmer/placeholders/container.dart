import 'package:flutter/material.dart';

const kShimmerPlaceholderColor = Color.fromRGBO(255, 255, 255, 0.05);

class ShimmerContainerPlaceholder extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final double? width;
  final double? height;

  const ShimmerContainerPlaceholder({
    super.key,
    this.borderRadius,
    this.child,
    this.padding,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    var child = this.child;

    if (padding != null) {
      child = Padding(
        padding: padding!,
        child: child,
      );
    }

    child = DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: kShimmerPlaceholderColor,
      ),
      child: child,
    );

    if (width != null || height != null) {
      child = SizedBox(
        width: width,
        height: height,
        child: child,
      );
    }

    return child;
  }
}
