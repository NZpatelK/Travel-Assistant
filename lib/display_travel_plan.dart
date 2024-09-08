import 'package:flutter/material.dart';

class DisplayTravelPlan extends StatelessWidget {
  const DisplayTravelPlan({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    final destination = args['destination'];
    final city = args['city'];
    final arrival = args['arrival'];
    final departure = args['departure'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel Plan'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Destination: $destination'),
            Text('City: $city'),
            Text('Arrival: $arrival'),
            Text('Departure: $departure'),
          ],
        ),
      ),
    );

    
  }
}
