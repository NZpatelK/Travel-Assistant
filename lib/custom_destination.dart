import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/add_new_destination.dart';
import 'package:myapp/options_v2.dart';
import 'package:myapp/select_box.dart';

class CustomDestination extends StatefulWidget {
  const CustomDestination({super.key});

  @override
  State<CustomDestination> createState() => _CustomDestinationState();
}

class _CustomDestinationState extends State<CustomDestination> {
  final List destinations = [];

  final List<Map<String, List<String>>> destinationList = [
    {
      'France': ['Paris', 'Nice', 'Lyon', 'Marseille', 'Bordeaux']
    },
    {
      'United Kingdom': [
        'London',
        'Edinburgh',
        'Manchester',
        'Bristol',
        'Liverpool'
      ]
    },
    {
      'United States': [
        'New York',
        'Los Angeles',
        'Chicago',
        'San Francisco',
        'Miami'
      ]
    },
    {
      'Japan': ['Tokyo', 'Osaka', 'Kyoto', 'Hokkaido', 'Fukuoka']
    },
    {
      'Australia': ['Sydney', 'Melbourne', 'Brisbane', 'Perth', 'Adelaide']
    },
    {
      'Italy': ['Rome', 'Venice', 'Florence', 'Milan', 'Naples']
    },
    {
      'Spain': ['Madrid', 'Barcelona', 'Seville', 'Valencia', 'Granada']
    },
    {
      'Germany': ['Berlin', 'Munich', 'Hamburg', 'Frankfurt', 'Cologne']
    },
    {
      'Canada': ['Toronto', 'Vancouver', 'Montreal', 'Ottawa', 'Calgary']
    },
    {
      'Brazil': [
        'Rio de Janeiro',
        'São Paulo',
        'Brasília',
        'Salvador',
        'Fortaleza'
      ]
    },
    {
      'Mexico': ['Mexico City', 'Cancún', 'Guadalajara', 'Monterrey', 'Puebla']
    },
    {
      'India': ['New Delhi', 'Mumbai', 'Bangalore', 'Chennai', 'Kolkata']
    },
    {
      'China': ['Beijing', 'Shanghai', 'Hong Kong', 'Xi’an', 'Chengdu']
    },
    {
      'South Africa': [
        'Cape Town',
        'Johannesburg',
        'Durban',
        'Pretoria',
        'Port Elizabeth'
      ]
    },
    {
      'Egypt': ['Cairo', 'Alexandria', 'Luxor', 'Sharm El Sheikh', 'Giza']
    },
    {
      'Argentina': [
        'Buenos Aires',
        'Córdoba',
        'Mendoza',
        'Rosario',
        'Bariloche'
      ]
    },
    {
      'Thailand': ['Bangkok', 'Chiang Mai', 'Phuket', 'Ayutthaya', 'Pattaya']
    },
    {
      'United Arab Emirates': [
        'Dubai',
        'Abu Dhabi',
        'Sharjah',
        'Ajman',
        'Ras Al Khaimah'
      ]
    },
    {
      'Russia': [
        'Moscow',
        'Saint Petersburg',
        'Sochi',
        'Kazan',
        'Yekaterinburg'
      ]
    },
    {
      'Greece': ['Athens', 'Santorini', 'Mykonos', 'Crete', 'Rhodes']
    }
  ];

  int selectedDestinationIndex = 0;
  int selectedCountryIndex = 0;

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
    final daysMinController = TextEditingController();
    final daysMaxController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(
              horizontal: 20.0), // Adjust horizontal padding
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            height: 400.0,
            child:
                const AddNewDestination(), // Set custom height for the dialog
          ),
        );
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
                  child: ReorderableListView(
                    children: [
                      for (int index = 0; index < destinations.length; index++)
                        Container(
                          key: Key(destinations[index]["name"]),
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
                                    text: '${destinations[index]["name"]} ',
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: '- ${destinations[index]["country"]}',
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 117, 117, 117),
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
                                        'Min ${destinations[index]["daysMin"]}, Max ${destinations[index]["daysMax"]}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => deleteDestination(index),
                            ),
                          ),
                        ),
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
