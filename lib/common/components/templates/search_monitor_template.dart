part of templates;

class SearchMonitorTemplate extends StatelessWidget {
  const SearchMonitorTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: true,
      children: [
        SearchMonitorTextField(),
        AddressInfoPanel(),
        AddressOverviewPanel(),
        AccountTransactionPanel(),
      ],
    );
  }
}
