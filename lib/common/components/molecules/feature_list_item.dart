part of molecules;

class FeatureListItem extends StatelessWidget {
  const FeatureListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //Todo: Change icon feature
      leading:  SvgPicture.asset(AssetLinks.icFeature),
      title: Text("Advanced features"),
      trailing: Icon(Icons.chevron_right),
      contentPadding: EdgeInsets.zero,
    );
  }
}
