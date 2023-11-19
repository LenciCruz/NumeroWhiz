import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/game3_provider.dart';

class Game3Board extends StatefulWidget {
  Game3Board(this.game, {Key? key}) : super(key: key);
  PaDGame game;

  @override
  State<Game3Board> createState() => _GameBoardState();
}

class _GameBoardState extends State<Game3Board> {
  @override
  Widget build(BuildContext context) {
    createRow(){
      return const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "1",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text("2",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),),
        ],
      );
    }
    return Row(
        children: [Column(
          children: widget.game.numberdleBoard
              .map((e) =>
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: e
                    .map((e) => Container(
                  width: 55.0,
                  padding:const EdgeInsets.fromLTRB(5, 5, 5, 5),
                  height: 45.0,
                  margin: const EdgeInsets.symmetric(vertical: 1.5, horizontal: 3.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: e.code == 0
                        ? Colors.grey.shade800
                        : e.code == 1
                        ? Colors.grey.shade700
                        : Colors.grey.shade800
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
              ), )
              .toList(),
        ), Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            createRow(),
            createRow(),
            createRow(),
            createRow(),
            createRow(),
            createRow(),
            createRow(),
            createRow(),
            createRow(),
            createRow(),
          ],
        ) ]);
  }
}
