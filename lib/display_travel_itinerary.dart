import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/data/prompt_request.dart';
import 'package:myapp/generate_travel_plan.dart';
import 'package:myapp/markdown_to_pdf.dart';
import 'package:open_filex/open_filex.dart';

class DisplayTravelItinerary extends StatefulWidget {
  const DisplayTravelItinerary({super.key});

  @override
  State<DisplayTravelItinerary> createState() => _DisplayTravelItineraryState();
}

class _DisplayTravelItineraryState extends State<DisplayTravelItinerary> {
  String travelPlan = "Travel Itinerary is Generating...";
  String? requestType,
      numDestination,
      country,
      leaveMonth,
      returnMonth,
      totalDays,
      minDays,
      maxDays,
      budget;
  int numGenerateDestination = 0;
  List customDestinations = [];
  List<String> wholePlan = [];
  bool isGenerate = false;

  @override
  void initState() {
    super.initState();
    isGenerate = false; // Initialization of flags
  }

  Future<void> getPlan(String? requestType) async {
    final String prompt = requestType == "random itinerary"
        ? getRandomItinerary(
            numDestination, leaveMonth, returnMonth, minDays, maxDays, budget)
        : requestType == "random options"
            ? getRandomOptions(numDestination, leaveMonth, returnMonth, minDays,
                maxDays, budget)
            : requestType == "custom itinerary"
                ? getCustomItinerary(
                    customDestinations[numGenerateDestination]["name"],
                    customDestinations[numGenerateDestination]["country"],
                    customDestinations[numGenerateDestination]["daysMin"],
                    customDestinations[numGenerateDestination]["daysMax"],
                    numGenerateDestination + 1,
                    budget,
                    customDestinations.length)
                : getCustomOption(
                    customDestinations[numGenerateDestination]["name"],
                    customDestinations[numGenerateDestination]["country"],
                    customDestinations[numGenerateDestination]["daysMin"],
                    customDestinations[numGenerateDestination]["daysMax"],
                    numGenerateDestination + 1,
                    budget,
                    customDestinations.length);

    final String result = await generateTravelPlan(prompt);

    if (result.isNotEmpty) {
      setState(() {
        travelPlan = result;
        wholePlan.add(result);
        numGenerateDestination++;
        isGenerate = true;
      });
    }
  }

  Future<void> nextDestination() async {
    if (numGenerateDestination < wholePlan.length) {
      setState(() {
        numGenerateDestination++;
        travelPlan = wholePlan[numGenerateDestination - 1];
        isGenerate = true;
      });
      return;
    }

    if (requestType == "custom itinerary" || requestType == "custom options") {
      setState(() {
        travelPlan = "Generating next destination...";
      });
      await getPlan(requestType);
      return;
    }

    if (_canGenerateNext()) {
      setState(() {
        travelPlan = "Generating next destination...";
      });
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
        travelPlan = wholePlan[numGenerateDestination - 1];
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
      customDestinations = args['customDestination'] ?? [];
      requestType = args['request'];
      numDestination =
          args['numDestination'] ?? customDestinations.length.toString();
      leaveMonth = args['leaveMonth'];
      returnMonth = args['returnMonth'];
      minDays = args['minDays'];
      maxDays = args['maxDays'];
      budget = args['budget'];
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
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      Text('Travel Itinerary',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 20,
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
                        padding: const EdgeInsets.all(10),
                        child: const Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 16,
                        ),
                      )
                    ],
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
                    padding: const EdgeInsets.all(0),
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
                              backgroundColor:
                                  Colors.blue[500], // background color
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10), // corner radius
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20), // padding
                            ),
                            child: const Text(
                              "Previous Destination",
                              style: TextStyle(
                                fontSize: 14, // font size
                                fontWeight: FontWeight.w400, // font weight
                                color: Colors.white, // font color
                              ),
                            ),
                            ),
                            const SizedBox(width: 20),
                            ElevatedButton(
                              onPressed:
                                  _canGenerateNext() ? nextDestination : null,
                              style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.blue[500], // background color
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10), // corner radius
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20), // padding
                            ),
                            child: const Text(
                              "Next Destination",
                              style: TextStyle(
                                fontSize: 14, // font size
                                fontWeight: FontWeight.w400, // font weight
                                color: Colors.white, // font color
                              ),
                            ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            final markdownContent = wholePlan.join("\n --- \n");
                            try {
                              final pdfPath = await generateMarkdownStyledPdf(
                                  markdownContent, "styled_markdown_example");
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text('PDF saved at: $pdfPath')),
                              );
                              // Open the PDF
                              await OpenFilex.open(pdfPath);
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Error: $e')),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                  255, 255, 255, 255), // background color
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10), // corner radius
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20), // padding
                            ),
                            child: const Text(
                              "Print Travel Itinerary",
                              style: TextStyle(
                                fontSize: 14, // font size
                                fontWeight: FontWeight.w500, // font weight
                                color: Colors.blue, // font color
                              ),
                            ),
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
