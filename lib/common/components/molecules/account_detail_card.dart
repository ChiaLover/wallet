part of molecules;

class AccountDetailCard extends StatelessWidget {
  final AccountInfo info;

  const AccountDetailCard(this.info, {Key? key}) : super(key: key);

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
            children: [
              Container(
                child: BodyText2("My main account", style: whiteColorStyle),
                margin: EdgeInsets.only(bottom: 4),
              ),
              Container(
                child: BodyText2(info.accountId, style: whiteColorStyle),
                margin: EdgeInsets.only(bottom: 14),
              ),
              Container(
                child: H5(
                  "\u0024${info.balance}",
                  style: whiteColorStyle,
                ),
                margin: EdgeInsets.only(bottom: 8),
              ),
              info.coin != null
                  ? BodyText1("${info.coin!.balance} ${info.coin!.symbols}",
                      style: whiteColorStyle)
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }

  void _handleTapCard(BuildContext context) async {}
}

//Fake class for UI test
class AccountInfo {
  final String accountId;
  double balance;
  Coin? coin;

  AccountInfo(this.accountId, {this.balance = 0.0, this.coin});
}

class Coin {
  double balance;
  final String symbols;

  Coin(this.balance, this.symbols);
}
