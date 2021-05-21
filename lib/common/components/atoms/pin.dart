part of atoms;

enum PinStatus { in_active, active }

class Pin extends StatelessWidget {
  final PinStatus status;
  final Color color;

  const Pin({Key? key, this.status = PinStatus.in_active, this.color = Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch(status){
      case PinStatus.in_active:
        return Container(
          height: 18,
          width: 18,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: color),
            shape: BoxShape.circle,
          ),
        );
      case PinStatus.active:
        return Container(
          height: 18,
          width: 18,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        );
    }
  }
}
