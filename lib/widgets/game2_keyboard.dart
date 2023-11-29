import 'package:flutter/material.dart';
import '../screens/game2_screen.dart';
import '../screens/mainmenu_screen.dart';
import '../utils/game2_provider.dart';
import 'game2_board.dart';
import 'package:google_fonts/google_fonts.dart';

class Game2Keyboard extends StatefulWidget {
  Game2Keyboard(this.game, {Key? key}) : super(key: key);
  NumberdleGame game;

  @override
  State<Game2Keyboard> createState() => _GameKeyboardState();
}

class _GameKeyboardState extends State<Game2Keyboard> {
  List<List<String>> rows = [
    ["0", "1", "2", "3", "4", "5"],
    ["DEL", "6", "7", "8", "9", "SUBMIT"],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
            NumberdleGame.game_message,
            style: GoogleFonts.archivoBlack(
                fontSize: 12,
                color: Color(0xFF9EB5F4),
                letterSpacing: 0.2)
        ),
        const SizedBox(height: 5.0),
        Game2Board(widget.game),
        const SizedBox(height: 20.0),
        for (List<String> row in rows)
          Container(
            //: EdgeInsets.only(bottom: 8.0),
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
        });
      }
    } else if (value == "SUBMIT") {
      // setting the game rules
      if (widget.game.letterId >= 4) {
        String guess = widget.game.numberdleBoard[widget.game.rowId]
            .map((e) => e.letter)
            .join();
        print(guess);
        print(NumberdleGame.game_guess == guess);

        if (widget.game.noRepeating(guess)) {
          //checkword
          if (guess == NumberdleGame.game_guess) {
            setState(() {
              widget.game.numberdleBoard[widget.game.rowId].forEach((element) {
                element.code = 1;
              });
            });
            // Check if the user has won and show an alert after 1.5 seconds
            Future.delayed(const Duration(milliseconds: 800), () {
              _showAlertDialog(
                  context, 'Congratulations🎉, you guessed the number!');
            });

          } else {
            print(NumberdleGame.game_guess);
            int listLength = guess.length;
            for (int i = 0; i < listLength; i++) {
              String char = guess[i].toUpperCase();
              print("the test: ${NumberdleGame.game_guess.contains(char)}");
              if (NumberdleGame.game_guess.contains(char)) {
                if (NumberdleGame.game_guess[i] == char) {
                  setState(() {
                    NumberdleGame.game_message = "";
                    print(char);
                    widget.game.numberdleBoard[widget.game.rowId][i].code = 1;
                  });
                } else {
                  setState(() {
                    NumberdleGame.game_message = "";
                    print(char);
                    widget.game.numberdleBoard[widget.game.rowId][i].code = 2;
                  });
                }
              } else {
                setState(() {
                  NumberdleGame.game_message = "";
                  print(char);
                  widget.game.numberdleBoard[widget.game.rowId][i].code = 3;
                });
              }
            }
            widget.game.rowId++;
            widget.game.letterId = 0;

            // Check if the user has failed and show an alert after 2 seconds
            if (widget.game.rowId >= 5) {
              Future.delayed(const Duration(seconds: 2), () {
                _showAlertDialog(context, 'Sorry, you failed to guess the number. Try again!');
              });
            }
          }
        }
        else {
          setState(() {
            NumberdleGame.game_message =
            "Input has repeating values. Try again.";
          });
        }
      }
    } else {
      if (widget.game.letterId < 4) {
        widget.game.insertWord(widget.game.letterId, Letter(value, 0));
        widget.game.letterId++;
        setState(() {});
      }
    }
  }

}


void _showAlertDialog(BuildContext context, String message) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return Theme(
        data: ThemeData(
          // Customize the background color of the AlertDialog
          canvasColor: Colors.transparent, // Set to transparent
        ),
        child: AlertDialog(
          title: const Text(
            'NumeroWhiz Alert',
            style: TextStyle(fontSize: 20.0), // Set the title font size
          ),
          content: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue,
                  Colors.green,
                ],
              ),
            ),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 170.0, // Adjust the max height as needed
                ),
                child: Column(
                  children: [
                    // Add an image here (replace 'your_image_asset_path' with the actual asset path)
                    Image.asset(
                      'assets/logo.png',
                      height: 100, // Adjust the height as needed
                      width: 100, // Adjust the width as needed
                    ),
                    const SizedBox(height: 16.0), // Add some space between the image and text
                    Text(
                      message,
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the alert
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Game2Screen()),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'Play Again',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the alert
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainMenu()),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'Main Menu',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      );
    },
  );
}