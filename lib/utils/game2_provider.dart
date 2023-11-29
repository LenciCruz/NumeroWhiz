import 'dart:math';


class NumberdleGame {

  //setting the game variables
  int rowId = 0;
  int letterId = 0;
  static String game_message = "";
  static String game_guess = "";
  static bool gameOver = false;
  //setting the game row
  static List<Letter> numberdleRow = List.generate(
    4,
        (index) => Letter("", 0),
  );

  //Setting the gameBoard
  List<List<Letter>> numberdleBoard = List.generate(
      5,
          (index) => List.generate(
        4,
            (index) => Letter("", 0),
      ));

  //Setting the Game Functon
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
}

class Letter {
  String? letter;
  int code = 0;

  Letter(this.letter, this.code);
}
