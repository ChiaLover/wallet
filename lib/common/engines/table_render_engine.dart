import 'package:chia_wallet/common/components/atoms/atoms.dart';
import 'package:flutter/material.dart';

abstract class Render<T> {
  Widget render(T component);
}

abstract class RenderEngine {
  Widget render(Cell card);
}

abstract class BaseRenderEngine extends RenderEngine {
  final Map<Type, Render> renders;

  BaseRenderEngine(this.renders);
}

class TableRenderEngine extends BaseRenderEngine {
  @protected
  TableRenderEngine(Map<Type, Render> renders) : super(renders);

  @override
  Widget render(Cell cell) {
    if (renders.containsKey(cell.runtimeType)) {
      return renders[cell.runtimeType]!.render(cell);
    }
    return SizedBox();
  }

  static Builder builder() {
    return new Builder();
  }
}

class Builder {
  Map<Type, Render> renders = {};

  Builder add(Type type, Render render) {
    renders[type] = render;
    return this;
  }

  TableRenderEngine build() {
    return new TableRenderEngine(renders);
  }
}
