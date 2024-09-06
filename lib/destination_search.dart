import 'package:flutter/material.dart';
import 'drop_menu_with_search_field.dart';
import 'destination_data.dart';

import 'package:searchfield/searchfield.dart';

class DestinationSearch extends StatefulWidget {
  const DestinationSearch({super.key});

  @override
  _DestinationSearchState createState() => _DestinationSearchState();
}

class _DestinationSearchState extends State<DestinationSearch> {
  String? _selectedDestination;
  final FocusNode _focusNode = FocusNode(); // Add a FocusNode

  @override
  void initState() {
    super.initState();
    // Add a listener to the FocusNode
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        // Do something when the SearchField loses focus
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _focusNode
        .dispose(); // Dispose of the FocusNode when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Unfocus any focused widget
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            "Travel Plan",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropMenuWithSearchField(
                  items: DestinationData.destinations.keys.toList(),
                  selectedValue: _selectedDestination,
                  onChanged: (selectedValue) {
                    setState(() {
                      _selectedDestination = selectedValue;
                    });
                  },
                  hintText: "Select a Destination"),
              Container(
                height: 90,
                padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _selectedDestination == null
                        ? const Text(
                            'Please select a destination to continue',
                            style:
                                TextStyle(fontSize: 16, color: Colors.blueGrey),
                          )
                        : Text(
                            _selectedDestination!,
                            style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                    MaterialButton(
                      onPressed: () {},
                      minWidth: 50,
                      height: 50,
                      color: const Color.fromARGB(255, 27, 132, 251),
                      padding: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: const Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
