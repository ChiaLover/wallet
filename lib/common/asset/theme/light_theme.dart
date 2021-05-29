part of assets;

class LightTheme extends WTheme {
  @override
  TypeSystem get typeSystem => TypeSystem(
        header1: ScaleCategory(size: 96, letterSpacing: -1.5),
        header2: ScaleCategory(size: 60, letterSpacing: -0.5),
        header3: ScaleCategory(size: 48, letterSpacing: 0),
        header4: ScaleCategory(
          size: 36,
          letterSpacing: 0.25,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        header5: ScaleCategory(size: 24, letterSpacing: 0.15),
        header6: ScaleCategory(size: 20, letterSpacing: 0.15),
        subtitle1: ScaleCategory(size: 16, letterSpacing: 0.15),
        subtitle2: ScaleCategory(size: 14, letterSpacing: 0.1, color: WColors.subtitle2),
        body1: ScaleCategory(size: 16, letterSpacing: 0.5),
        body2: ScaleCategory(size: 14, letterSpacing: 0.25),
        caption: ScaleCategory(size: 12, letterSpacing: 0.4),
        overline: ScaleCategory(size: 10, letterSpacing: 1.5),
      );

  @override
  // TODO: implement backgroundColor
  Color get backgroundColor => Colors.white;

  @override
  // TODO: implement primaryColor
  Color get primaryColor => Colors.green;
}
