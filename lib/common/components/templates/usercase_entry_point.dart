part of templates;

class UsercaseEntryPoint extends StatelessWidget {
  const UsercaseEntryPoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Flexible(child: SizedBox.expand()),
        Flexible(
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              H5("Usecase Entry point"),
              SizedBox(
                height: 62,
                width: double.infinity,
                child: PrimaryButton(
                  child: Text('Create Wallet for New User'),
                  onPressed: () => _handleCreateWallet(context),
                ),
              ),
              SizedBox(
                height: 62,
                width: double.infinity,
                child: PrimaryButton(
                  child: Text('User already has an account'),
                  onPressed: () => _handleLoginWallet(context),
                ),
              ),
            ],
          ),
        ),
        Flexible(child: SizedBox.expand()),
      ],
    );
  }

  void _handleCreateWallet(BuildContext context) {
    try {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WalletCreationPage()),
      );
    } catch (ex) {
      Log.error(ex);
    }
  }

  void _handleLoginWallet(BuildContext context) {}
}
