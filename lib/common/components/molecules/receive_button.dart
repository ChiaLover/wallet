part of molecules;

class ReceiveButton extends StatelessWidget {
  const ReceiveButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;
    final widthButton = (widthDevice - 24 - 24 - 7) / 2;
    return SquareButton(
      size: widthButton,
      color: WColors.alabaster,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              flex: 2,
              child: SvgPicture.asset(AssetLinks.icReceive,
                fit: BoxFit.fill,
                width: widthButton / 4,
              ),
            ),
            Flexible(
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  H6("Receive"),
                  Caption("From existing wallet")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
