part of molecules;

class FeedbackListItem extends StatelessWidget {
  const FeedbackListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //Todo: Change icon feature
      leading:  SvgPicture.asset(AssetLinks.icFeedback),
      title: Text("Feedback"),
      trailing: Icon(Icons.chevron_right),
      contentPadding: EdgeInsets.zero,
    );
  }
}
