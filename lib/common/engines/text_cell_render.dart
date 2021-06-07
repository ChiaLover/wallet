import 'package:chia_wallet/common/components/atoms/atoms.dart';
import 'package:chia_wallet/common/engines/table_render_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextCellRender extends Render<TextCell>{
  @override
  Widget render(TextCell component) {
    return Text(component.data);
  }

}