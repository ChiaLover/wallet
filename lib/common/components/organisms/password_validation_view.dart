part of organisms;

class PasswordValidationView extends StatefulWidget {
  const PasswordValidationView({Key? key}) : super(key: key);

  @override
  _PasswordValidationViewState createState() => _PasswordValidationViewState();
}

class _PasswordValidationViewState extends State<PasswordValidationView> {
  PinCodeController controller = PinCodeController();

  @override
  Widget build(BuildContext context) {
    int totalPin = Config.getInt("total_pin") ??
        WalletCreationPasswordModal.defaultTotalPin;
    return BlocListener<WalletCreationBloc, WalletCreationState>(
      listener: _handleWalletCreationStateChanged,
      child: Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: H5("Type your PIN again"),
            margin: EdgeInsets.only(bottom: 8),
          ),
          BodyText1(
              "There will be NO ‘Restore PIN’ button. Make sure you remember it."),
          Spacer(),
          Container(
            height: 40,
            margin: EdgeInsets.symmetric(horizontal: 70),
            child: PinCode(
              totalPin: totalPin,
              controller: controller,
              onTypePinCompleted: (code) =>
                  handleTypeValidPasscodeCompleted(context, code),
            ),
          ),
          Spacer(),
          Subtitle2(
              "Since you're going to be your own bank, we won't be able to help if you lose your PIN."),
        ],
      ),
    );
  }

  void handleTypeValidPasscodeCompleted(BuildContext context, String passcode) {
    BlocProvider.of<WalletCreationBloc>(context).add(ValidPasscode(passcode));
  }

  void _handleWalletCreationStateChanged(
      BuildContext context, WalletCreationState state) {
    if (state is WrongPasscode) {
      controller.reset();
    }
  }
}
