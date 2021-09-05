import 'package:flutter/material.dart';
import "dart:math";

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GUESS THE NUMBER")),
      body: Container(
        color: Colors.greenAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  color: Colors.pink,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    width: 20,
                    height: 20,
                    color: Colors.yellow,
                  ),
                ),
                Container(
                  width: 20,
                  height: 20,
                  color: Colors.green,
                ),
              ],
            ),
            Text(
              "Hello",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 100),
            ),
            Text(
              "Flutter",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 77),
            ),
            Text(
              "123",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 130),
            )
          ],
        ),
      ),
    );
  }
}
