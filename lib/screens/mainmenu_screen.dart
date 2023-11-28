import 'package:flutter/material.dart';
import 'how_to_play.dart';
import 'game2_screen.dart';
import 'game3_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/mainmenu',
      routes: {
        '/mainmenu': (context) => MainMenuPage(),
        '/howToPlay': (context) => howToPlay(),
        // game 1
        '/game2': (context) => const Game2Screen(),
        '/game3': (context) => const Game3Screen(),
      },
    );
  }
}

class MainMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                width: 115,
                height: 115,
              ),
              const SizedBox(height: 15),
              Text(
                'Main Menu',
                style: GoogleFonts.lilitaOne(
                  fontSize: 45,
                  color: Color(0xFFD9D9D9),
                ),
              ),
              Text(
                'NumeroWhiz',
                style: GoogleFonts.archivoBlack(
                  fontSize: 20,
                  color: Color(0xFFA5D7E8),
                  letterSpacing: 5,
                ),
              ),
              const SizedBox(height: 50),
              Container(
                width: 250,
                height: 80,
                child: OutlinedButton(
                  onPressed: () {
                    // Navigate to game 1
                    Navigator.pushNamed(context, '/game1');
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF689F38), width: 2.9),
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HIGHER LOWER',
                        style: GoogleFonts.archivoNarrow(
                          fontSize: 28,
                          color: Color(0xFF689F38),
                          letterSpacing: 2,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'EASY',
                        style: GoogleFonts.archivoNarrow(
                          fontSize: 18,
                          color: Color(0xFFD9D9D9),
                        ),
                      ),
                    ],
                  ),
                ),
              ),


              const SizedBox(height: 20),
              Container(
                width: 250,
                height: 80,
                child: OutlinedButton(
                  onPressed: () {
                    // Navigate to game 2
                    Navigator.pushNamed(context, '/game2');
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFFFC107), width: 2.9),
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'NUMBERDLE',
                        style: GoogleFonts.archivoNarrow(
                          fontSize: 28,
                          color: Color(0xFFFFC107),
                          letterSpacing: 2,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'MEDIUM',
                        style: GoogleFonts.archivoNarrow(
                          fontSize: 18,
                          color: Color(0xFFD9D9D9),
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Container(
                width: 250,
                height: 80,
                child: OutlinedButton(
                  onPressed: () {
                    // Navigate to game 3
                    Navigator.pushNamed(context, '/game3');
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFFF3D00), width: 2.9),
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'PEEK-A-DIGIT',
                        style: GoogleFonts.archivoNarrow(
                          fontSize: 28,
                          color: Color(0xFFFF3D00),
                          letterSpacing: 2,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'DIFFICULT',
                        style: GoogleFonts.archivoNarrow(
                          fontSize: 18,
                          color: Color(0xFFD9D9D9),
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),


              const SizedBox(height: 70),
              Container(
                width: 200,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    // Navigate to how to play page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => howToPlay()),
                    );                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey, width: 2.9),
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HOW TO PLAY',
                        style: GoogleFonts.archivoNarrow(
                          fontSize: 20,
                          color: Color(0xFFD9D9D9),
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
