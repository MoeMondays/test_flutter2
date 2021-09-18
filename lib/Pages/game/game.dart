import 'dart:math';

class Game{
  final int _answer;
  int _totalGuess;

  Game() :
        _answer = Random().nextInt(100)+1,
        _totalGuess = 0 {
    print(_answer);
  }


  get totalGuess{
    return _totalGuess;
  }

  doGuess(int num){
    _totalGuess++;

    if(num < _answer){
      return 1;
    }
    else if(num == _answer){
      return 0;
    }
    else{
      return -1;
    }
  }
}