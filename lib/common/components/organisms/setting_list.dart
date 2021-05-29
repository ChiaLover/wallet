part of organisms;

class SettingList extends StatelessWidget {
  const SettingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        H6("More things"),
        FeedbackListItem(),
        Divider(),
        SettingListItem(),
        Divider(),
        FeatureListItem(),
        Divider(),
      ],
    );
  }
}
