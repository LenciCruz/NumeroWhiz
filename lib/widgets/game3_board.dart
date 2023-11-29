import 'package:flutter/material.dart';
import '../utils/game3_provider.dart';
import '../widgets/game3_keyboard.dart';

class Game3Board extends StatefulWidget {
  Game3Board(this.game, {Key? key}) : super(key: key);
  PaDGame game;

  @override
  State<Game3Board> createState() => _GameBoardState();
}

class _GameBoardState extends State<Game3Board> {
  @override
  Widget build(BuildContext context) {
    int row = 0;
    String Pos1 = "";
    String Pos2 = "";
    String Pos3 = "";
    String Pos4 = "";
    String Pos5 = "";
    String Pos6 = "";
    String Pos7 = "";
    String Pos8 = "";
    String Pos9 = "";
    String Pos10 = "";

    createRow(String value, int rowIndex) {
      int currentRow = widget.game.getCurrentRowId();
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 25.0),
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
            child: Center(
              child: Text(
                currentRow == rowIndex
                    ? widget.game.getCorrectPos()
                    : "", // Use widget.correctPos,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 25.0),
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
            child: Center(
              child: Text(
                currentRow == rowIndex
                    ? widget.game.getCorrectNums()
                    : "", // Display empty for other rows
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10.0),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
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
        Row(children: [
          Column(
            children: widget.game.numberdleBoard
                .map(
                  (e) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: e
                        .map((e) => Container(
                              width: 45.0,
                              height: 45.0,
                              margin: const EdgeInsets.symmetric(
                                vertical: 3.0,
                                horizontal: 3.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: e.code == 0
                                    ? Color(0xFF212121)
                                    : e.code == 1
                                        ? Colors.black54
                                        : Colors.red,
                              ),
                              child: Center(
                                  child: Text(
                                e.letter!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                            ))
                        .toList(),
                  ),
                )
                .toList(),
          ),
          //const SizedBox(width: 5.0),
          Column(
            children: [
              createRow(Pos1, 1),
              createRow(Pos2, 2),
              createRow(Pos3, 3),
              createRow(Pos4, 4),
              createRow(Pos5, 5),
              createRow(Pos6, 6),
              createRow(Pos7, 7),
              createRow(Pos8, 8),
              createRow(Pos9, 9),
              createRow(Pos10, 10),
            ],
          )
        ])
        // Gray boxes
      ],
    );
  }
}
