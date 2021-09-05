import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GamePage2 extends StatefulWidget {
  const GamePage2({Key? key}) : super(key: key);

  _GamePage2State createState() => _GamePage2State();
}

class _GamePage2State extends State<GamePage2> {
  var i = 0;
  int a = 1;
  List<int> list = [1, 2, 3];
  bool showNum = true;

  _handleClickButton() {
    setState(() {
      list.add(list.length + 1);
    });
  }

  _handleClickButton2() {
    setState(() {
      showNum = !showNum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: list
                          .map((e) => Text(
                                e.toString(),
                                style: TextStyle(fontSize: 30),
                              ))
                          .toList(),
                    ),
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: _handleClickButton, child: Text("TEST")),
                SizedBox(width: 20),
                TextButton(
                    onPressed: _handleClickButton2, child: Text("TEST2")),
              ],
            ),
            Image(
              image: AssetImage(showNum ? "assets/images/p.png" : "assets/images/op.png"),
              width: 100,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
