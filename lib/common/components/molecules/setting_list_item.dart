part of molecules;

class SettingListItem extends StatelessWidget {
  const SettingListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //Todo: Change icon setting
      leading: Icon(Icons.settings),
      title: Text("Settings and support"),
      trailing: Icon(Icons.chevron_right),
      contentPadding: EdgeInsets.zero,
    );
  }
}
