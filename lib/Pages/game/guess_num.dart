import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GuessNum extends StatefulWidget {
  const GuessNum({Key? key}) : super(key: key);

  @override
  _GuessNumState createState() => _GuessNumState();
}

class _GuessNumState extends State<GuessNum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/logo_number.png",
                          width: 240,
                        ),
                        Text("GUESS THE NUMBER", style: GoogleFonts.kanit(fontSize: 22),),
                      ],
                    ),
                  ),

                  Text("TEST"),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)
                            )
                          ),
                        ),
                      ),

                      TextButton(onPressed: (){}, child: Text("GUESS")),
                    ],
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
