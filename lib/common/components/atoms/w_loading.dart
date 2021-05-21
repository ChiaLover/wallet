part of atoms;

class WLoading extends StatelessWidget {
  const WLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return CircularProgressIndicator(
      backgroundColor: theme.primaryColor,
    );
  }
}
