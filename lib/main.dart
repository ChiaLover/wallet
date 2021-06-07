import 'package:chia_wallet/app.dart';
import 'package:chia_wallet/core/di/di.dart';
import 'package:chia_wallet/core/utils/config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'modules/engine_builder_module.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Config.init(kReleaseMode ? Mode.Production : Mode.Debug);
  DI.init([EngineModule()]);
  runApp(App());
}
