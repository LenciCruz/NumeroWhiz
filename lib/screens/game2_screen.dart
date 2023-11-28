import 'package:flutter/material.dart';
import '../utils/game2_provider.dart';
import '../widgets/game2_keyboard.dart';
import 'mainmenu_screen.dart';

class Game2Screen extends StatefulWidget {
  const Game2Screen({Key? key}) : super(key: key);

  @override
  State<Game2Screen> createState() => _Game2ScreenState();
}

class _Game2ScreenState extends State<Game2Screen> {
  final NumberdleGame _game = NumberdleGame();
  late String word;

  @override
  void initState() {
    super.initState();
    NumberdleGame.initGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white, size: 32),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainMenuPage()));
                  },
                ),
              ),
              const SizedBox(width: 60.0),
              const Text(
                "Numberdle",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 2.0),
          Game2Keyboard(_game),
        ],
      ),
    );
  }
}
