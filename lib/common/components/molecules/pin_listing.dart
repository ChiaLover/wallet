part of molecules;

class PinListing extends StatelessWidget {
  final String pinCode;
  final int totalPin;
  final Color color;

  const PinListing({
    Key? key,
    required this.pinCode,
    required this.totalPin,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> pins = List.generate(totalPin, _buildPin);
    return Flex(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      direction: Axis.horizontal,
      children: pins,
    );
  }

  Widget _buildPin(int index) {
    bool emptyValue = index >= this.pinCode.length;
    PinStatus status = emptyValue ? PinStatus.in_active : PinStatus.active;
    return Pin(status: status, color: color);
  }
}
