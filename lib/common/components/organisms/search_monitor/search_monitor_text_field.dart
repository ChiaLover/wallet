part of organisms;
class SearchMonitorTextField extends StatefulWidget {
  const SearchMonitorTextField({Key? key}) : super(key: key);

  @override
  _SearchMonitorTextFieldState createState() => _SearchMonitorTextFieldState();
}

class _SearchMonitorTextFieldState extends State<SearchMonitorTextField> {
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SearchTextField(controller: controller,);
  }
}
