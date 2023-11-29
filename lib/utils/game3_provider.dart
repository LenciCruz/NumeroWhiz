import 'dart:math';

class PaDGame {

  //setting the game variables
  int rowId = 0;
  int letterId = 0;
  String correctPos = "";
  String correctNums = "";
  static String game_message = "";
  static String game_guess = "";
  static bool gameOver = false;
  //setting the game row
  static List<Letter> numberdleRow = List.generate(
    10,
        (index) => Letter("", 0),
  );

  //Setting the gameBoard
  List<List<Letter>> numberdleBoard = List.generate(
      10,
          (index) => List.generate(
        4,
            (index) => Letter("", 0),
      ));
  //Setting the Game Function
  void passTry() {
    rowId++;
    letterId = 0;
  }

  static void initGame() {
    List<int> digits = List.generate(10, (index) => index)..shuffle();
    game_guess = "${digits[0]}${digits[1]}${digits[2]}${digits[3]}";
  }

  //Setting the game insertion
  void insertWord(index, word) {
    numberdleBoard[rowId][index] = word;
  }

  //checking world
  bool noRepeating(String input) {
    for (int i = 0; i < input.length - 1; i++) {
      for (int j = i + 1; j < input.length; j++) {
        if (input[i] == input[j]) {
          return false;
        }
      }
    }
    return true;
  }
  int getCurrentRowId() {
    return rowId;
  }


  String getCorrectPos() {
    return correctPos;
  }
  String getCorrectNums() {
    return correctNums;
  }
  void setCorrectPos(String value) {
    correctPos = value;
  }

  void setCorrectNums(String value) {
    correctNums = value;
  }
}

class Letter {
  String? letter;
  int code = 0;

  Letter(this.letter, this.code);
}


