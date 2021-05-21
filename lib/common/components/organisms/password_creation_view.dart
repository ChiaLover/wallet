part of organisms;

class PasswordCreationView extends StatelessWidget {
  const PasswordCreationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int totalPin = Config.getInt("total_pin") ??
        WalletCreationPasswordModal.defaultTotalPin;
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          child: H5("Create a PIN"),
          margin: EdgeInsets.only(bottom: 8),
        ),
        BodyText1("So no one else but you can unlock your wallet."),
        Spacer(),
        Container(
          height: 40,
          margin: EdgeInsets.symmetric(horizontal: 70),
          child: PinCode(
            totalPin: totalPin,
            onTypePinCompleted: (code) =>
                handleTypePasscodeCompleted(context, code),
          ),
        ),
        Spacer(),
        Subtitle2(
            "PINs are just as secure as long passwords, but easier to use and remember."),
      ],
    );
  }

  void handleTypePasscodeCompleted(BuildContext context, String passcode) {
    BlocProvider.of<WalletCreationBloc>(context)
        .add(CreatePassCode(passcode));
  }
}
