part of atoms;

class WalletCard extends StatelessWidget {
  final Widget? child;
  final Gradient? gradient;

  const WalletCard({Key? key, this.child, this.gradient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 171,
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
