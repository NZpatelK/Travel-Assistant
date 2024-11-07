import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/destination_input.dart';
import 'package:myapp/select_box.dart';

class RandomDestination extends StatefulWidget {
  const RandomDestination({super.key});

  @override
  State<RandomDestination> createState() => _RandomDestinationState();
}

class _RandomDestinationState extends State<RandomDestination> {
  String _selectedDepartmentMonth = 'January';
  String _selectedReturnMonth = 'January';
  int? _inputDays;
  int? _inputNumDestionation;
  int? _minNumDays;
  int? _maxNumDays;

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
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Random Destionation',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 24,
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
                        padding: const EdgeInsets.all(14),
                        child: const Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                child: Container(
                  color: Colors.grey[200],
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      DestinationInput(
                        inputType: "num",
                        label: "number of destinations",
                        inputChanged: (value) {
                          setState(() {
                            _inputNumDestionation = value! as int;
                          });
                        },
                      ),
                      const SizedBox(height: 30),
                      DestinationInput(
                        inputType: "num",
                        label: "Total number of days",
                        inputChanged: (value) {
                          setState(() {
                            _inputDays = value! as int;
                          });
                        },
                      ),
                      const SizedBox(height: 30),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "How many days do you want to spend at each destination? (min - max)",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Expanded(
                                  child: DestinationInput(
                                    inputType: "num",
                                    label: "Min days",
                                    inputChanged: (value) => setState(() {
                                      _minNumDays =
                                          int.tryParse(value ?? '') ?? 0;
                                    }),
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 50),
                                  child: Text(
                                    "To",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Expanded(
                                  child: DestinationInput(
                                    inputType: "num",
                                    label: "Max days",
                                    inputChanged: (value) => setState(() {
                                      _maxNumDays =
                                          int.tryParse(value ?? '') ?? 0;
                                    }),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      SelectBox(
                          items: const [
                            'January',
                            'February',
                            'March',
                            'April',
                            'May',
                            'June',
                            'July',
                            'August',
                            'September',
                            'October',
                            'November',
                            'December'
                          ],
                          selectedValue: _selectedDepartmentMonth,
                          onChanged: (value) {
                            setState(() {
                              _selectedDepartmentMonth = value!;
                            });
                          },
                          titleLabel: 'Select Month',
                          headerLabel: 'Select Department Month'),
                      const SizedBox(height: 30),
                      SelectBox(
                          items: const [
                            'January',
                            'February',
                            'March',
                            'April',
                            'May',
                            'June',
                            'July',
                            'August',
                            'September',
                            'October',
                            'November',
                            'December'
                          ],
                          selectedValue: _selectedReturnMonth,
                          onChanged: (value) {
                            setState(() {
                              _selectedReturnMonth = value!;
                            });
                          },
                          titleLabel: 'Select Month',
                          headerLabel: 'Select Return Month'),
                      const SizedBox(height: 30),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: null,
                            child: Text("Travel Itinerary"),
                          ),
                          SizedBox(width: 20),
                          ElevatedButton(
                            onPressed: null,
                            child: Text("List of Options"),
                          ),
                        ],
                      )
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
