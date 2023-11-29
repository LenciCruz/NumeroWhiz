import 'dart:math';

class PaDGame {
  //setting the game variables
  int rowId = 0;
  int letterId = 0;
  int resultNumsId = 0;
  int resultsPosId = 0;
  String _correctPos = "";
  String _correctNums = "";
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

  static List<Letter> resultsRowPos = List.generate(
    10,
    (index) => Letter("", 0),
  );

  //Setting the gameBoard
  List<List<Results>> resultsBoardPos = List.generate(
      10,
      (index) => List.generate(
            1,
            (index) => Results(""),
          ));

  static List<Letter> resultsRowNums = List.generate(
    10,
    (index) => Letter("", 0),
  );

  //Setting the gameBoard
  List<List<ResultsNums>> resultsBoardNums = List.generate(
      10,
      (index) => List.generate(
            1,
            (index) => ResultsNums(""),
          ));

  //Setting the game insertion
  void insertWord(index, word) {
    numberdleBoard[rowId][index] = word;
  }

  void insertPosResults(index, word) {
    resultsBoardPos[rowId][index] = word;
  }

  void insertNumsResults(index, word) {
    resultsBoardNums[rowId][index] = word;
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
    return _correctPos;
  }

  String getCorrectNums() {
    return _correctNums;
  }

  void setCorrectPos(String value) {
    _correctPos = value;
  }

  void setCorrectNums(String value) {
    _correctNums = value;
  }
}

class Letter {
  String? letter;
  int code = 0;

  Letter(this.letter, this.code);
}

class Results {
  String? results;

  Results(this.results);
}

class ResultsNums {
  String? resultsNums;

  ResultsNums(this.resultsNums);
}
