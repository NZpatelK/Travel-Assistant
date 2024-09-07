import 'package:flutter/material.dart';
import 'drop_menu_with_search_field.dart';
import 'destination_data.dart';
import 'datepicker.dart';

class DestinationSearch extends StatefulWidget {
  const DestinationSearch({super.key});

  @override
  _DestinationSearchState createState() => _DestinationSearchState();
}

class _DestinationSearchState extends State<DestinationSearch> {
  String? _selectedDestination;
  String? _selectedCity;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
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
        body: SizedBox(
          child: Column(
            children: [
              DropMenuWithSearchField(
                items: DestinationData.destinations.keys.toList(),
                selectedValue: _selectedDestination,
                onChanged: (selectedValue) {
                  setState(() {
                    _selectedDestination = selectedValue;
                  });
                },
                hintText: "Destination",
                header: "Select Destination",
                isDisabled: false,
              ),
              const SizedBox(height: 16.0),
              DropMenuWithSearchField(
                items: _selectedDestination == null
                    ? []
                    : DestinationData.destinations[_selectedDestination!]
                            ?.toList() ??
                        [],
                selectedValue: _selectedCity,
                onChanged: (selectedValue) {
                  setState(() {
                    _selectedCity = selectedValue;
                  });
                },
                hintText: "City",
                header: "Select City",
                isDisabled: _selectedDestination == null,
              ),
              const DatePicker(),
              const Spacer(), // This pushes the bottom container to the bottom of the screen
              Container(
                height: 90,
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
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
