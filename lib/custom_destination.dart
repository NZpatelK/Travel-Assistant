import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/add_new_destination.dart';

class CustomDestination extends StatefulWidget {
  const CustomDestination({super.key});

  @override
  State<CustomDestination> createState() => _CustomDestinationState();
}

class _CustomDestinationState extends State<CustomDestination> {
  final List destinations = [];

  void updateOrderDestinations(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) newIndex -= 1;
      final destination = destinations.removeAt(oldIndex);
      destinations.insert(newIndex, destination);
    });
  }

  void addDestination(
      String destination, String country, int daysMin, int daysMax) {
    setState(() {
      destinations.add({
        "name": destination,
        "country": country,
        "daysMin": daysMin,
        "daysMax": daysMax,
      });
    });
  }

  void deleteDestination(int index) {
    setState(() {
      destinations.removeAt(index);
    });
  }

  void showAddDestinationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            insetPadding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 100.0),
            child: AddNewDestination(onAddDestination: addDestination));
      },
    );
  }

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Custom Destination',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
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
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
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
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            // Implement your submit functionality here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[500],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text('Submit', style: TextStyle(fontSize: 18, color: Colors.white),),
                        ),
                      ),
                      const SizedBox(height: 10), // Add spacing if needed
                      Expanded(
                        child: ReorderableListView(
                          onReorder: (oldIndex, newIndex) =>
                              updateOrderDestinations(oldIndex, newIndex),
                          children: [
                            for (int index = 0;
                                index < destinations.length;
                                index++)
                              Container(
                                key: ValueKey(index),
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: ListTile(
                                  title: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              '${destinations[index]["name"]} ',
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                        TextSpan(
                                          text:
                                              '- ${destinations[index]["country"]}',
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 117, 117, 117),
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                  subtitle: Text.rich(
                                    TextSpan(
                                      text: 'Average Days Spent: ',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text:
                                              'Min ${destinations[index]["daysMin"]} - Max ${destinations[index]["daysMax"]}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                  ),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                    onPressed: () => deleteDestination(index),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: ElevatedButton.icon(
          onPressed: showAddDestinationDialog,
          icon: const Icon(Icons.add, color: Colors.white),
          label: const Text(
            'Add New Destination',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          ),
        ),
      ),
    );
  }
}
