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
    NumberdleGame.initGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 25),
          onPressed: () {
            Navigator.pop(context);
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
            Text('MEDIUM', // Add your top text here
                style: GoogleFonts.archivoBlack(
                    fontSize: 15,
                    color: Color(0xFFA5D7E8),
                    letterSpacing: 10.0)),
            Text(
              'Numberdle', // Add your top text here
              style: GoogleFonts.lilitaOne(
                fontSize: 45,
                color: Color(0xFFD9D9D9),
              ),
            ),
            Text('NumeroWhiz', // Add your top text here
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
