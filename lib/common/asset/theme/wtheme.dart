part of assets;

abstract class WTheme {
  TypeSystem get typeSystem;

  Color get primaryColor;

  Color get backgroundColor;

  ThemeData toFlutterTheme() {
    return ThemeData(
      fontFamily: "SF Pro Display",
      primaryColor: primaryColor,
      backgroundColor: backgroundColor,
      accentColor: HexColor("#F2F2F2"),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.black),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      textTheme: typeSystem.toTextTheme(),
    );
  }
}

class TypeSystem {
  final ScaleCategory? header1;
  final ScaleCategory? header2;
  final ScaleCategory? header3;
  final ScaleCategory? header4;
  final ScaleCategory? header5;
  final ScaleCategory? header6;
  final ScaleCategory? subtitle1;
  final ScaleCategory? subtitle2;
  final ScaleCategory? body1;
  final ScaleCategory? body2;
  final ScaleCategory? button;
  final ScaleCategory? caption;
  final ScaleCategory? overline;

  TypeSystem(
      {this.header1,
      this.header2,
      this.header3,
      this.header4,
      this.header5,
      this.header6,
      this.subtitle1,
      this.subtitle2,
      this.body1,
      this.body2,
      this.button,
      this.caption,
      this.overline});

  TextTheme toTextTheme() {
    return TextTheme(
      headline1: header1?.toTextStyle(),
      headline2: header2?.toTextStyle(),
      headline3: header3?.toTextStyle(),
      headline4: header4?.toTextStyle(),
      headline5: header5?.toTextStyle(),
      headline6: header6?.toTextStyle(),
      subtitle1: subtitle1?.toTextStyle(),
      subtitle2: subtitle2?.toTextStyle(),
      bodyText1: body1?.toTextStyle(),
      bodyText2: body2?.toTextStyle(),
      caption: caption?.toTextStyle(),
      overline: overline?.toTextStyle(),
    );
  }
}

class ScaleCategory {
  final double? size;

  final double? letterSpacing;

  final FontWeight? fontWeight;

  final Color? color;

  ScaleCategory({this.size, this.letterSpacing, this.fontWeight,this.color});

  TextStyle toTextStyle() {
    return TextStyle(
      fontSize: size,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
