part of atoms;
class Panel extends StatelessWidget {
 final Widget? child;
  const Panel({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).backgroundColor,
        border: Border.all(color: WColors.panelBorder),
        boxShadow: [
          BoxShadow(
            color: WColors.panelShadow,
            offset: Offset(0, 1),
            blurRadius: 6,
          ),
        ],
      ),
    );
  }
}
