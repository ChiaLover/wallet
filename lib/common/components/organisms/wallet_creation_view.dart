part of organisms;

class WalletCreationView extends StatelessWidget {
  const WalletCreationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletCreationBloc, WalletCreationState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case Creating:
            return loadingView();
          case WalletCreateSuccess:
            return successView(context,
                onPressed: () => handlePressFinish(context));
          default:
            return Container();
        }
      },
    );
  }

  void handlePressFinish(BuildContext context) {
    try {
      Navigator.of(context).pop("testId");
    } catch (ex) {
      Log.error(ex);
    }
  }

  Widget loadingView() {
    return Flex(
      direction: Axis.vertical,
      children: [
        Spacer(
          flex: 2,
        ),
        Flexible(
          flex: 3,
          child: Flex(
            direction: Axis.vertical,
            children: [
              Container(
                height: 100,
                width: 100,
                child: WLoading(),
                margin: EdgeInsets.only(bottom: 16),
              ),
              Container(
                child: H6("Generating address your wallet"),
                margin: EdgeInsets.only(
                  bottom: 24,
                ),
              ),
              BodyText1("Waiting please..."),
            ],
          ),
        ),
        Spacer(flex: 5)
      ],
    );
  }

  Widget successView(BuildContext context, {required VoidCallback onPressed}) {
    var theme = Theme.of(context);
    return Flex(
      direction: Axis.vertical,
      children: [
        Spacer(flex: 2),
        Flexible(
          flex: 3,
          child: Flex(
            direction: Axis.vertical,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(width: 4, color: theme.primaryColor),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.check,
                    size: 32,
                    color: theme.primaryColor,
                  ),
                ),
                margin: EdgeInsets.only(bottom: 16),
              ),
              H6("Your wallet is now ready"),
            ],
          ),
        ),
        Flexible(
          flex: 5,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 62,
              width: double.infinity,
              child: PrimaryButton(
                child: Text("Finish"),
                onPressed: onPressed,
              ),
            ),
          ),
        )
      ],
    );
  }
}
