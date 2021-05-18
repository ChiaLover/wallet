part of atoms;

class PrimaryButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget? child;

  const PrimaryButton({Key? key, this.child, required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: this.onPressed,
      child: child,
    );
  }
}
