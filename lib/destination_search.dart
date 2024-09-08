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
  DateTime? _arrivalDate;
  DateTime? _departureDate;

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

  bool checkInput() {
    if (_selectedDestination == null ||
        _selectedCity == null ||
        _arrivalDate == null ||
        _departureDate == null) {
      return false;
    }
    return true;
  }

  String outputDisplay() {
    final arrival = _arrivalDate;
    final departure = _departureDate;
    if (arrival == null || departure == null) return '';
    final days = departure.difference(arrival).inDays;
    return '$_selectedDestination - $_selectedCity, total days - $days';
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
              DatePicker(
                title: "Arrival Date",
                onDateChanged: (selectedDate) {
                  setState(() {
                    _arrivalDate = selectedDate;
                  });
                },
                selectedDate: _arrivalDate ?? DateTime.now(),
              ),
              DatePicker(
                title: "Departure Date",
                onDateChanged: (selectedDate) {
                  setState(() {
                    _departureDate = selectedDate;
                  });
                },
                selectedDate: _departureDate ?? DateTime.now(),
              ),
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
                    !checkInput()
                        ? const Text(
                            'Please select a destination to continue',
                            style:
                                TextStyle(fontSize: 16, color: Colors.blueGrey),
                          )
                        : Text(
                            outputDisplay(),
                            style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                    MaterialButton(
                      onPressed: () {
                        if (checkInput()) {
                          Navigator.pushNamed(
                            context,
                            '/display',
                            arguments: {
                              'destination': _selectedDestination,
                              'city': _selectedCity,
                              'arrival': _arrivalDate,
                              'departure': _departureDate
                            },
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Please select a destination to continue'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      },
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
