import 'package:chia_wallet/app.dart';
import 'package:chia_wallet/core/utils/config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Config.init(kReleaseMode ? Mode.Production : Mode.Debug);
  runApp(App());
}
