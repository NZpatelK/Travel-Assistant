import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/data/month_data.dart';
import 'package:myapp/widget/input_field.dart';
import 'package:myapp/widget/select_box.dart';

class RandomDestination extends StatefulWidget {
  const RandomDestination({super.key});

  @override
  State<RandomDestination> createState() => _RandomDestinationState();
}

class _RandomDestinationState extends State<RandomDestination> {
  String _selectedDepartmentMonth = 'January';
  String _selectedReturnMonth = 'April';
  String? _inputNumDestionation;
  String? _minNumDays;
  String? _maxNumDays;
  String? _budget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      Text('Random Destination',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          )),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[500],
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 36, 36, 36)
                                  .withOpacity(0.2),
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            )
                          ],
                        ),
                        padding: const EdgeInsets.all(10),
                        child: const Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                child: Container(
                  color: Colors.grey[200],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Column(
                    children: [
                      InputField(
                        inputType: "num",
                        label: "Number of destinations",
                        inputChanged: (value) {
                          setState(() {
                            _inputNumDestionation = value ?? "";
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "How many days do you want to spend at each destination? (min - max)",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Expanded(
                                  child: InputField(
                                    inputType: "num",
                                    label: "Min days",
                                    inputChanged: (value) => setState(() {
                                      _minNumDays = value ?? '';
                                    }),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Text(
                                    "To",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Expanded(
                                  child: InputField(
                                    inputType: "num",
                                    label: "Max days",
                                    inputChanged: (value) => setState(() {
                                      _maxNumDays = value ?? "";
                                    }),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      SelectBox(
                          items: MonthData.months,
                          selectedValue: _selectedDepartmentMonth,
                          onChanged: (value) {
                            setState(() {
                              _selectedDepartmentMonth = value!;
                            });
                          },
                          titleLabel: 'Select Month',
                          headerLabel: 'Select Department Month'),
                      const SizedBox(height: 10),
                      SelectBox(
                          items: MonthData.months,
                          selectedValue: _selectedReturnMonth,
                          onChanged: (value) {
                            setState(() {
                              _selectedReturnMonth = value!;
                            });
                          },
                          titleLabel: 'Select Month',
                          headerLabel: 'Select Return Month'),
                      const SizedBox(height: 10),
                      InputField(
                        inputType: "usd",
                        label: "Budget",
                        inputChanged: (value) => setState(
                          () {
                            _budget = value ?? '';
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/display',
                                arguments: {
                                  'numDestination': _inputNumDestionation,
                                  'minDays': _minNumDays,
                                  'maxDays': _maxNumDays,
                                  'leaveMonth': _selectedDepartmentMonth,
                                  'returnMonth': _selectedReturnMonth,
                                  'budget': _budget,
                                  'request': 'random itinerary'
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.blue[500], // background color
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10), // corner radius
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20), // padding
                            ),
                            child: const Text(
                              "Travel Itinerary",
                              style: TextStyle(
                                fontSize: 14, // font size
                                fontWeight: FontWeight.w400, // font weight
                                color: Colors.white, // font color
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/display',
                                arguments: {
                                  'numDestination': _inputNumDestionation,
                                  'minDays': _minNumDays,
                                  'maxDays': _maxNumDays,
                                  'leaveMonth': _selectedDepartmentMonth,
                                  'returnMonth': _selectedReturnMonth,
                                  'budget': _budget,
                                  'request': 'random options'
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                  255, 255, 255, 255), // background color
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10), // corner radius
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20), // padding
                            ),
                            child: const Text(
                              "List of Options",
                              style: TextStyle(
                                fontSize: 14, // font size
                                fontWeight: FontWeight.w500, // font weight
                                color: Colors.blue, // font color
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
