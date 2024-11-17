import 'package:flutter/material.dart';
import 'package:myapp/generate_travel_plan.dart';

class DisplayTravelPlan extends StatefulWidget {
  const DisplayTravelPlan({super.key});

  @override
  State<DisplayTravelPlan> createState() => _DisplayTravelPlanState();
}

class _DisplayTravelPlanState extends State<DisplayTravelPlan> {
  String travelPlan = "Travel Plan is Generating...";
  String? numDestination;
  String? country;
  String? leaveMonth;
  String? returnMonth;
  String? totalDays;
  String? minDays;
  String? maxDays;

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
    // String result = await generateTravelPlan(
    //     'Create list of options of what to visit place, activites, hidden gems, hidden place, interesting thing, food, drink, hotel, transport, fun and much that we should visit. here my travel detail. Destination: $destination, City: $city, Arrival: $arrival, Departure: $departure');
    setState(() {
      // travelPlan = result;
      isGenerate = true;
    });
  }

  // @override
  // Widget build(BuildContext context) {
  //   final args = ModalRoute.of(context)!.settings.arguments as Map;

  //   destination = args['destination'];
  //   city = args['city'];
  //   arrival = args['arrival'];
  //   departure = args['departure'];

  //   if (!isGenerate) {
  //     getPlan();
  //   }

  //   return MaterialApp(
  //     home: Scaffold(
  //       appBar: AppBar(title: const Text('Travel Plan')),
  //       body: SingleChildScrollView(
  //         padding: const EdgeInsets.all(20),
  //         child: Column(children: [
  //           MarkdownBody(data: travelPlan),
  //         ]),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    numDestination = args['numDestination'];
    // country = args['country'];
    totalDays = args['totalDays'];
    leaveMonth = args['leaveMonth'];
    returnMonth = args['returnMonth'];
    minDays = args['minDays'];
    maxDays = args['maxDays'];

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
            Text(numDestination!),
            Text(totalDays!),
            Text(minDays!),
            Text(maxDays!),
            // Text(country!),
            Text(leaveMonth!),
            Text(returnMonth!),
          ],
        ),
      ),
    );
  }
}
