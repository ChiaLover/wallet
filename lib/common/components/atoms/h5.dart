part of atoms;

class H5 extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const H5(this.text, {Key? key, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.headline5?.merge(this.style);
    return Text(
      this.text,
      style: textStyle,
    );
  }
}
