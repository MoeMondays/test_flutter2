import 'package:flutter/material.dart';

class LockScreen extends StatelessWidget {
  const LockScreen({Key? key}) : super(key: key);

  Widget _buildButton4(int i) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 65.0,
        height: 65.0,
        child: Center(child: Text("$i", style: TextStyle(fontSize: 30, color: Colors.blue))),
        //color: Colors.white, // ห้ามกำหนด color ตรงนี้ ถ้าหากกำหนดใน BoxDecoration แล้ว
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.blue, width: 4.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // สีเงา
                offset: Offset(2, 4), // ทิศทางของเงาในแนวนอนและแนวตั้ง ตามลำดับ
                blurRadius: 4.0,
                spreadRadius: 2.0,
              )
            ]
        ),
      ),
    );
  }

  Widget blankButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 65.0,
        height: 65.0,
        decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.transparent, width: 4.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Icon(Icons.lock, size: 70, color: Colors.blue),
                Text("Enter PIN",style: TextStyle(fontSize: 20, color: Colors.blue)),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for(int i=1; i<4; i++)
                      _buildButton4(i)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for(int i=4; i<7; i++)
                      _buildButton4(i)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for(int i=7; i<10; i++)
                      _buildButton4(i)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    blankButton(),
                    _buildButton4(0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 65.0,
                        height: 65.0,
                        child: Icon(Icons.backspace, size: 35, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30, left: 130, right: 130),
                  child: TextButton(onPressed: () {}, child: Text("Forget PIN"))
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
