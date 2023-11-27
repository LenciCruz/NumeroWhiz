import 'package:flutter/material.dart';
import '../utils/game3_provider.dart';
import '../widgets/game3_keyboard.dart';
import 'mainmenu_screen.dart';

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
      backgroundColor: const Color(0xFF212121),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0), // Adjust the left padding for the back button
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white, size: 32),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainMenuPage()));
                  },
                ),
              ),
              const SizedBox(width: 85.0), // Adjust the width based on your needs
              const Text(
                "Game 3",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // If you want to add another button or any other widget on the right side, you can do so here
              // Example:
              // SizedBox(width: 8.0), // Adjust the width based on your needs
              // IconButton(
              //   icon: const Icon(Icons.settings, color: Colors.white, size: 32),
              //   onPressed: () {
              //     // Handle settings button press
              //   },
              // ),
            ],
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
