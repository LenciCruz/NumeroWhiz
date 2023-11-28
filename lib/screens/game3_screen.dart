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
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF212121),
              Color(0xFF43535E),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white, size: 32),
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainMenuPage()));
                    },
                  ),
                ),
                 SizedBox(width: 85.0),
                 Text(
                  "Game 3",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
             SizedBox(
              height: 10.0,
            ),
            Game3Keyboard(_game),
          ],
        ),
      ),
    );
  }
}
