import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final Function(String val) onChanged;

  const SearchBar({Key? key, required this.onChanged}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.red,
      style: const TextStyle(color: Colors.red),
      decoration: InputDecoration(
        border: textFieldOutlineBorder(),
        enabledBorder: textFieldOutlineBorder(),
        focusedBorder: textFieldOutlineBorder(width: 2),
        hintText: "Search",
        hintStyle: TextStyle(color: Colors.red.withOpacity(0.5)),
        prefixIcon: const Icon(Icons.search, color: Colors.red),
      ),
      textInputAction: TextInputAction.search,
      onChanged: widget.onChanged,
    );
  }

  OutlineInputBorder textFieldOutlineBorder({double width = 1}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(width: width, color: Colors.red),
      );
}
