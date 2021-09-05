import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CountingGame extends StatefulWidget {
  const CountingGame({Key? key}) : super(key: key);

  @override
  _CountingGameState createState() => _CountingGameState();
}

class _CountingGameState extends State<CountingGame> {
  int blankStars = 20;
  int opaqueStars = 0;
  bool teamRed = true;
  bool teamBlue = false;
  int score = 0;
  bool end = false;
  bool redWins = false;

  _printStars(){
    return Column(
      children: [
        for(int i=0; i<opaqueStars; i++)
          Icon(
            Icons.star,
            color: Colors.purple,
          ),

        for(int i=0; i<blankStars; i++)
          Icon(
            Icons.star_border,
            color: Colors.purple,
          ),
      ],
    );
  }

  _setScore(int i){
    if(score+i < 20) {
      score += i;
      opaqueStars += i;
      blankStars -= i;
      teamRed = !teamRed;
      teamBlue = !teamBlue;
      redWins = !redWins;
    }
    else
      end = true;
  }

  _play1(){
    setState(() {
      _setScore(1);
    });
  }

  _play2(){
    setState(() {
      _setScore(2);
    });
  }

  _play3(){
    setState(() {
      _setScore(3);
    });
  }

  _setDefault(){
    setState(() {
      blankStars = 20;
      opaqueStars = 0;
      teamRed = true;
      teamBlue = false;
      score = 0;
      end = false;
      redWins = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.fill,
          ),
        ),

        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: ElevatedButton(
                          onPressed: end ? null : (teamRed ? _play3 : null),
                          child: Text("3", style: TextStyle(fontSize: 30),),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: end ? null : (teamRed ? _play2 : null),
                          child: Text("2", style: TextStyle(fontSize: 30),),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: end ? null : (teamRed ? _play1 : null),
                          child: Text("1", style: TextStyle(fontSize: 30),),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              if (end) Center(
                  child: Column(
                    children: [
                      redWins ? (Text("RED", style: TextStyle(fontSize: 80, color: Colors.red),))
                              : (Text("BLUE", style: TextStyle(fontSize: 80, color: Colors.blue),)),
                      Text("Wins!\n", style: TextStyle(fontSize: 60)),

                      OutlinedButton(
                          onPressed: _setDefault,
                          child: Text("NEW GAME", style: TextStyle(fontSize: 30, color: Colors.deepOrange),),
                      ),
                    ],
                  ),
                ) else Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      _printStars(),
                      Expanded(
                        child: Column(
                          children: [
                            Icon(
                              Icons.keyboard_arrow_up,
                              color: teamRed ? Colors.black : Colors.black.withOpacity(0.1),
                              size: 60,
                            ),

                            Center(child: Text("$score", style: TextStyle(fontSize: 100))),

                            Icon(
                              Icons.keyboard_arrow_down,
                              color: teamBlue ? Colors.black : Colors.black.withOpacity(0.1),
                              size: 60,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: ElevatedButton(
                          onPressed: end ? null : (teamBlue ? _play1 : null),
                          child: Text("1", style: TextStyle(fontSize: 30),),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: end ? null : (teamBlue ? _play2 : null),
                          child: Text("2", style: TextStyle(fontSize: 30),),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: end ? null : (teamBlue ? _play3 : null),
                          child: Text("3", style: TextStyle(fontSize: 30),),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
