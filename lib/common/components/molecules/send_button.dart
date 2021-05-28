part of molecules;

class SendButton extends StatelessWidget {
  const SendButton({Key? key}) : super(key: key);

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: SvgPicture.asset(AssetLinks.icSend),
            ),
            Flexible(
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  H6("Send"),
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
