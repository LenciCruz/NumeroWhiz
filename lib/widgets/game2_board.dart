import 'package:flutter/material.dart';
import '../utils/game2_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class Game2Board extends StatefulWidget {
  Game2Board(this.game, {Key? key}) : super(key: key);
  NumberdleGame game;

  @override
  State<Game2Board> createState() => _GameBoardState();
}

class _GameBoardState extends State<Game2Board> {
  @override
  Widget build(BuildContext context) {
    return Column(
<<<<<<< HEAD
      children: widget.game.gameBoard
=======
<<<<<<< HEAD
      children: widget.game.gameBoard
=======
      children: widget.game.hlBoard
>>>>>>> 73cd7b95e9adccebfbe6b411b892e55b21df0ff0
>>>>>>> 923f8886523f15f33a5984d512e6297e670c436f
          .map((e) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: e
                    .map((e) => Container(
                          padding: const EdgeInsets.all(16.0),
                          width: 75.0,
                          height: 70.0,
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: e.code == 0
                                ? Color(0xFF212121)
                                : e.code == 1
                                    ? Colors.green.shade400
                                    : e.code == 2
                                        ? Colors.amber.shade400
                                        : Colors.red,
                          ),
                          child: Center(
                              child: Text(
                            e.letter!,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lilitaOne(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ))
                    .toList(),
              ))
          .toList(),
    );
  }
}
