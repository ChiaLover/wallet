part of atoms;

class Subtitle2 extends StatelessWidget {
  final String text;
  final int? maxLine;

  const Subtitle2(this.text, {Key? key, this.maxLine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      this.text,
      style: theme.textTheme.subtitle2,
      maxLines: maxLine,
    );
  }
}
