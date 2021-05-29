part of atoms;

class SquareButton extends StatelessWidget {
  final double size;
  final Color? color;
  final Widget child;

  const SquareButton(
      {Key? key, required this.child, required this.size, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          backgroundColor: MaterialStateProperty.all(color),
        ),
        child: Container(
          width: size,
          height: size,
          child: child,
        ),
      ),
    );
  }
}
