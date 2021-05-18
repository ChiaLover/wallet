part of atoms;

class BodyText1 extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const BodyText1(this.text, {Key? key, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.bodyText1?.merge(this.style);
    return Text(
      this.text,
      style: textStyle,
    );
  }
}
