part of atoms;

class SearchTextField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode? node;
  final String? hint;
  final void Function(String)? onSearchPressed;
  final void Function(String)? onTyping;

  const SearchTextField(
      {Key? key,
      required this.controller,
      this.node,
      this.hint,
      this.onSearchPressed,
      this.onTyping})
      : super(key: key);

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    final bool enableSearchButton = widget.controller.text.isNotEmpty;
    final Color primaryColor = Theme.of(context).primaryColor;
    final Color accentColor = Theme.of(context).accentColor;
    return Container(
      height: 46,
      child: TextField(
        controller: widget.controller,
        focusNode: widget.node,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(12, 8, 12, 8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: primaryColor,
            ),
          ),
          suffixIcon: Container(
            height: 44,
            width: 44,
            padding: const EdgeInsets.all(1.5),
            child: SquareButton(
              size: 44,
              onPressed: enableSearchButton
                  ? handleSearch(widget.controller.text)
                  : null,
              color: enableSearchButton ? primaryColor : accentColor,
              child: Icon(
                Icons.search,
                color: enableSearchButton ? Colors.white : WColors.osloGray,
              ),
            ),
          ),
        ),
        onChanged: (text) => handleChanged(text),
        onSubmitted: (text) => handleSearch(text),
      ),
    );
  }

  handleChanged(String text) {
    try {
      setState(() {
        if (widget.onTyping != null) {
          widget.onTyping!(text);
        }
      });
    } catch (ex) {
      Log.error(ex);
    }
  }

  handleSearch(String text) {
    try {
      setState(() {
        if (widget.onSearchPressed != null) {
          widget.onSearchPressed!(text);
        }
      });
    } catch (ex) {
      Log.error(ex);
    }
  }
}
