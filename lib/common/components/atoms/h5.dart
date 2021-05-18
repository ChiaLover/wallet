part of atoms;

class H5 extends StatelessWidget {
  final String text;

  const H5(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultStyle = DefaultTextStyle.of(context).style;
    final textStyle = theme.textTheme.headline5?.copyWith(
      color: defaultStyle.color,
      fontWeight: defaultStyle.fontWeight,
    );
    return Text(
      this.text,
      style: textStyle,
    );
  }
}
