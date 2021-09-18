import 'dart:math';

class GuessGame{
  final int _answer;
  int _totalGuess;
  List _guess;

  GuessGame():
        _answer = Random().nextInt(100),
        _totalGuess = 0,
        _guess = [] {
    print(_answer);
  }


  get answer{
    return _answer;
  }

  get totalGuess{
    return _totalGuess;
  }

  get guess{
    return _guess;
  }

  play(int num){
    _totalGuess++;
    _guess.add(num);

    if(num < _answer)
      return "TOO LOW!";
    else if(num == _answer)
      return "CORRECT!";
    else
      return "TOO HIGH!";
  }
}