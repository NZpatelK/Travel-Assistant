import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/destination_input.dart';
import 'package:myapp/select_box.dart';

class AddNewDestination extends StatefulWidget {
  const AddNewDestination({super.key});

  @override
  State<AddNewDestination> createState() => _AddNewDestinationState();
}

class _AddNewDestinationState extends State<AddNewDestination> {
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
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      height: 400.0, // Set custom height for the dialog
      child: Column(children: [
        Text(
          "Add New Destination",
          style: GoogleFonts.poppins(color: Colors.black, fontSize: 20),
        ),
        const SizedBox(height: 30),
        SelectBox(
          items: destinationList.map((map) => map.keys.first).toList(),
          selectedValue: "hello",
          onChanged: (value) {},
          titleLabel: 'Destination',
          headerLabel: "Select Destination1",
        ),
        const SizedBox(height: 30),
        SelectBox(
          items: destinationList.map((map) => map.keys.first).toList(),
          selectedValue: "hello",
          onChanged: (value) {},
          titleLabel: 'Destination',
          headerLabel: "Select Destination2",
        ),
      ]),
    );
  }
}
