part of molecules;

class Term {
  final int index;
  final String title;
  final String subtitle;

  Term(this.index, this.title, this.subtitle);
}

class TermItem extends StatelessWidget {
  final Term term;

  const TermItem(this.term, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: CircleNumber(term.index),
          margin: EdgeInsets.only(bottom: 12),
        ),
        Container(
          child: H6(term.title),
          margin: EdgeInsets.only(bottom: 18),
        ),
        BodyText1(
          term.subtitle,
          style: TextStyle(
            color: HexColor(WColors.subtitle2),
          ),
        ),
      ],
    );
  }
}
