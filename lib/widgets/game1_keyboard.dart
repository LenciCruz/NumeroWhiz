import 'package:NumeroWhiz/utils/game1_provider.dart';
import 'package:flutter/material.dart';
import '../screens/game1_screen.dart';
import '../screens/mainmenu_screen.dart';
import '../utils/game.dart';
import 'game1_board.dart';
import 'package:google_fonts/google_fonts.dart';

class Game1Keyboard extends StatefulWidget {
  Game1Keyboard(this.game, {Key? key}) : super(key: key);
  HigherLowerGame game;

  @override
  State<Game1Keyboard> createState() => _GameKeyboardState();
}

class _GameKeyboardState extends State<Game1Keyboard> {
  List<List<String>> rows = [
    ["0", "1", "2", "3", "4", "5"],
    ["DEL", "6", "7", "8", "9", "SUBMIT"],
  ];
  int tries = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.game.game_message,
          style: GoogleFonts.archivoBlack(
            fontSize: 30,
            color: widget.game.game_message.contains("GUESS LOWER")
                ? Color(0xFFF9C425)
                : (widget.game.game_message.contains("GUESS HIGHER")
                    ? Color(0xFFFF3D00)
                    : Color(0xFF9EB5F4)),
            letterSpacing: 0.2,
          ),
        ),
        const SizedBox(height: 100.0),
        Game1Board(widget.game),
        const SizedBox(height: 20.0),
        for (List<String> row in rows)
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: row.map((e) {
                return InkWell(
                  onTap: () {
                    handleKeyboardTap(e);
                  },
                  child: Container(
                    padding: e == "SUBMIT"
                        ? const EdgeInsets.fromLTRB(5, 24, 5, 24)
                        : e == "DEL"
                            ? const EdgeInsets.fromLTRB(18, 24, 18, 24)
                            : const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.grey.shade300,
                    ),
                    child: Text(
                      "${e}",
                      style: GoogleFonts.lilitaOne(
                        fontSize: e == "SUBMIT" || e == "DEL" ? 18.0 : 25.0,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }

  void handleKeyboardTap(String value) {
    if (value == "DEL") {
      if (widget.game.letterId > 0) {
        setState(() {
          widget.game.insertWord(widget.game.letterId - 1, Letter("", 0));
          widget.game.letterId--;
          widget.game.game_message = "";
        });
      }
    } else if (value == "SUBMIT") {
      tries++;
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======

>>>>>>> 923f8886523f15f33a5984d512e6297e670c436f
>>>>>>> 5b00bb586ed34ce50494bfeb5345192dc50ec46e

      // setting the game rules
      if (widget.game.letterId >= 2) {
        String guess = widget.game.gameBoard[widget.game.rowId]
            .map((e) => e.letter)
            .join();
        print("guess: $guess");
        print("game_guess: ${widget.game.game_guess}");
        print(guess);
        print(widget.game.game_message == guess);
        if (int.tryParse(guess) != null &&
            int.tryParse(widget.game.game_guess) != null) {
          int guessInt = int.parse(guess);
          int gameGuessInt = int.parse(widget.game.game_guess);

          if (guessInt == gameGuessInt) {
            setState(() {
              widget.game.gameBoard[widget.game.rowId].forEach((element) {
                element.code = 1;
              });
            });
            widget.game.game_message = "";
            setState(() {}); // Trigger a rebuild

            // Check if the user has won and show an alert after delay
            Future.delayed(const Duration(milliseconds: 500), () {
              _showAlertDialogWin(context,
                  'Congratulations! You have guessed the number correctly by ${tries} attempts!');
            });
          } else {
            if (guessInt > gameGuessInt) {
              setState(() {
                widget.game.game_message = "GUESS LOWER";
              });
              print('LOWER');
            } else if (guessInt < gameGuessInt) {
              setState(() {
                widget.game.game_message = "GUESS HIGHER";
              });
              print('HIGHER');
            }
            print(widget.game.game_guess);
            widget.game.rowId = 0;
          }
<<<<<<< HEAD
        } else {
          print('invalid numeric input');
=======
<<<<<<< HEAD
        } else {
          print('invalid numeric input');
=======
<<<<<<< HEAD
        } else {
          print('invalid numeric input');
=======
          print(HigherLowerGame.game_guess);
          widget.game.rowId = 0;
          setState(() {
            widget.game.insertWord(widget.game.letterId - 1, Letter("", 0));
            widget.game.insertWord(widget.game.letterId - 2, Letter("", 0));
            widget.game.letterId--;
            widget.game.letterId--;

          });
>>>>>>> 73cd7b95e9adccebfbe6b411b892e55b21df0ff0
>>>>>>> 923f8886523f15f33a5984d512e6297e670c436f
>>>>>>> 5b00bb586ed34ce50494bfeb5345192dc50ec46e
        }
        print(widget.game.game_guess);
        widget.game.rowId = 0;
      }
    } else {
      if (widget.game.letterId < 2) {
        widget.game.insertWord(widget.game.letterId, Letter(value, 0));
        widget.game.letterId++;
        setState(() {});
      }
    }
  }
}

class CustomGradientDialogWin extends StatelessWidget {
  final String title;
  final String message;

  const CustomGradientDialogWin({required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFC3DAAF), Color(0xFF96C969)],
        ),
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Color(0xFF689F38), width: 2.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 8.0),
                Image.asset(
                  'assets/logo.png',
                  height: 100,
                  width: 100,
                ),
                SizedBox(height: 8.0),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: Text(
                    message,
                    style: GoogleFonts.archivoNarrow(
                      fontSize: 20.0,
                      color: Colors.white,
                      letterSpacing: 1.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Game1Screen()),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF4E7D26),
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  'Play Again',
                  style: GoogleFonts.archivoNarrow(
                      fontSize: 16.0, letterSpacing: 1.0),
                ),
              ),
              SizedBox(width: 16.0),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainMenu()),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF4E7D26),
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  'Main Menu',
                  style: GoogleFonts.archivoNarrow(
                      fontSize: 16.0, letterSpacing: 1.0),
                ),
              ),
              SizedBox(height: 100.0),
            ],
          ),
        ],
      ),
    );
  }
}

void _showAlertDialogWin(BuildContext context, String message) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return CustomGradientDialogWin(
        title: 'NumeroWhiz Alert',
        message: message,
      );
    },
  );
}
