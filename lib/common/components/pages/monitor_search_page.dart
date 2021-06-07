part of pages;

class MonitorSearchPage extends StatefulWidget {
  const MonitorSearchPage({Key? key}) : super(key: key);

  @override
  _MonitorSearchPageState createState() => _MonitorSearchPageState();
}

class _MonitorSearchPageState extends State<MonitorSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: H6(
          "Search",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: SearchMonitorTemplate(),
        ),
      ),
    );
  }
}
