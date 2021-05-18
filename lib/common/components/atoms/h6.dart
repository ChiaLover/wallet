part of atoms;

class H6 extends StatelessWidget {
  final String text;

  const H6(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultStyle = DefaultTextStyle.of(context).style;
    final textStyle =
        theme.textTheme.headline6?.copyWith(color: defaultStyle.color);
    return Text(
      this.text,
      style: textStyle,
    );
  }
}
