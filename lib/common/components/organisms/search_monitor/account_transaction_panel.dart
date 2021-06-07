part of organisms;
class AccountTransactionPanel extends StatelessWidget {
  const AccountTransactionPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 348,
      child: AccountTransactions(),
    );
  }
}
