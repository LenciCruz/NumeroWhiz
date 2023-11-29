import 'package:flutter/material.dart';
import '../utils/game3_provider.dart';
import '../widgets/game3_keyboard.dart';
import 'package:google_fonts/google_fonts.dart';

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

    createRow(int rowIndex) {
      int currentRow = widget.game.getCurrentRowId();
      if (currentRow == 1) {
        String firstPos = widget.game.getCorrectPos();
      }
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
                currentRow == rowIndex ? widget.game.getCorrectNums() : "",
                // Display empty for other rows // Use widget.correctNums
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 75.0),
            Container(
              //padding:
              //const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                "Your Guesses",
                style: GoogleFonts.archivoNarrow(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            //const Spacer(),
            SizedBox(width: 75.0),
            Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Correct",
                    style: GoogleFonts.archivoNarrow(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Position",
                    style: GoogleFonts.archivoNarrow(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Correct",
                    style: GoogleFonts.archivoNarrow(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Number",
                    style: GoogleFonts.archivoNarrow(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(children: [
          SizedBox(width: 15.0),
          Column(
            children: widget.game.padBoard
                .map(
                  (e) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: e
                    .map((e) => Container(
                  width: 45.0,
                  height: 45.0,
                  margin: const EdgeInsets.symmetric(
                    vertical: 3.0,
                    horizontal: 5.0,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Color(0xFF212121)),
                  child: Center(
                      child: Text(
                        e.letter!,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lilitaOne(
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
          const SizedBox(width: 25.0),
          Row(
            children: [
              Column(
                children: widget.game.resultsBoardPos
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
                        color: Colors.transparent,
                      ),
                      child: Center(
                          child: Text(
                            e.results!,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lilitaOne(
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
              const SizedBox(width: 20.0),
              Column(
                children: widget.game.resultsBoardNums
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
                        color: Colors.transparent,
                      ),
                      child: Center(
                          child: Text(
                            e.resultsNums!,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lilitaOne(
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
            ],
          )
        ])
        // Gray boxes
      ],
    );
  }
}
