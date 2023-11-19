import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/game2_provider.dart';

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
      children: widget.game.numberdleBoard
          .map((e) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: e
            .map((e) => Container(
          padding: const EdgeInsets.all(16.0),
          width: 64.0,
          height: 64.0,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: e.code == 0
                ? Colors.grey.shade800
                : e.code == 1
                ? Colors.green.shade400
                : e.code == 2
                ? Colors.amber.shade400
                : Colors.red
            ,
          ),
          child: Center(
              child: Text(
                e.letter!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
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
