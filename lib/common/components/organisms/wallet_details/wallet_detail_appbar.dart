part of organisms;

class WalletDetailAppbar extends StatelessWidget {
  const WalletDetailAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          H4("Wallet"),
          SearchMonitorButton(),
        ],
      ),
      margin: EdgeInsets.only(bottom: 8, top: 16, left: 24),
    );
  }
}
