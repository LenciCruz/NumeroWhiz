<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 923f8886523f15f33a5984d512e6297e670c436f
import 'game.dart';

class NumberdleGame extends Game {
  NumberdleGame() : super(5, 4);

  @override
  void initGame(List<int> digits) {
    digits.shuffle();
    game_guess = "${digits[0]}${digits[1]}${digits[2]}${digits[3]}";
  }

  //checking world
=======
import 'game1_provider.dart';

class NumberdleGame extends HigherLowerGame {
  NumberdleGame() : super(5, 4);

  @override
  void initGame() {
    List<int> digits = List.generate(10, (index) => index)..shuffle();
    HigherLowerGame.game_guess = "${digits[0]}${digits[1]}${digits[2]}${digits[3]}";
  }

  //checking word
>>>>>>> 73cd7b95e9adccebfbe6b411b892e55b21df0ff0
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
<<<<<<< HEAD
}
<<<<<<< HEAD
=======
=======
}
>>>>>>> 73cd7b95e9adccebfbe6b411b892e55b21df0ff0
>>>>>>> 923f8886523f15f33a5984d512e6297e670c436f
