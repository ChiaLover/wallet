part of atoms;
class CurrencyItem extends StatelessWidget {
  final String title;
  final String value;
  const CurrencyItem({Key? key,required this.title,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BodyText2(title),
          BodyText2(value),
        ],
      ),
    );
  }
}
