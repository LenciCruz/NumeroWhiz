import 'package:flutter/material.dart';
import '../utils/game3_provider.dart';
import '../widgets/game3_keyboard.dart';
import 'mainmenu_screen.dart';
import 'package:google_fonts/google_fonts.dart';

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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 25),
          onPressed: () {
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
            SizedBox(height: 25.0),
            Text('DIFFICULT', // Add your top text here
                style: GoogleFonts.archivoBlack(
                    fontSize: 15,
                    color: Color(0xFFA5D7E8),
                    letterSpacing: 10.0)),
            Text(
              'Peek-A-Digit', // Add your top text here
              style: GoogleFonts.lilitaOne(
                fontSize: 35,
                color: Color(0xFFD9D9D9),
              ),
            ),
            Text('NumeroWhiz', // Add your top text here
                style: GoogleFonts.archivoBlack(
                    fontSize: 15,
                    color: Color(0xFFA5D7E8),
                    letterSpacing: 2.0)),
            const SizedBox(height: 2.0),
            Game3Keyboard(_game),
          ],
        ),
      ),
    );
  }
}
