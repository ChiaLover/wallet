part of molecules;

class WalletCreationCard extends StatelessWidget {
  const WalletCreationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleTapCard(context),
      child: WalletCard(
        gradient: Gradients.cardGradient,
        child: DefaultTextStyle(
          style: TextStyle(color: Colors.white),
          child: Container(
            margin: EdgeInsets.all(24),
            child: Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonAdd(),
                H5("Create a free wallet"),
                Text(
                  "Lorem Ipsum has been the industry's standard dummy text ever since the.",
                  maxLines: 2,
                )
              ],
            ),
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
      await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: false,
        builder: (_) => WalletCreationPasswordModal(),
      );
    } catch (ex) {
      Log.error(ex);
    }
  }
}
