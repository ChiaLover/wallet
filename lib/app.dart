import 'package:chia_wallet/common/asset/assets.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'common/components/pages/pages.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: LightTheme().toFlutterTheme(),
      home: EntryPointPage(),
    );
  }
}
