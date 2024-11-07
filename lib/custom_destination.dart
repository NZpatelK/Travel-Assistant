import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDestination extends StatefulWidget {
  const CustomDestination({super.key});

  @override
  State<CustomDestination> createState() => _CustomDestinationState();
}

class _CustomDestinationState extends State<CustomDestination> {
  final List destinations = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
  ];

  void updateOrderDestinations(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final destination = destinations.removeAt(oldIndex);
      destinations.insert(newIndex, destination);
    });
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
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Custom Destination',
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
                  child: ReorderableListView(
                    children: [
                      for (final destination in destinations)
                        ListTile(
                          key: Key(destination),
                          title: Text(destination),
                        )
                    ],
                    onReorder: (oldIndex, newIndex) =>
                        updateOrderDestinations(oldIndex, newIndex),
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
          onPressed: () {
            // Add your action here to add a new destination
          },
          icon: const Icon(Icons.add, color: Colors.white,), // Icon for button
          label: const Text(
            'Add New Destination',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Button color
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
