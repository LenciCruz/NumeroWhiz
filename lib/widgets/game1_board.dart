import 'package:NumeroWhiz/utils/game1_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Game1Board extends StatefulWidget {
  Game1Board(this.game, {Key? key}) : super(key: key);
  HigherLowerGame game;

  @override
  State<Game1Board> createState() => _GameBoardState();
}

class _GameBoardState extends State<Game1Board> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 100.0),
      child: Column(
        children: widget.game.gameBoard
            .map((e) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: e
                      .map((e) => Container(
                            padding: const EdgeInsets.all(16.0),
                            width: 160.0,
                            height: 160.0,
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: e.code == 0
                                  ? Color(0xFF212121)
                                  : e.code == 1
                                      ? Colors.black54
                                      : Color(0xFF212121),
                            ),
                            child: Center(
                              child: Text(
                                e.letter!,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lilitaOne(
                                  color: Colors.white,
                                  fontSize: 80,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ))
            .toList(),
      ),
    );
  }
}
