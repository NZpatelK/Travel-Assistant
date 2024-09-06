import 'package:flutter/material.dart';
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
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "Select a Destination",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.blueGrey,
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
                        focusNode:
                            _focusNode, // Assign the FocusNode to the SearchField
                        hint: 'Search',
                        searchInputDecoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
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
                        onSuggestionTap:
                            (SearchFieldListItem<dynamic> suggestion) {
                          setState(() {
                            _selectedDestination = suggestion.searchKey;
                          });
                          _focusNode
                              .unfocus(); // Unfocus the SearchField after selecting a suggestion
                        },
                        suggestions: const [
                          "Afghanistan",
                          "Albania",
                          "Algeria",
                          "Andorra",
                          "Angola",
                          "Antigua and Barbuda",
                          "Argentina",
                          "Armenia",
                          "Australia",
                          "Austria",
                          // Continue with the rest of the Destination list
                        ].map((e) => SearchFieldListItem(e)).toList(),
                      ),
                    ),
                  ],
                ),
              ),
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
