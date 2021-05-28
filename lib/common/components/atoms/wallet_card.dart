part of atoms;

class WCard extends StatelessWidget {
  final Widget? child;
  final Gradient? gradient;

  const WCard({Key? key, this.child, this.gradient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 171,
      width: 327,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: gradient,
      ),
      child: Stack(
        children: [
          SizedBox.expand(),
          child ?? SizedBox()],
      ),
    );
  }
}
