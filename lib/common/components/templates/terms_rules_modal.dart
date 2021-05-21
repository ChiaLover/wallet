part of templates;

class TermsRulesTemplate extends StatelessWidget {
  static final terms = [
    Term(1, "Back it up, and keep your backup safe",
        "If you lose your wallet backup information, no one (not even CHIAforce) can recover it, and you will lose your funds."),
    Term(2, "Always double-check everything",
        "If you send assét to the wrong address, no one can reverse or recover that transaction, and you will lose your funds."),
    Term(3, "Be wary of phishing and scams",
        "If someone offers you something that is too good to be true, it probably is."),
  ];

  const TermsRulesTemplate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
            .padding
            .top,
      ),
      margin: EdgeInsets.all(16),
      child: Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flex(
            direction: Axis.horizontal,
            children: [
              Spacer(),
              ButtonClose(
                onPressed: () => _handleClose(context),
              ),
            ],
          ),
          Expanded(
            child: TermListing(TermsRulesTemplate.terms),
          ),
          SizedBox(
            height: 62,
            width: double.infinity,
            child: PrimaryButton(
              onPressed: () => _handleCreateWallet(context),
              child: Text("Create a wallet"),
            ),
          )
        ],
      ),
    );
  }

  void _handleClose(BuildContext context) {
    try {
      Navigator.pop(context, false);
    } catch (ex) {
      Log.error(ex);
    }
  }

  void _handleCreateWallet(BuildContext context) {
    try {
      Navigator.pop(context, true);
    } catch (ex) {
      Log.error(ex);
    }
  }
}
