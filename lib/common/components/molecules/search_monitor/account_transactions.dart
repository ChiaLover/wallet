part of molecules;

class AccountTransactions extends StatelessWidget {
  const AccountTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final TableResponse fakeTable = TableResponse(headers: [
      TableHeader("Txn Hash"),
      TableHeader("Method"),
      TableHeader("Age"),
      TableHeader("From"),
    ], body: [
      [TextCell('0xf42fsdf78sdfsf7DJDJH...'),TextCell('Approve'), TextCell("3 day 15 hrs ago"),TextCell("0xB01fsdf78sdfsf...")],
      [TextCell('0xf42fsdf78sdfsf7DJDJH...'),TextCell('Approve'), TextCell("3 day 15 hrs ago"),TextCell("0xB01fsdf78sdfsf...")],
      [TextCell('0xf42fsdf78sdfsf7DJDJH...'),TextCell('Approve'), TextCell("3 day 15 hrs ago"),TextCell("0xB01fsdf78sdfsf...")],
      [TextCell('0xf42fsdf78sdfsf7DJDJH...'),TextCell('Approve'), TextCell("3 day 15 hrs ago"),TextCell("0xB01fsdf78sdfsf...")],
      [TextCell('0xf42fsdf78sdfsf7DJDJH...'),TextCell('Approve'), TextCell("3 day 15 hrs ago"),TextCell("0xB01fsdf78sdfsf...")],
      [TextCell('0xf42fsdf78sdfsf7DJDJH...'),TextCell('Approve'), TextCell("3 day 15 hrs ago"),TextCell("0xB01fsdf78sdfsf...")],
      [TextCell('0xf42fsdf78sdfsf7DJDJH...'),TextCell('Approve'), TextCell("3 day 15 hrs ago"),TextCell("0xB01fsdf78sdfsf...")],
      [TextCell('0xf42fsdf78sdfsf7DJDJH...'),TextCell('Approve'), TextCell("3 day 15 hrs ago"),TextCell("0xB01fsdf78sdfsf...")],
      [TextCell('0xf42fsdf78sdfsf7DJDJH...'),TextCell('Approve'), TextCell("3 day 15 hrs ago"),TextCell("0xB01fsdf78sdfsf...")],
      [TextCell('0xf42fsdf78sdfsf7DJDJH...'),TextCell('Approve'), TextCell("3 day 15 hrs ago"),TextCell("0xB01fsdf78sdfsf...")],
      [TextCell('0xf42fsdf78sdfsf7DJDJH...'),TextCell('Approve'), TextCell("3 day 15 hrs ago"),TextCell("0xB01fsdf78sdfsf...")],
    ]);
    return Panel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
            child: H6("Transaction"),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      text: "Latest 14 from a total of ",
                      style: theme.textTheme.subtitle2
                          ?.copyWith(fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(
                          text: "14",
                          style: TextStyle(color: theme.primaryColor),
                        ),
                        TextSpan(text: " transactions"),
                      ]),
                ),
                Container(
                  height: 300-24,
                  child: WTable(fakeTable),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
