part of pages;

class EntryPointPage extends StatefulWidget {
  EntryPointPage({Key? key}) : super(key: key);

  @override
  _EntryPointPageState createState() => _EntryPointPageState();
}

class _EntryPointPageState extends State<EntryPointPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 38),
        child: UsercaseEntryPoint(),
      ),
    );
  }
}
