part of atoms;

class ButtonAdd extends StatelessWidget {
  const ButtonAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 36,
      width: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: theme.cardColor,
      ),
      child: Center(
        child: Icon(
          Icons.add,
          color: theme.primaryColor,
        ),
      ),
    );
  }
}
