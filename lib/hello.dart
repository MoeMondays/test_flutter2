import 'dart:io';
import 'dart:math';

class Game{
  late int ans;
  static const List feedback = [
    {
      'text':'Too high',
      'isCorrect':false,
    },
    {
      'text':'Too low',
      'isCorrect':false,
    },
    {
      'text':'correct',
      'isCorrect':true,
    }
  ];

  Game(){
    ans = Random().nextInt(100)+1;
  }

  Map doGuess(int num){
    if(num>ans) {
      return feedback[0];
    }
    else if(num<ans){
      return feedback[1];
    }
    else {
      return feedback[2];
    }
  }
}

void main(){
  Game game = new Game();

  bool end = false;
  while(!end){
    String? input = stdin.readLineSync();
    int? guess = int.tryParse(input!);

    if(guess != null){
      Map resultMap = game.doGuess(guess);
      print(resultMap['text']);
      end = resultMap['isCorrect'];
    }
  }
}

void _main(){
  const max = 100;
  Random rand = new Random();
  int i = rand.nextInt(max)+1;

  bool end = false;
  int round = 1;
  while(!end) {
    stdout.write('Guess the number (1-$max): ');
    String? input = stdin.readLineSync();
    int? guess = int.tryParse(input!);

    if(guess != null){
      if(guess == i){
        print('$guess is correct, total guess is $round');
        end = true;
      }
      else{
        round++;
        if(guess > i)
          print('$guess is too HIGH!');
        else
          print('$guess is too LOW!');
      }
    }
  }
}