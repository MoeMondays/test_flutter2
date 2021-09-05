import 'dart:io';
import 'dart:math';

class Game{
  late int maxRandom;
  late int ans;
  late int round;
  List feedback = [
    {
      'check':'TOO HIGH!',
      'isCorrect':false,
    },
    {
      'check':'TOO LOW!',
      'isCorrect':false,
    },
    {
      'check':'CORRECT',
      'isCorrect':true,
    },
  ];

  Game({int m:100}){
    maxRandom = m;
    ans = Random().nextInt(m!)+1;
    round = 1;
  }

  Map play(int guess){
    if(guess == ans)
      return feedback[2];
    else{
      round++;
      if(guess > ans)
        return feedback[0];
      else
        return feedback[1];
    }
  }

  int getTotalGuess(){
    return round;
  }
}

void main(){
  Game game;
  int? max;
  stdout.write("Enter max number you want to guess: ");
  max = int.tryParse(stdin.readLineSync()!);

  if(max != null)
    game = Game(m:max);
  else {
    print("INVALID INPUT!");
    print("Max number set to default (100)");
    game = Game();
  }

  bool end = false;
  while(!end) {
    stdout.write("Guess the number between 1 and ${game.maxRandom}: ");
    int? guess = int.tryParse(stdin.readLineSync()!);

    if(guess != null){
      Map result = game.play(guess);
      print("$guess : ${result['check']}");
      end = result['isCorrect'];
    }
  }

  print("Total guess: ${game.getTotalGuess()}");
}






















