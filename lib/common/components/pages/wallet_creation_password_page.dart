part of pages;
class WalletCreationPasswordPage extends StatefulWidget {
  const WalletCreationPasswordPage({Key? key}) : super(key: key);

  @override
  _WalletCreationPasswordPageState createState() => _WalletCreationPasswordPageState();
}

class _WalletCreationPasswordPageState extends State<WalletCreationPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
        ),
      ),
    );
  }
}
