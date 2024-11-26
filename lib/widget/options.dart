import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:myapp/custom_destination.dart';
import 'package:myapp/random_destination.dart';

class Options extends StatefulWidget {
  final String label;
  final String pageName;

  const Options({
    super.key,
    required this.label,
    required this.pageName,
  });

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => widget.pageName == "random" ? const RandomDestination() : const CustomDestination(), transition: Transition.leftToRightWithFade);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 196, 196, 196),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(children: [
          const Icon(Icons.airplane_ticket, color: Colors.blue, size: 35),
          const SizedBox(width: 20),
          Text(
            widget.label,
            style: TextStyle(
              fontSize: 14,
              color: const Color.fromARGB(255, 54, 54, 54),
              fontWeight: FontWeight.w600,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
        ]),
      ),
    );
  }
}
