/*
1กค-5533-57
2กค-6087-61
3กค-6230-41
4กค-5916-44
5กค-6166-50
*/

void main() {
  List list = [1,2,3,4,5];
  List list2 = list.map((i){
    return {
      "data": i
    };
  }).toList();

  list2.forEach((element) {print(element);});

  return;










  // List dateList = ['1กค', '2กค', '3กค', '4กค', '5กค'];
  // List caseList = [5533, 6087, 6230, 5916, 6166];
  // List deathList = [57, 61, 41, 44, 50];
  //
  // List reportList = [
  //   {"date": "1กค", "case": 5533, "death": 57},
  //   {"date": "2กค", "case": 6087, "death": 61},
  //   {"date": "3กค", "case": 6230, "death": 41},
  //   {"date": "4กค", "case": 5916, "death": 44},
  //   {"date": "5กค", "case": 6166, "death": 50},
  // ];
  //
  // for (int i = 0; i < dateList.length; i++)
  //   print("วันที่ ${dateList[i]}, ติดเชื้อ ${caseList[i]}, เสียชีวิต ${deathList[i]}");
  // print("");
  //
  // for(int i = 0; i < dateList.length; i++)
  //   print("วันที่ ${reportList[i]["date"]}, ติดเชื้อ ${reportList[i]["case"]}, เสียชีวิต ${reportList[i]["death"]}");
  // print("");
  //
  // var f = (dynamic i) {
  //   print(i);
  // };
  //
  // reportList.forEach((dynamic item){
  //   print("วันที่ ${item["date"]}, ติดเชื้อ ${item["case"]}, เสียชีวิต ${item["death"]}");
  // });
}
