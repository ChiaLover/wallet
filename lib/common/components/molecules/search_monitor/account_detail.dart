part of molecules;

class AccountDetail extends StatelessWidget {
  final String address;

  const AccountDetail(this.address, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Panel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
            child: H6("Address"),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
            child: Row(
              children: [
                Container(
                  height: 24,
                  width: 24,
                  margin: EdgeInsets.only(right: 12),
                  child: CircleAvatar(backgroundColor: Colors.blue),
                ),
                Expanded(child: Subtitle2(address, maxLine: 1))
              ],
            ),
          )
        ],
      ),
    );
  }
}
