import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Options extends StatefulWidget {
  const Options({super.key});

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: 
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 196, 196, 196),
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child:  Row(children: [
            const Icon(Icons.airplane_ticket, color: Colors.blue, size: 60),
            const SizedBox(width: 20),
            Text(
              'Travel Plan',
              style: TextStyle(
                fontSize: 24,
                color:const Color.fromARGB(255, 54, 54, 54),
                fontWeight: FontWeight.w600,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ]),
        ),
    );
  }
}
