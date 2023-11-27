import 'package:flutter/material.dart';
import '../screens/game2_screen.dart';
import '../screens/mainmenu_screen.dart';
import '../utils/game2_provider.dart';
import 'game2_board.dart';


class Game2Keyboard extends StatefulWidget {
  Game2Keyboard(this.game, {Key? key}) : super(key: key);
  NumberdleGame game;

  @override
  State<Game2Keyboard> createState() => _GameKeyboardState();
}

class _GameKeyboardState extends State<Game2Keyboard> {
  List<List<String>> rows = [
    ["1", "2", "3", "4", "5"],
    ["6", "7", "8", "9", "0"],
    ["DELETE", "SUBMIT"],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          NumberdleGame.game_message,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 0.0),
        Game2Board(widget.game),
        const SizedBox(height: 5.0),
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
                    padding: const EdgeInsets.all(25.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.grey.shade300,
                    ),
                    child: Text(
                      "${e}",
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
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
    if (value == "DELETE") {
      if (widget.game.letterId > 0) {
        setState(() {
          widget.game.insertWord(widget.game.letterId - 1, Letter("", 0));
          widget.game.letterId--;
        });
      }
    } else if (value == "SUBMIT") {
      // setting the game rules
      if (widget.game.letterId >= 5) {
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
      if (widget.game.letterId < 5) {
        widget.game.insertWord(widget.game.letterId, Letter(value, 0));
        widget.game.letterId++;
        setState(() {});
      }
    }
  }

}


void _showAlertDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title:const Text(
          'NumeroWhiz Alert',
          style: TextStyle(fontSize: 20.0), // Set the title font size
        ),
        content: Text(
          message,
          style: const TextStyle(fontSize: 18.0), // Set the content font size
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
              style: TextStyle(fontSize: 16.0), // Set the button font size
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
              style: TextStyle(fontSize: 16.0), // Set the button font size
            ),
          ),
        ],
      );
    },
  );
}







