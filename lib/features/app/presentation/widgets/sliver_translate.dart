import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SliverTranslate extends SingleChildRenderObjectWidget {
  final Offset translation;

  const SliverTranslate({
    super.key,
    required this.translation,
    required super.child,
  });

  @override
  RenderSliverTranslate createRenderObject(BuildContext context) => RenderSliverTranslate(translation: translation);

  @override
  void updateRenderObject(BuildContext context, covariant RenderSliverTranslate renderObject) {
    renderObject.translation = translation;
  }
}

class RenderSliverTranslate extends RenderProxySliver {
  RenderSliverTranslate({
    required Offset translation,
  }) : _translation = translation;

  Offset get translation => _translation;
  Offset _translation;
  set translation(Offset value) {
    if (value == _translation) {
      return;
    }

    _translation = value;
    markNeedsLayout();
    markNeedsSemanticsUpdate();
  }

  @override
  bool hitTestChildren(
    SliverHitTestResult result, {
    required double mainAxisPosition,
    required double crossAxisPosition,
  }) {
    // TODO: transform hit tests too?

    return super.hitTestChildren(
      result,
      mainAxisPosition: mainAxisPosition,
      crossAxisPosition: crossAxisPosition,
    );
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    assert(!debugNeedsLayout);
    if (child != null) {
      final translatedOffset = offset + _translation;
      super.paint(context, translatedOffset);
    }
  }
}
