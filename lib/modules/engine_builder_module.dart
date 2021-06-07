import 'package:chia_wallet/common/components/atoms/atoms.dart';
import 'package:chia_wallet/common/engines/table_render_engine.dart';
import 'package:chia_wallet/common/engines/text_cell_render.dart';
import 'package:chia_wallet/core/di/module.dart';

class EngineModule extends AbstractModule {
  @override
  void init() {
    bind(TableRenderEngine).to(
        TableRenderEngine.builder()
            .add(TextCell, TextCellRender())
            .build());
  }
}
