import 'package:flutter/material.dart';
import 'package:myapp/generate_travel_plan.dart';
import 'package:flutter_markdown/flutter_markdown.dart';


class DisplayTravelPlan extends StatefulWidget {
  const DisplayTravelPlan({super.key});

  @override
  _DisplayTravelPlanState createState() => _DisplayTravelPlanState();
}

class _DisplayTravelPlanState extends State<DisplayTravelPlan> {
  String travelPlan = "Travel Plan is Generating...";

  @override
  void initState() {
    super.initState();
    initModel();
  }

  void getPlan(plan) async {
    String result = await generateTravelPlan(plan);
    setState(() {
      travelPlan = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    final destination = args['destination'];
    final city = args['city'];
    final arrival = args['arrival'];
    final departure = args['departure'];

    getPlan(
        'Create a travel plan here my detail. Destination: $destination, City: $city, Arrival: $arrival, Departure: $departure');

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Travel Plan')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            MarkdownBody(data:travelPlan),
          ]),
        ),
      ),
    );
  }
}
