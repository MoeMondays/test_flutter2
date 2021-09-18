import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'game.dart';

class GuessNum extends StatefulWidget {
  const GuessNum({Key? key}) : super(key: key);

  @override
  _GuessNumState createState() => _GuessNumState();
}

class _GuessNumState extends State<GuessNum> {
  late Game _game;
  final TextEditingController _controller = TextEditingController();
  String? _guessNumber;
  String? _feedback;

  @override
  void initState() {
    super.initState();
    _game = Game();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellow.shade100,

        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildHeader(),
                _buildMainContent(),
                _buildInputPanel(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Center(
      child: Column(
        children: [
          Image.asset(
            "assets/images/logo_number.png",
            width: 240,
          ),
          Text("GUESS THE NUMBER", style: GoogleFonts.kanit(fontSize: 22),),
        ],
      ),
    );
  }

  Widget _buildMainContent(){
    return _guessNumber == null
        ? SizedBox.shrink()
        : Column(
            children: [
              Text(_guessNumber!),
              Text(_feedback!),
            ],
          );
  }

  Widget _buildInputPanel() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,

            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red)
              )
            ),
          ),
        ),

        TextButton(
          onPressed: (){
            setState(() {
              _guessNumber = _controller.text;
              int? guess = int.tryParse(_guessNumber!);
              if(guess != null) {
                var result = _game.doGuess(guess);
                if(result == 0){
                  _feedback = "CORRECT";
                }
                else if(result == 1){
                  _feedback = "TOO HIGH";
                }
                else{
                  _feedback = "TOO LOW";
                }
              }
            });
          },
          child: Text("GUESS")
        ),
      ],
    );
  }
}
