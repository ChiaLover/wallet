part of atoms;

class H6 extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const H6(this.text, {Key? key,this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.headline6?.merge(this.style);
    Log.debug("H6:: ${textStyle?.height}");
    return Text(
      this.text,
      style: textStyle,
    );
  }
}
