import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/data/prompt_request.dart';
import 'package:myapp/generate_travel_plan.dart';
import 'package:myapp/markdown_to_pdf.dart';

class DisplayTravelPlan extends StatefulWidget {
  const DisplayTravelPlan({Key? key}) : super(key: key);

  @override
  State<DisplayTravelPlan> createState() => _DisplayTravelPlanState();
}

class _DisplayTravelPlanState extends State<DisplayTravelPlan> {
  String travelPlan = "Travel Plan is Generating...";
  String? requestType,
      numDestination,
      country,
      leaveMonth,
      returnMonth,
      totalDays,
      minDays,
      maxDays;
  int numGenerateDestination = 0;
  List<String> wholePlan = [];
  bool isGenerate = false;

  @override
  void initState() {
    super.initState();
    isGenerate = false; // Initialization of flags
  }

  Future<void> getPlan(String? requestType) async {
    if (requestType == "random itinerary") {
      final result = await generateTravelPlan(
        getRandomItinerary(
            numDestination, leaveMonth, returnMonth, minDays, maxDays),
      );

      if (result.isNotEmpty) {
        setState(() {
          travelPlan = result;
          wholePlan.add(result);
          numGenerateDestination++;
          isGenerate = true;
        });
      }
    }
  }

  Future<void> nextDestination() async {
    if (numGenerateDestination < wholePlan.length) {
      setState(() {
        numGenerateDestination++;
        print(numGenerateDestination);
        travelPlan = wholePlan[numGenerateDestination-1];
        isGenerate = true;
      });
    } else if (_canGenerateNext()) {
      final result = await generateTravelPlan("next destination");
      if (result.isNotEmpty) {
        setState(() {
          wholePlan.add(result);
          numGenerateDestination++;
          travelPlan = result;
          isGenerate = true;
        });
      }
    }
  }

  void prevDestination() {
    if (numGenerateDestination > 0) {
      setState(() {
        numGenerateDestination--;
        travelPlan = wholePlan[numGenerateDestination-1];
        isGenerate = true;
      });
    }
  }

  bool _canGenerateNext() {
    final numDest = int.parse(numDestination ?? '0');
    return numDest > numGenerateDestination;
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    if (args != null) {
      requestType = args['request'];
      numDestination = args['numDestination'];
      leaveMonth = args['leaveMonth'];
      returnMonth = args['returnMonth'];
      minDays = args['minDays'];
      maxDays = args['maxDays'];
    }

    if (!isGenerate) {
      getPlan(requestType);
    }

    return Scaffold(
      backgroundColor: Colors.blue[800],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Travel Assistant',
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
                        ),
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
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        MarkdownBody(data: travelPlan),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: numGenerateDestination - 1 > 0
                                  ? prevDestination
                                  : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue[500],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 30),
                              ),
                              child: const Text(
                                'Previous Destination',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ),
                            const SizedBox(width: 20),
                            ElevatedButton(
                              onPressed:
                                  _canGenerateNext() ? nextDestination : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue[500],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 30),
                              ),
                              child: const Text(
                                'Next Destination',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
