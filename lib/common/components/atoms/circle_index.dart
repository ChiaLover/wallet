part of atoms;

class CircleNumber extends StatelessWidget {
  final int number;

  const CircleNumber(this.number, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 40,
      width: 40,
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: theme.primaryColor),
      child: Center(
        child: Text(
          "$number",
          style: theme.textTheme.headline6
              ?.copyWith(color: theme.primaryTextTheme.button?.color),
        ),
      ),
    );
  }
}
