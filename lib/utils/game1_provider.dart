import 'game.dart';

class HigherLowerGame extends Game {
  HigherLowerGame() : super(1, 2);

  @override
  void initGame(List<int> digits) {
    digits.shuffle();
    game_guess = "${digits[0]}${digits[1]}";
  }
}
