import 'package:NumeroWhiz/utils/game1_provider.dart';
import 'package:flutter/material.dart';
import '../utils/game2_provider.dart';
import '../widgets/game2_keyboard.dart';
import 'mainmenu_screen.dart';
import 'package:google_fonts/google_fonts.dart';

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
<<<<<<< HEAD
    _game.initGame([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]);
=======
<<<<<<< HEAD
    _game.initGame([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]);
=======
<<<<<<< HEAD
    _game.initGame([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]);
=======
    _game.initGame();
>>>>>>> 73cd7b95e9adccebfbe6b411b892e55b21df0ff0
>>>>>>> 923f8886523f15f33a5984d512e6297e670c436f
>>>>>>> 5b00bb586ed34ce50494bfeb5345192dc50ec46e
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 35),
          onPressed: () {
<<<<<<< HEAD
            _game.game_message = "";
=======
<<<<<<< HEAD
            _game.game_message = "";
=======
<<<<<<< HEAD
            _game.game_message = "";
=======
            HigherLowerGame.game_message = "";
>>>>>>> 73cd7b95e9adccebfbe6b411b892e55b21df0ff0
>>>>>>> 923f8886523f15f33a5984d512e6297e670c436f
>>>>>>> 5b00bb586ed34ce50494bfeb5345192dc50ec46e
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainMenu()),
            );
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
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
            Text('MEDIUM',
                style: GoogleFonts.archivoBlack(
                    fontSize: 15,
                    color: Color(0xFFA5D7E8),
                    letterSpacing: 10.0)),
            Text(
              'Numberdle',
              style: GoogleFonts.lilitaOne(
                fontSize: 45,
                color: Color(0xFFD9D9D9),
              ),
            ),
            Text('NumeroWhiz',
                style: GoogleFonts.archivoBlack(
                    fontSize: 15,
                    color: Color(0xFFA5D7E8),
                    letterSpacing: 2.0)),
            const SizedBox(height: 2.0),
            Game2Keyboard(_game),
          ],
        ),
      ),
    );
  }
}