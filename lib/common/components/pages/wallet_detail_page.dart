part of pages;

class WalletDetailPage extends StatefulWidget {
  final String walletId;

  const WalletDetailPage(this.walletId, {Key? key}) : super(key: key);

  @override
  _WalletDetailPageState createState() => _WalletDetailPageState();
}

class _WalletDetailPageState extends State<WalletDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold());
  }
}
