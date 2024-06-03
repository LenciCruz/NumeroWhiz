import 'dart:math';

class Game {
  int rowId = 0;
  int letterId = 0;
  String game_message = "";
  String game_guess = "";
  bool gameOver = false;

  List<List<Letter>> gameBoard = [];

  Game(int rows, int columns) {
    gameBoard = List.generate(
      rows,
          (index) => List.generate(
        columns,
            (index) => Letter("", 0),
      ),
    );
  }

  void passTry() {
    rowId++;
    letterId = 0;
  }

   void initGame(List<int> digits) {
    digits.shuffle();
    game_guess = "";
  }

  void insertWord(index, word) {
    gameBoard[rowId][index] = word;
  }
}

class Letter {
  String? letter;
  int code = 0;

  Letter(this.letter, this.code);
}