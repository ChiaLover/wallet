part of molecules;

class AccountOverview extends StatelessWidget {
  const AccountOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Panel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
            child: H6("Overview"),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
            //Todo: using listview + bloc to listing all currency in account
            child: Column(
              children: [
                CurrencyItem(title: "Balance:", value: "6 XCH"),
                Divider(),
                CurrencyItem(title: "XCH Value:", value: "\$40.000"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
