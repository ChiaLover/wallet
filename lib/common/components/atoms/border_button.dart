part of atoms;

class BorderButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget child;

  const BorderButton({Key? key, required this.child, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: this.onPressed,
      child: DefaultTextStyle(
        child: child,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
