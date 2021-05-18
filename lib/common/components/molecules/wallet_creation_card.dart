part of molecules;

class WalletCreationCard extends StatelessWidget {
  const WalletCreationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Log.debug(MediaQuery.of(context).padding);
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
      _navigateToCreatePasswordPage(context);
    }
  }

  void _navigateToCreatePasswordPage(BuildContext context) {
    try {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WalletCreationPasswordPage()),
      );
    } catch (ex) {
      Log.error(ex);
    }
  }
}
