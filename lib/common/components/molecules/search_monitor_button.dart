part of molecules;

class SearchMonitorButton extends StatelessWidget {
  const SearchMonitorButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.search),
      onPressed: () => _handlePressSearch(context),
    );
  }

  void _handlePressSearch(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => MonitorSearchPage()),
    );
  }
}
