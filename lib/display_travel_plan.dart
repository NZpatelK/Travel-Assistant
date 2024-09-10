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
  String? destination;
  String? city;
  DateTime? arrival;
  DateTime? departure;
  bool isGenerate = false;

  @override
  void initState() {
    super.initState();
    initModel();
    setState(() {
      isGenerate = false;
    });
  }

  void getPlan() async {
    String result = await generateTravelPlan(
        'Create list of options of what to visit place, activites, hidden gems, hidden place, interesting thing, food, drink, hotel, transport, fun and much that we should visit. here my travel detail. Destination: $destination, City: $city, Arrival: $arrival, Departure: $departure');
    setState(() {
      travelPlan = result;
      isGenerate = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    destination = args['destination'];
    city = args['city'];
    arrival = args['arrival'];
    departure = args['departure'];

    if (!isGenerate) {
      getPlan();
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Travel Plan')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            MarkdownBody(data: travelPlan),
          ]),
        ),
      ),
    );
  }
}
