part of organisms;

class AddressOverviewPanel extends StatelessWidget {
  const AddressOverviewPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: AccountOverview(),
    );
  }
}
