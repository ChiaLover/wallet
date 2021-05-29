part of organisms;

class CardsSwiper extends StatefulWidget {
  const CardsSwiper({Key? key}) : super(key: key);

  @override
  _CardsSwiperState createState() => _CardsSwiperState();
}

class _CardsSwiperState extends State<CardsSwiper> {
  final List<AccountInfo> cards = [
    AccountInfo("0xf42f***C841", coin: Coin(0, "XHC"))
  ];
  late SwiperController controller;

  @override
  void initState() {
    super.initState();
    controller = SwiperController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletDetailBloc, WalletDetailState>(
      builder: (context, state) {
        return Flex(
          direction: Axis.vertical,
          children: [
            Container(
              height: 200,
              alignment: Alignment.centerLeft,
              child: Swiper(
                itemHeight: 171,
                itemWidth: 327,
                itemCount: cards.length + 1,
                scrollDirection: Axis.horizontal,
                loop: false,
                outer: true,
                viewportFraction: 0.9,
                itemBuilder: (_, index) {
                  final bool isIndexCreationCard = index == cards.length;
                  if (isIndexCreationCard) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: AccountCreationCard(),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: AccountDetailCard(cards[index]),
                    );
                  }
                },
                pagination: SwiperPagination(),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              width: double.infinity,
              child: BorderButton(
                child: Text("Manage accounts",),
                onPressed: () {},
              ),
            ),
          ],
        );
      },
    );
  }
}
