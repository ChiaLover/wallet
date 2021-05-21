part of templates;

class WalletCreationPasswordModal extends StatefulWidget {
  static final int defaultTotalPin = 6;

  const WalletCreationPasswordModal({Key? key}) : super(key: key);

  @override
  _WalletCreationPasswordModalState createState() =>
      _WalletCreationPasswordModalState();
}

class _WalletCreationPasswordModalState
    extends State<WalletCreationPasswordModal> {
  late WalletCreationBloc passwordCreationBloc;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    passwordCreationBloc = WalletCreationBloc();
    pageController = PageController();
  }

  @override
  void dispose() {
    Log.info("Wallet Creation Password Modal => dispose");
    passwordCreationBloc.close();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => passwordCreationBloc,
      child: BlocListener(
        bloc: passwordCreationBloc,
        listener: handlePassCreationBlocChanged,
        child: Container(
          padding: MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
              .padding,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: PreferredSize(
              preferredSize: Size(double.infinity, 64),
              child: BlocBuilder(
                bloc: passwordCreationBloc,
                builder: (context, state) {
                  switch (state.runtimeType) {
                    case PassCodeCreation:
                    case PassCodeValidation:
                      return AppBar(
                        title: H6("Create password"),
                      );
                    default:
                      return SizedBox();
                  }
                },
              ),
            ),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: PageView(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  PasswordCreationView(),
                  PasswordValidationView(),
                  WalletCreationView(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void handlePassCreationBlocChanged(
      BuildContext context, WalletCreationState newState) {
    switch (newState.runtimeType) {
      case PassCodeValidation:
        goToValidView(context);
        break;
      case Creating:
      case WalletCreateSuccess:
      case WalletCreateFailure:
        goToWalletCreationView(context);
        break;
    }
  }

  void goToValidView(BuildContext context) {
    pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.bounceInOut,
    );
  }

  void goToWalletCreationView(BuildContext context) {
    if (pageController.page != 2) {
      pageController.animateToPage(
        2,
        duration: const Duration(milliseconds: 400),
        curve: Curves.bounceInOut,
      );
    }
  }
}
