import 'package:flutter/material.dart';
import 'package:myapp/destination_search.dart';
import 'package:myapp/display_travel_plan.dart';
import 'package:myapp/new_design.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NewDesign(),
      routes: {
        // '/destination_search': (context) => const DestinationSearch(),
        '/display': (context) => const DisplayTravelPlan(),
      },
    );
  }
}
