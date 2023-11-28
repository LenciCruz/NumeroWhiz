import 'package:NumeroWhiz/utils/game1_provider.dart';
import 'package:flutter/material.dart';
import '../screens/game1_screen.dart';
import '../screens/mainmenu_screen.dart';
import 'game1_board.dart';



class Game1Keyboard extends StatefulWidget {
  Game1Keyboard(this.game, {Key? key}) : super(key: key);
  HigherLowerGame game;

  @override
  State<Game1Keyboard> createState() => _GameKeyboardState();
}

class _GameKeyboardState extends State<Game1Keyboard> {
  List<List<String>> rows = [
    ["0", "1", "2", "3", "4"],
    ["5", "6", "7", "8", "9"],
    ["DELETE", "SUBMIT"],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          HigherLowerGame.game_message,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 0.0),
        Game1Board(widget.game),
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
      if (widget.game.letterId >= 2) {
        String guess = widget.game.hlBoard[widget.game.rowId]
            .map((e) => e.letter)
            .join();
        print(guess);
        print(HigherLowerGame.game_guess == guess);
        //checkword
        if (guess == HigherLowerGame.game_guess) {
          setState(() {
            widget.game.hlBoard[widget.game.rowId].forEach((element) {
              element.code = 1;
            });
          });
          // Check if the user has won and show an alert after 1.5 seconds
          Future.delayed(const Duration(milliseconds: 800), () {
            _showAlertDialog(
                context, 'Congratulations🎉, you guessed the number!');
          });
        }
        else {
          if(int.parse(guess) > int.parse(HigherLowerGame.game_guess)) {
            setState(() {
              HigherLowerGame.game_message = "LOWER";
            });
            print('LOWER');

          }
          else if(int.parse(guess) < int.parse(HigherLowerGame.game_guess)) {
            setState(() {
              HigherLowerGame.game_message = "HIGHER";
            });
            print('HIGHER');
          }
          print(HigherLowerGame.game_guess);
          /*   int listLength = guess.length;
            for (int i = 0; i < listLength; i++) {
              String char = guess[i].toUpperCase();
              print("the test: ${HigherLowerGame.game_guess.contains(char)}");
                if (HigherLowerGame.game_guess[i] == char) {
                  setState(() {
                    HigherLowerGame.game_message = "";
                    print(char);
                    widget.game.numberdleBoard[widget.game.rowId][i].code = 1;
                  });
                } else {
                  setState(() {
                    HigherLowerGame.game_message = "";
                    print(char);
                    widget.game.numberdleBoard[widget.game.rowId][i].code = 2;
                  });
                }

            }
            */
          widget.game.rowId = 0;
          widget.game.letterId = 0;
        }

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
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Game1Screen()),
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => MainMenu()),
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








