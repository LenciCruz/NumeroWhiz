import 'package:NumeroWhiz/screens/mainmenu_screen.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: Color(0xFFF1F6F9),
      appBar: AppBar(
        title: Text('My Homepage'),
        backgroundColor: Color(0xFF212121),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'This is the welcome page',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MainMenu()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF394867),
              ),
              child: Text('Play'),
            ),
          ],
        ),
      ),
    );
  }
}
