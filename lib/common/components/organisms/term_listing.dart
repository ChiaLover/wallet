part of organisms;

class TermListing extends StatelessWidget {
  static final String title = "Crypto safety 101";
  static final String subtitle =
      "In crypto you are your own bank. With that great power comes great responsibility.";
  static final String regards = "Stay safe out there!";
  static final String signature = "Team CHIA";
  final List<Term> terms;

  const TermListing(this.terms, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: WColors.osloGray,
    );
    return ListView(
      children: [
        Align(child: SvgPicture.asset(AssetLinks.imgRulesTerms),alignment: Alignment.centerLeft,),
        Container(
          margin: EdgeInsets.only(bottom: 8),
          child: DefaultTextStyle(
            child: H5(TermListing.title),
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 16),
          child: BodyText1(
            subtitle,
            style: style,
          ),
        ),
        ...terms.map((term) => Container(
              child: TermItem(term),
              margin: EdgeInsets.only(bottom: 24),
            )),
        BodyText1(
          TermListing.regards,
          style: style,
        ),
        BodyText1(
          TermListing.signature,
          style: style,
        ),
      ],
    );
  }
}
