part of templates;

class WalletDetailTemplate extends StatelessWidget {
  const WalletDetailTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        WalletDetailAppbar(),
        Container(
          child: BodyText1("Total portfolio value"),
          margin: EdgeInsets.only(bottom: 8, left: 24),
        ),
        Container(
          child: BodyText1("\$ 0.00"),
          margin: EdgeInsets.only(bottom: 16, left: 24),
        ),
        CardsSwiper(),
        WalletActions(),
        Container(
          child: SettingList(),
          margin: EdgeInsets.only(left: 24, right: 24, top: 24),
        ),
        Container(
          margin: EdgeInsets.only(left: 24, right: 24, top: 12),
          child: Subtitle2(
              "CHIA wallet Inc, is an independent, self-funded company. We provide a free, open-source, client-side tool for interacting with the blockchain."),
        )
      ],
    );
  }
}
