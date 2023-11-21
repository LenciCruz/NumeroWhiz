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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
              //margin: EdgeInsets.fromLTRB(35, 0, 0, 0),
              child: const Text(
                "Correct",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
              //margin: EdgeInsets.fromLTRB(35, 0, 0, 0),
              child: const Text(
                "Correct",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              //margin: EdgeInsets.fromLTRB(35, 0, 0, 0),
              child: const Text(
                "Your Guesses",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const Spacer(),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              //margin: EdgeInsets.fromLTRB(25, 0, 0,0),
              child: const Text(
                "Position",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              //margin: EdgeInsets.fromLTRB(85, 0, 0,0),
              child: const Text(
                "Number",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        // Gray boxes
        ...widget.game.numberdleBoard.map((e) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (int i = 0; i < 4; i++)
              Container(
                width: 45.0,
                height: 45.0,
                margin: const EdgeInsets.symmetric(
                  vertical: 3.0,
                  horizontal: 3.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: e[i].code == 0
                      ? Colors.grey.shade800
                      : e[i].code == 1
                      ? Colors.green.shade400
                      : e[i].code == 2
                      ? Colors.amber.shade400
                      : Colors.red,
                ),
                child: Center(
                  child: Text(
                    e[i].letter!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            const SizedBox(width: 5.0), // Small gap
            Container(
              width: 45.0,
              height: 45.0,
              margin: const EdgeInsets.symmetric(
                vertical: 3.0,
                horizontal: 3.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: const Color(0xFF212121),
              ),
              child: const Center(
                child: Text(
                  "1", //insert result here
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: 45.0,
              height: 45.0,
              margin: const EdgeInsets.symmetric(
                vertical: 3.0,
                horizontal: 3.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: const Color(0xFF212121),
              ),
              child: const Center(
                child: Text(
                  "1", //insert result here
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ), const SizedBox(width: 10.0)
            ,
          ],
        )),
      ],
    );
  }
}