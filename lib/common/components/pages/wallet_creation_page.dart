part of pages;

class WalletCreationPage extends StatefulWidget {
  const WalletCreationPage({Key? key}) : super(key: key);

  @override
  _WalletCreationPageState createState() => _WalletCreationPageState();
}

class _WalletCreationPageState extends State<WalletCreationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: SingleChildScrollView(
            child: Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: H4("Wallet"),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 24),
                  child: WalletCreationCard(),
                ),
                SettingListWalletCreation(),
                Subtitle2('CHIA wallet Inc, is an independent, self-funded company. We provide a free, open-source, client-side tool for interacting with the blockchain.'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
