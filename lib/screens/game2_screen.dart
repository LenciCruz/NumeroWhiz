import 'package:flutter/material.dart';
import '../utils/game2_provider.dart';
import '../widgets/game2_keyboard.dart';

class Game2Screen extends StatefulWidget {
  const Game2Screen({Key? key}) : super(key: key);

  @override
  State<Game2Screen> createState() => _Game2ScreenState();
}

class _Game2ScreenState extends State<Game2Screen> {
  NumberdleGame _game = NumberdleGame();
  late String word;
  @override
  void initState() {
    super.initState();
    NumberdleGame.initGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF212121),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Numberdle",
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Game2Keyboard(_game),
        ],
      ),
    );
  }
}
