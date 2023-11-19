import 'package:flutter/material.dart';
import 'game2_screen.dart';
import 'game3_screen.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/mainmenu',
      routes: {
        '/mainmenu': (context) => MainMenuPage(),
      // for how to play:  '/instructions': (context) => const
      //  '/game1': (context) => const Game1Screen(),
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
        title: Text('Main Menu'),
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
            ElevatedButton(
              onPressed: () {
                // Navigate to how to play page
                //  Navigator.pushNamed(context, '/screen1');
              },
              child: const Text('How to Play'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to game 1
              //  Navigator.pushNamed(context, '/screen1');
              },
              child: const Text('Game 1'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to game 2
                Navigator.pushNamed(context, '/game2');
              },
              child: const Text('Game 2'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to game 2
                Navigator.pushNamed(context, '/game3');
              },
              child: const Text('Game 3'),
            ),
          ],
        ),
      ),
    );
  }
}
