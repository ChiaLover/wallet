import 'package:chia_wallet/common/asset/assets.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'common/components/pages/pages.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "SF Pro Display",
        primarySwatch: Colors.green,
        accentColor: HexColor("#F2F2F2"),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.black),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        textTheme: TextTheme(
            headline4:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
            headline5: TextStyle(fontWeight: FontWeight.w700),
            headline6: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            bodyText1: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            subtitle2: TextStyle(
                color: HexColor(WColors.subtitle2),
                fontWeight: FontWeight.w400)),
      ),
      home: EntryPointPage(),
    );
  }
}
