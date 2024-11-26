import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/data/destination_data.dart';
import 'package:myapp/widget/input_field.dart';
import 'package:myapp/widget/select_box.dart';

class AddNewDestination extends StatefulWidget {
  final Function(String, String, int, int) onAddDestination;
  const AddNewDestination({super.key, required this.onAddDestination});

  @override
  State<AddNewDestination> createState() => _AddNewDestinationState();
}

class _AddNewDestinationState extends State<AddNewDestination> {
  final List<Map<String, List<String>>> destinationList =
      DestinationData.destination;

  String selectedCountry = DestinationData.destination[0].keys.first;
  String? selectedCity;
  List<String> cities = [];
  int? _minNumDays;
  int? _maxNumDays;

  @override
  void initState() {
    super.initState();
    updateCities();
  }

  void updateCities() {
    // Find the map that contains the selected country and update the list of cities
    final countryMap = destinationList.firstWhere(
      (map) => map.containsKey(selectedCountry),
      orElse: () => {},
    );
    setState(() {
      cities = countryMap[selectedCountry] ?? [];
      selectedCity = cities[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      height: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Add New Destination",
            style: GoogleFonts.poppins(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          SelectBox(
            items: destinationList.map((map) => map.keys.first).toList(),
            selectedValue: selectedCountry,
            onChanged: (value) {
              setState(() {
                selectedCountry = value!;
                updateCities();
              });
            },
            titleLabel: 'Country',
            headerLabel: "Select Country",
          ),
          const SizedBox(height: 10),
          SelectBox(
            items: cities,
            selectedValue: (selectedCity?.isEmpty ?? true) ||
                    !cities.contains(selectedCity)
                ? cities.first
                : selectedCity!,
            onChanged: (value) {
              setState(() {
                selectedCity = value;
              });
            },
            titleLabel: 'City',
            headerLabel: "Select Destination",
          ),
          const SizedBox(height: 15),
          Container(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "How many days do you want to spend at each destination? (min - max)",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: InputField(
                        inputType: "num",
                        label: "Min days",
                        inputChanged: (value) => setState(() {
                          _minNumDays = int.tryParse(value ?? '') ?? 0;
                        }),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "To",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: InputField(
                        inputType: "num",
                        label: "Max days",
                        inputChanged: (value) => setState(() {
                          _maxNumDays = int.tryParse(value ?? '') ?? 0;
                        }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // const SizedBox(height: 20),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: 120, // Fixed width
                  height: 50, // Fixed height
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle cancel action
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.transparent, // Set transparent background
                      shadowColor:
                          Colors.transparent, // Remove shadow if desired
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(
                            color: Color.fromARGB(
                                255, 211, 33, 20)), // Optional border color
                      ),
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 211, 33, 20),
                      ),
                    ),
                  )),
              const SizedBox(width: 20), // Add spacing between buttons
              SizedBox(
                width: 150, // Fixed width
                height: 50, // Fixed height
                child: ElevatedButton(
                  onPressed: () {
                    widget.onAddDestination(selectedCity ?? "", selectedCountry,
                        _minNumDays ?? 0, _maxNumDays ?? 0);
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor: Colors.blue[500],
                  ),
                  child: const Text(
                    "Add",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
