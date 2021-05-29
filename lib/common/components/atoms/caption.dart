part of atoms;

class Caption extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const Caption(this.text, {Key? key, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.caption?.merge(this.style);
    return Text(
      this.text,
      style: textStyle,
    );
  }
}
