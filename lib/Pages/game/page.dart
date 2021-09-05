import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "dart:math";

class RandomGame extends StatelessWidget {
  const RandomGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List iconList = [];

    for(int i=0; i<4; i++)
      iconList.add(Icon(Icons.star, size: 20, color: Colors.orange));
    iconList.add(Icon(Icons.star_border, size: 20, color: Colors.orange));



    return Scaffold(
      appBar: AppBar(title: Text("GUESS THE NUMBER")),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Icon(Icons.person, size: 80, color: Colors.blue),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ธนกร เหมศาสตร์", style: TextStyle(fontSize: 20)),
                    Row(
                      children: [
                        for(var item in iconList)
                          item,
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Center(
              child: Text(
                "${Random().nextInt(99) + 1}",
                style: TextStyle(fontSize: 200, color: Colors.orange),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: ElevatedButton(onPressed: () {}, child: Text("RANDOM")),
            ),
          ],
        ),
      ),
    );
  }
}
