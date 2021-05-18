part of atoms;
class ButtonClose extends StatelessWidget {
  final void Function() onPressed;
  const ButtonClose({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 24,
      width: 24,
      child:  FloatingActionButton(
        backgroundColor: theme.accentColor,
        onPressed: this.onPressed,
        child: Icon(Icons.close,size: 12,),
      )
    );
  }
}
