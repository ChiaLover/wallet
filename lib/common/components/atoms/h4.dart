part of atoms;

class H4 extends StatelessWidget {
  final String text;

  const H4(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      this.text,
      style: theme.textTheme.headline4,
    );
  }
}
