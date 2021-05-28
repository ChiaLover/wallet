part of molecules;

class AccountCreationCard extends StatelessWidget {
  const AccountCreationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final whiteColorStyle = TextStyle(color: Colors.white);
    return GestureDetector(
      onTap: () => _handleTapCard(context),
      child: WCard(
        gradient: Gradients.cardGradient,
        child: Container(
          margin: EdgeInsets.all(24),
          child: Flex(
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonAdd(),
              H5("Add account", style: whiteColorStyle,),
              Text(
                "Lorem Ipsum has been the industry's standard dummy text ever since the.",
                style: whiteColorStyle,
                maxLines: 2,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _handleTapCard(BuildContext context) async {
    bool success = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => TermsRulesTemplate(),
    );
    if (success) {
      await _navigateToCreatePasswordPage(context);
    }
  }

  _navigateToCreatePasswordPage(BuildContext context) async {
    try {
      String? walletId = await _goToWalletCreationModal(context);
      bool isWalletCreated = walletId?.isNotEmpty ?? false;
      if (isWalletCreated) {
        Log.debug("_goToWalletDetails");
        _goToWalletDetails(context, walletId!);
      }
    } catch (ex) {
      Log.error(ex);
    }
  }

  void _goToWalletDetails(BuildContext context, String walletId) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WalletDetailPage(walletId)),
    );
  }

  _goToWalletCreationModal(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      builder: (_) => WalletCreationPasswordModal(),
    );
  }
}
