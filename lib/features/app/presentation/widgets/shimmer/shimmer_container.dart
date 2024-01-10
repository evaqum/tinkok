import 'package:flutter/material.dart';

import 'shimmer_scope.dart';

/// Container which draws a shimmer effect on a placeholder
class ShimmerContainer extends StatefulWidget {
  final Widget placeholder;

  const ShimmerContainer({
    super.key,
    required this.placeholder,
  });

  @override
  State<ShimmerContainer> createState() => _ShimmerContainerState();
}

class _ShimmerContainerState extends State<ShimmerContainer> {
  Listenable? _shimmerChanges;
  Unregister? _unregisterShimmer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _shimmerChanges?.removeListener(_shimmerChanged);
    _unregisterShimmer?.call();

    final shimmer = ShimmerScope.of(context);
    _shimmerChanges = shimmer?.shimmerChanges;
    _unregisterShimmer = shimmer?.register();

    _shimmerChanges?.addListener(_shimmerChanged);
  }

  @override
  void dispose() {
    _shimmerChanges?.removeListener(_shimmerChanged);
    _unregisterShimmer?.call();
    super.dispose();
  }

  void _shimmerChanged() {
    setState(() {});
  }

  ShaderCallback _getShaderCallback(
    ShimmerScopeState shimmer,
    RenderBox renderObject,
  ) {
    final offsetWithinShimmer = shimmer.getDescendantOffset(descendant: renderObject);
    final shimmerSize = shimmer.size;

    return (bounds) {
      return shimmer.gradient.createShader(
        Rect.fromLTWH(
          -offsetWithinShimmer.dx,
          -offsetWithinShimmer.dy,
          shimmerSize.width,
          shimmerSize.height,
        ),
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    final shimmer = ShimmerScope.of(context)!;
    final renderObject = context.findRenderObject() as RenderBox?;

    final ShaderCallback shaderCallback;
    if (shimmer.isSized && renderObject != null) {
      shaderCallback = _getShaderCallback(shimmer, renderObject);
    } else {
      shaderCallback = (bounds) {
        return const LinearGradient(colors: [
          kDefaultShimmerTransparencyColor,
          kDefaultShimmerTransparencyColor,
        ]).createShader(bounds);
      };
    }

    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: shaderCallback,
      child: widget.placeholder,
    );
  }
}
