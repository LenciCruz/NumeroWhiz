import 'package:NumeroWhiz/utils/game1_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    _game.initGame([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]);
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
            _game.game_message = "";
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
            Text('EASY',
                style: GoogleFonts.archivoBlack(
                    fontSize: 15,
                    color: Color(0xFFA5D7E8),
                    letterSpacing: 10.0)),
            Text(
              'Higher Lower',
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
            const SizedBox(height: 40.0),
            Game1Keyboard(_game),
          ],
        ),
      ),
    );
  }
}
