import 'package:NumeroWhiz/utils/game1_provider.dart';
import 'package:flutter/material.dart';
import '../utils/game1_provider.dart';

class Game1Board extends StatefulWidget {
  Game1Board(this.game, {Key? key}) : super(key: key);
  HigherLowerGame game;

  @override
  State<Game1Board> createState() => _GameBoardState();
}

class _GameBoardState extends State<Game1Board> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.game.hlBoard
          .map((e) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: e
            .map((e) => Container(
          padding: const EdgeInsets.all(16.0),
          width: 77.0,
          height: 65.0,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: e.code == 0
                ? Colors.grey.shade800
                : e.code == 1
                ? Colors.black54
                : Colors.red,
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
