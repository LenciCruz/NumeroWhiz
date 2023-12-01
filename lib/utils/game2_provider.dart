import 'game1_provider.dart';

class NumberdleGame extends HigherLowerGame {
  NumberdleGame() : super(5, 4);

  @override
  void initGame() {
    List<int> digits = List.generate(10, (index) => index)..shuffle();
    HigherLowerGame.game_guess = "${digits[0]}${digits[1]}${digits[2]}${digits[3]}";
  }

  //checking word
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