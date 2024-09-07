import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:searchfield/searchfield.dart';

class DropMenuWithSearchField extends StatefulWidget {
  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  final String hintText;
  final String header;
  final bool isDisabled;

  const DropMenuWithSearchField(
      {super.key,
      required this.items,
      required this.selectedValue,
      required this.onChanged,
      required this.hintText,
      required this.header,
      required this.isDisabled});

  @override
  _DropMenuWithSearchFieldState createState() =>
      _DropMenuWithSearchFieldState();
}

class _DropMenuWithSearchFieldState extends State<DropMenuWithSearchField> {
  late FocusNode _focusNode;
  String? _selectedDestination;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _selectedDestination =
        widget.selectedValue; // Initialize with selectedValue
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Text(
              widget.header,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 67, 84, 93),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 10),
                )
              ],
            ),
            child: SearchField(
              enabled: !widget.isDisabled,
              focusNode: _focusNode,
              hint: widget.hintText,
              searchInputDecoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueGrey.shade800,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueGrey.shade200,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueGrey.withOpacity(0.8),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              itemHeight: 50,
              maxSuggestionsInViewPort: 4,
              suggestionsDecoration: SuggestionDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              onSuggestionTap: (SearchFieldListItem<dynamic> suggestion) {
                setState(() {
                  _selectedDestination = suggestion.searchKey;
                });
                widget
                    .onChanged(_selectedDestination); // Notify about the change
                _focusNode
                    .unfocus(); // Unfocus the SearchField after selecting a suggestion
              },
              suggestions:
                  widget.items.map((e) => SearchFieldListItem(e)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
