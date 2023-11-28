
import 'package:NumeroWhiz/utils/game1_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/game1_keyboard.dart';
import 'mainmenu_screen.dart';

class Game1Screen extends StatefulWidget {
  const Game1Screen({Key? key}) : super(key: key);

  @override
  State<Game1Screen> createState() => _Game1ScreenState();
}

class _Game1ScreenState extends State<Game1Screen> {
  final HigherLowerGame _game = HigherLowerGame();
  late String word;

  @override
  void initState() {
    super.initState();
    HigherLowerGame.initGame();
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
                padding: EdgeInsets.only(left: 10.0),
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white, size: 32),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainMenuPage()));
                  },
                ),
              ),
              SizedBox(width: 60.0),
              Text(
                "Higher Lower",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 2.0),
          Game1Keyboard(_game),
        ],
      ),
    );
  }
}
