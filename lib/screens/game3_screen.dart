import 'package:flutter/material.dart';
import '../utils/game3_provider.dart';
import '../widgets/game3_keyboard.dart';

class Game3Screen extends StatefulWidget {
  const Game3Screen({Key? key}) : super(key: key);

  @override
  State<Game3Screen> createState() => _GameScreenState();
}

class _GameScreenState extends State<Game3Screen> {
  final PaDGame _game = PaDGame();
  late String word;
  @override
  void initState() {
    super.initState();
    PaDGame.initGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF212121),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Game 3",
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Game3Keyboard(_game),
        ],
      ),
    );
  }
}
