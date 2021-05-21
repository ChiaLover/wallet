part of organisms;

class PinCode extends StatefulWidget {
  final void Function(String)? onPinSubmitted;
  final int totalPin;
  final Color color;
  final PinCodeController? controller;

  const PinCode({
    Key? key,
    this.onPinSubmitted,
    this.controller,
    required this.totalPin,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  _PinCodeState createState() => _PinCodeState();
}

class _PinCodeState extends State<PinCode> implements _PinCodeListener {
  late TextEditingController pinController;
  late FocusNode pinFocusNode;

  _PinCodeState();

  @override
  void initState() {
    super.initState();
    widget.controller?._registerListener(this);
    pinController = TextEditingController();
    pinFocusNode = FocusNode()..requestFocus();
  }

  @override
  void dispose() {
    pinController.dispose();
    pinFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleTapPinCode,
      child: Stack(
        children: [
          Container(
            child: TextField(
              controller: pinController,
              focusNode: pinFocusNode,
              keyboardType: TextInputType.number,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.transparent),
              onChanged: handlePinChanged,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            color: Colors.transparent,
          ),
          Center(
              child: PinListing(
                  pinCode: pinController.text, totalPin: widget.totalPin)),
        ],
      ),
    );
  }

  void handleTapPinCode() {
    try {
      pinFocusNode.requestFocus();
    } catch (ex) {
      Log.error(ex);
    }
  }

  void handlePinChanged(String code) {
    try {
      setState(() {});
      if (code.length == widget.totalPin) {
        pinFocusNode.unfocus();
        if (widget.onPinSubmitted != null) {
          widget.onPinSubmitted!(code);
        }
      }
    } catch (ex) {
      Log.error(ex);
    }
  }

  @override
  handleResetPassCode() {
    this.pinController.clear();
    this.pinFocusNode.requestFocus();
  }
}

class PinCodeController {
  _PinCodeListener? _listener;

  _registerListener(_PinCodeListener listener) {
    _listener = listener;
  }

  reset() {
    _listener!.handleResetPassCode();
  }
}

abstract class _PinCodeListener {
  handleResetPassCode();
}
