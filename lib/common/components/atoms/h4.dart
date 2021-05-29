part of atoms;

class H4 extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const H4(this.text, {Key? key,this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.headline4?.merge(this.style);
    Log.debug("H4:: $textStyle");
    return Text(
      this.text,
      style: textStyle,
    );
  }
}
