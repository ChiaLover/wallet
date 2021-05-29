part of atoms;

class BodyText2 extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const BodyText2(this.text, {Key? key, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.bodyText2?.merge(this.style);
    return Text(
      this.text,
      style: textStyle,
    );
  }
}
