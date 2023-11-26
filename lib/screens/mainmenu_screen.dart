import 'package:flutter/material.dart';
import 'how_to_play.dart';
import 'game2_screen.dart';
import 'game3_screen.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/mainmenu',
      routes: {
        '/mainmenu': (context) => MainMenuPage(),
        '/instructions': (context) => howToPlay(),
      //  '/game1': (context) => ,
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
      appBar: AppBar(
        title: const Text('Main Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'This is the main menu',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),

            OutlinedButton(
              onPressed: () {
                // Navigate to game 1
                Navigator.pushNamed(context, '/game1');
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.green, width: 2.0), // Change the color and thickness of the border
                backgroundColor: Colors.transparent, // Set a transparent background
              ),
              child: const Text('Game 1'),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                // Navigate to game 2
                Navigator.pushNamed(context, '/game2');
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.yellow, width: 2.0), // Change the color and thickness of the border
                backgroundColor: Colors.transparent, // Set a transparent background
              ),
              child: const Text('Game 2'),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                // Navigate to game 3
                Navigator.pushNamed(context, '/game3');
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.red, width: 2.0), // Change the color and thickness of the border
                backgroundColor: Colors.transparent, // Set a transparent background
              ),
              child: const Text('Game 3'),
            ),
            const SizedBox(height: 20),

            OutlinedButton(
              onPressed: () {
                // Navigate to how to play page
                Navigator.pushNamed(context, '/instructions');
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.grey, width: 2.0), // Change the color and thickness of the border
                backgroundColor: Colors.transparent, // Set a transparent background
              ),
              child: const Text('How to Play'),
            ),
          ],
        ),
      ),
    );
  }
}