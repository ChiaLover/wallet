part of assets;
class Gradients {
  static final Gradient cardGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        HexColor(WColors.topGradient),
        HexColor(WColors.bottomGradient),
      ]);
}
