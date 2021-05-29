part of atoms;

/// Caption
///
/// <b>Font size:</b> <i>12</i>
///
/// <b>Letter Spacing:</b> <i>0.4</i>
class Caption extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const Caption(this.text, {Key? key, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = style ?? theme.textTheme.caption;
    return Text(
      this.text,
      style: textStyle,
    );
  }
}
