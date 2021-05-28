part of pages;

class WalletDetailPage extends StatefulWidget {
  final String walletId;

  const WalletDetailPage(this.walletId, {Key? key}) : super(key: key);

  @override
  _WalletDetailPageState createState() => _WalletDetailPageState();
}

class _WalletDetailPageState extends State<WalletDetailPage> {
  late WalletDetailBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = WalletDetailBloc();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => bloc,
        child: SafeArea(
          child: Container(
            child: WalletDetailTemplate(),
          ),
        ),
      ),
    );
  }
}
