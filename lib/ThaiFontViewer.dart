import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ThaiFontViewer extends StatefulWidget {
  const ThaiFontViewer({Key? key}) : super(key: key);

  @override
  _ThaiFontViewerState createState() => _ThaiFontViewerState();
}

class _ThaiFontViewerState extends State<ThaiFontViewer> {
  var font = GoogleFonts.sarabun(fontSize: 50);
  String fontName = "Sarabun";

  changFont(int i){
    switch(i){
      case 1:
        font = GoogleFonts.sarabun(fontSize: 50);
        fontName = "Sarabun";
        break;
      case 2:
        font = GoogleFonts.kanit(fontSize: 50);
        fontName = "Kanit";
        break;
      case 3:
        font = GoogleFonts.prompt(fontSize: 50);
        fontName = "Prompt";
        break;
      case 4:
        font = GoogleFonts.chakraPetch(fontSize: 50);
        fontName = "Chakra Petch";
        break;
      case 5:
        font = GoogleFonts.mitr(fontSize: 50);
        fontName = "Mitr";
        break;
      case 6:
        font = GoogleFonts.baiJamjuree(fontSize: 50);
        fontName = "Bai Jam juree";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("THAI FONT VIEWER"),),

      body: Container(
        decoration: BoxDecoration(
          color: Colors.teal.shade50,
        ),

        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "การเดินทางขากลับคงจะเหงาน่าดู",
                    style: font,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),

            Center(
              child: Text("Font: "+fontName, style: TextStyle(fontSize: 15),),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 8, bottom: 8, left: 8),
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: ElevatedButton(
                          onPressed: (){
                            setState(() {
                              changFont(1);
                            });
                          },
                          child: Text("Sarabun"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: ElevatedButton(
                          onPressed: (){
                            setState(() {
                              changFont(2);
                            });
                          },
                          child: Text("Kanit"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: ElevatedButton(
                          onPressed: (){
                            setState(() {
                              changFont(3);
                            });
                          },
                          child: Text("Prompt"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: ElevatedButton(
                          onPressed: (){
                            setState(() {
                              changFont(4);
                            });
                          },
                          child: Text("Chakra Petch"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: ElevatedButton(
                          onPressed: (){
                            setState(() {
                              changFont(5);
                            });
                          },
                          child: Text("Mitr"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: ElevatedButton(
                          onPressed: (){
                            setState(() {
                              changFont(6);
                            });
                          },
                          child: Text("Bai Jam juree"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
