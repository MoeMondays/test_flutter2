import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello/Pages/works/GuessGame.dart';

class GuessNumber extends StatefulWidget {
  const GuessNumber({Key? key}) : super(key: key);

  @override
  _GuessNumberState createState() => _GuessNumberState();
}

class _GuessNumberState extends State<GuessNumber> {
  final TextEditingController _controller = TextEditingController();
  late GuessGame _guessGame;
  late String _guessNum;
  late String _feedback;
  late bool _played;
  late bool _end;

  void initState(){
    super.initState();
    _guessGame = GuessGame();
    _guessNum = "";
    _feedback = "";
    _played = false;
    _end = false;
  }

  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  _setDefault(){
    _guessGame = GuessGame();
    _guessNum = "";
    _feedback = "";
    _played = false;
    _end = false;
  }
  
  _printList(List list){
    String line = "";
    for(var item in list)
      line += item.toString()+" -> ";

    return line.substring(0, line.lastIndexOf("-"));
  }

  _noEnterDialog(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Error"),
          content: Text("Please enter a number"),
          actions: [
            TextButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
            )
          ],
        );
      },
    );
  }

  _completeDialog(int answer, int round, List guess){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("GOOD JOB!"),
          content: Text(
              "The answer is $answer\nYou have made $round guess(es)\n\n"+
              _printList(guess)
          ),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            )
          ],
        );
      },
    );
  }

  _buildHeader(){
    return Center(
      child: Column(
        children: [
          Image.asset("assets/images/logo_number.png", width: 240,),
          Text("GUESS THE NUMBER", style: GoogleFonts.sriracha(fontSize: 25, color: Colors.blue)),
        ],
      ),
    );
  }

  _buildMainContent(){
    return Center(
      child: Column(
        children: [
          Text(
            "I'm thinking of a number between 1 and 100\n",
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Can you guess it? ", style: TextStyle(fontSize: 25,),),
              Icon(
                Icons.favorite,
                color: Colors.red,
              )
            ],
          ),
        ],
      )
    );
  }

  _buildFeedback(){
    return Center(
      child: Column(
        children: [
          Text(_guessNum.toString(), style: TextStyle(fontSize: 80),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(_feedback.toString().contains("CORRECT!"))
                Icon(Icons.check, color: Colors.green,)
              else
                Icon(Icons.clear, color: Colors.red,),

              Text(" "+_feedback.toString(), style: TextStyle(fontSize: 25),),
            ],
          ),

          Text("\n"),

          if(_end)
            OutlinedButton(
                onPressed: (){
                  setState(() {
                    _setDefault();
                  });
                },
                child: Text("NEW GAME")
            ),
        ],
      ),
    );
  }

  _buildInputPanel(){
    return Card(
      elevation: 6,

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                enabled: _end ? false : true,
                controller: _controller,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),

                cursorColor: Colors.blue,
                textAlign: TextAlign.center,

                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  isDense: true,

                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue.withOpacity(0.5),
                    ),
                  ),

                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),

                  hintText: _end ? "Please start a new game" : "Enter the number",
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 15,
                  ),
                ),
              ),
            ),

            TextButton(
              onPressed: _end ? null : (){
                setState(() {
                  _guessNum = _controller.text;

                  if(_guessNum != "") {
                    int? guess = int.tryParse(_guessNum);
                    if (guess != null) {
                      _feedback = _guessGame.play(guess);
                      if(_feedback.toString().contains("CORRECT!"))
                        _end = true;

                      _played = true;
                    }
                  }
                  else
                    _noEnterDialog();

                  if(_end)
                    _completeDialog(_guessGame.answer, _guessGame.totalGuess, _guessGame.guess);

                  _controller.clear();
                });
              },
              child: Text("GUESS"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GUESS THE NUMBER"),),

      body: Container(
        color: Colors.yellow.shade100,

        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildHeader(),

                if(_played)
                  _buildFeedback()
                else
                  _buildMainContent(),

                _buildInputPanel(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
