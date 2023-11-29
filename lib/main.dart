import 'package:NumeroWhiz/screens/mainmenu_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Remove the AppBar
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
                width: 250,
                height: 250,
              ),
              const SizedBox(height: 20),
              Text(
                'NumeroWhiz',
                style: GoogleFonts.lilitaOne(
                  fontSize: 60,
                  color: Color(0xFFA5D7E8),
                ),
              ),
              Text(
                'NUMBERS GAME',
                style: GoogleFonts.archivoBlack(
                  fontSize: 20,
                  color: Color(0xFFD9D9D9),
                  letterSpacing: 8,
                ),
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainMenu()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD9D9D9),
                  fixedSize: const Size(190, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'PLAY',
                  style: GoogleFonts.archivoNarrow(
                    fontSize: 20,
                    color: Colors.black,
                    letterSpacing: 3,
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
