import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Midterm extends StatefulWidget {
  const Midterm({Key? key}) : super(key: key);

  @override
  _MidtermState createState() => _MidtermState();
}

class _MidtermState extends State<Midterm> {
  int redScore = 0;
  int blueScore = 0;
  int round = 0;
  bool redWinsRound = false;
  bool blueWinsRound = false;
  bool end = false;
  var showRound = [];

  printRound(){
    return showRound.add(Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text("ROUND $round", style: TextStyle(color: Colors.grey)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(redWinsRound ? "10" : "9", style: TextStyle(fontSize: 30)),
              Text(blueWinsRound ? "10" : "9", style: TextStyle(fontSize: 30)),
            ],
          ),
          Divider(thickness: 2),
        ],
      ),
    )
    );
  }

  printTotal(){
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text("TOTAL", style: TextStyle(color: Colors.grey)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("$redScore", style: TextStyle(fontSize: 30)),
              Text("$blueScore", style: TextStyle(fontSize: 30)),
            ],
          ),
          Divider(thickness: 2),
        ],
      ),
    );
  }

  setScoreRed(){
    setState(() {
      if(round < 3) {
        redScore += 10;
        blueScore += 9;
        redWinsRound = true;
        blueWinsRound = false;
        round++;
        printRound();
      }
      if(round == 3)
        end = true;
    });
  }

  setScoreBlue(){
    setState(() {
      if(round < 3) {
        redScore += 9;
        blueScore += 10;
        redWinsRound = false;
        blueWinsRound = true;
        round++;
        printRound();
      }
      if(round == 3)
        end = true;
    });
  }

  setDefault(){
    setState(() {
      redScore = 0;
      blueScore = 0;
      round = 0;
      redWinsRound = false;
      blueWinsRound = false;
      end = false;
      showRound = [];
    });
  }

  redWins(){
    if(redScore > blueScore)
      return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OLYMPIC BOXING SCORING"),
        backgroundColor: Colors.red,
      ),

      //Olympic Logo---------------------------------------------------------
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage("assets/images/logo.png"),
              width: 100,
              height: 100,
            ),
          ),

          //Black bar---------------------------------------------------------
          Container(
            child: Center(
              child: Text(
                "Women's Light (57-60kg) Semi-final",
                style: TextStyle(color: Colors.white),
              ),
            ),
            height: 20,
            color: Colors.black,
          ),

          //Name Board---------------------------------------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Color(0xFFA00000),
                    size: 70,
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: Image(
                              image: AssetImage("assets/images/flag_ireland.png",),
                              width: 35,
                              height: 35,
                            ),
                          ),
                          Text("IRELAND", style: TextStyle(fontSize: 20),),
                        ],
                      ),

                      Text("HARRINGTON Kellie Anne", style: TextStyle(fontSize: 16),),
                    ],
                  ),
                ],
              ),

              end ? (redWins() ? Icon(
                Icons.check,
                color: Colors.green,
                size: 70,
              ) : SizedBox.shrink()): SizedBox.shrink(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Color(0xFF0000A0),
                    size: 70,
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: Image(
                              image: AssetImage("assets/images/flag_thailand.png",),
                              width: 35,
                              height: 35,
                            ),
                          ),
                          Text("THAILAND", style: TextStyle(fontSize: 20),),
                        ],
                      ),

                      Text("SEESONDEE Sudaporn", style: TextStyle(fontSize: 16),),
                    ],
                  ),
                ],
              ),

              end ? (!redWins() ? Icon(
                Icons.check,
                color: Colors.green,
                size: 70,
              ) : SizedBox.shrink()): SizedBox.shrink(),
            ],
          ),

          //Red-Blue bar---------------------------------------------------------
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 5,
                  color: Color(0xFFA00000),
                ),
              ),
              Expanded(
                child: Container(
                  height: 5,
                  color: Color(0xFF0000A0),
                ),
              ),
            ],
          ),

          //Round---------------------------------------------------------
          for(var item in showRound)
            item,
          end? printTotal() : SizedBox.shrink(),

          //Button---------------------------------------------------------
          end ? Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: setDefault,
                      child: Icon(Icons.clear),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ) :Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: setScoreRed,
                      child: Icon(Icons.person),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFA00000),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: setScoreBlue,
                      child: Icon(Icons.person),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF0000A0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}