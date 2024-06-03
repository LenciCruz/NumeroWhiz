import 'game.dart';

<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 923f8886523f15f33a5984d512e6297e670c436f
class HigherLowerGame extends Game {
  HigherLowerGame() : super(1, 2);

  @override
  void initGame(List<int> digits) {
    digits.shuffle();
<<<<<<< HEAD
    game_guess = "${digits[0]}${digits[1]}";
  }
=======
    game_guess = "${digits[0]}${digits[1]}";
  }
=======
class HigherLowerGame {
  //setting the game variables
  int rowId = 0;
  int letterId = 0;
  static String game_message = "";
  static String game_guess = "";
  static bool gameOver = false;

  List<List<Letter>> hlBoard = [];

  HigherLowerGame(int rows, int columns) {
    hlBoard = List.generate(
      rows,
      (index) => List.generate(
        columns,
        (index) => Letter("", 0),
      ),
    );
  }

  //Setting the Game Function
  void passTry() {
    rowId++;
    letterId = 0;
  }

  void initGame() {
    List<int> digits = List.generate(10, (index) => index)..shuffle();
    game_guess = "${digits[0]}${digits[1]}";
  }

  //Setting the game insertion
  void insertWord(index, word) {
    hlBoard[rowId][index] = word;
  }
}

class Letter {
  String? letter;
  int code = 0;

  Letter(this.letter, this.code);
>>>>>>> 73cd7b95e9adccebfbe6b411b892e55b21df0ff0
>>>>>>> 923f8886523f15f33a5984d512e6297e670c436f
}
