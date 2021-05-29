part of atoms;

class PrimaryButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget? child;

  const PrimaryButton({Key? key, this.child, required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final background = Theme.of(context).primaryColor;
    return ElevatedButton(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(background)),
      onPressed: this.onPressed,
      child: child,
    );
  }
}
