import 'package:NumeroWhiz/screens/game3_screen.dart';
import 'package:flutter/material.dart';
import '../screens/mainmenu_screen.dart';
import '../utils/game3_provider.dart';
import 'game3_board.dart';

class Game3Keyboard extends StatefulWidget {
  Game3Keyboard(this.game, {Key? key}) : super(key: key);
  PaDGame game;

  @override
  State<Game3Keyboard> createState() => _GameKeyboardState();
}

class _GameKeyboardState extends State<Game3Keyboard> {
  List row2 = "012345".split("");
  List row3 = ["DEL", "6", "7", "8", "9", "SUBMIT"];
  int correctNums = 0;
  int correctPos = 0;

  @override
  Widget build(BuildContext context) {
    // setting the game rules
    return Column(
      children: [
        Text(
          PaDGame.game_message,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Game3Board(
          widget.game,
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: row2.map((e) {
            return InkWell(
              onTap: () {
                print(e);
                if (widget.game.letterId < 4) {
                  print(widget.game.letterId);
                  print(widget.game.rowId);
                  widget.game.insertWord(widget.game.letterId, Letter(e, 0));
                  widget.game.letterId++;
                  setState(() {});
                }
              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey.shade300,
                ),
                child: Text(
                  "${e}",
                  style: const TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: row3.map((e) {
            return InkWell(
              onTap: () {
                print(e);

                if (e == "DEL") {
                  if (widget.game.letterId > 0) {
                    setState(() {
                      widget.game
                          .insertWord(widget.game.letterId - 1, Letter("", 0));
                      widget.game.letterId--;
                    });
                  }
                } else if (e == "SUBMIT") {
                  if (widget.game.letterId >= 4) {
                    String guess = widget.game.numberdleBoard[widget.game.rowId]
                        .map((e) => e.letter)
                        .join();
                    print(guess);
                    print(PaDGame.game_guess == guess);
                    if (widget.game.noRepeating(guess)) {
                      // checkword
                      if (guess == PaDGame.game_guess) {
                        setState(() {
                          widget.game.numberdleBoard[widget.game.rowId]
                              .forEach((element) {
                            element.code = 1;
                            widget.game.setCorrectPos("4");
                            widget.game.setCorrectNums("4");
                            if (widget.game.resultsPosId < 2) {
                              print(widget.game.resultsPosId);
                              print(widget.game.rowId);
                              widget.game.insertPosResults(
                                  widget.game.resultsPosId, Results("4"));
                              //widget.game.insertNumsResults(widget.game.resultsPosId, Results("4"));
                              widget.game.letterId++;
                              setState(() {});
                            }
                            if (widget.game.resultNumsId < 2) {
                              print(widget.game.resultNumsId);
                              print(widget.game.rowId);
                              widget.game.insertNumsResults(
                                  widget.game.resultNumsId, ResultsNums("4"));
                              //widget.game.insertNumsResults(widget.game.resultsPosId, Results("4"));
                              widget.game.letterId++;
                              setState(() {});
                            }
                            print("correct Nums: " + correctNums.toString());
                            print("correct Pos: " + correctPos.toString());
                          });
                          // show alert
                          // Check if the user has won and show an alert after 1.5 seconds
                          Future.delayed(
                            const Duration(milliseconds: 800),
                            () {
                              _showAlertDialog(
                                context,
                                'Congratulations🎉, you guessed the number!',
                              );
                            },
                          );
                        });
                      } else {
                        print(PaDGame.game_guess);
                        int listLength = guess.length;
                        for (int i = 0; i < listLength; i++) {
                          String char = guess[i].toUpperCase();
                          print(
                            "the test: ${PaDGame.game_guess.contains(char)}",
                          );
                          if (PaDGame.game_guess.contains(char)) {
                            if (PaDGame.game_guess[i] == char) {
                              setState(() {
                                PaDGame.game_message = "";
                                print(char);
                                widget.game.numberdleBoard[widget.game.rowId][i]
                                    .code = 1;
                                correctNums++;
                                correctPos++;
                                widget.game
                                    .setCorrectPos(correctPos.toString());
                                widget.game
                                    .setCorrectNums(correctNums.toString());
                                print(
                                  "correct Nums: " + correctNums.toString(),
                                );
                                print(
                                  "correct Pos: " + correctPos.toString(),
                                );
                              });
                              if (widget.game.resultsPosId < 2) {
                                print(widget.game.resultsPosId);
                                print(widget.game.rowId);
                                widget.game.insertPosResults(
                                    widget.game.resultsPosId,
                                    Results(correctPos.toString()));
                                // widget.game.insertNumsResults(widget.game.resultsPosId, Results(correctNums.toString()));
                                widget.game.letterId++;
                                setState(() {});
                              }
                              if (widget.game.resultNumsId < 2) {
                                print(widget.game.resultNumsId);
                                print(widget.game.rowId);
                                widget.game.insertNumsResults(
                                    widget.game.resultNumsId,
                                    ResultsNums(correctNums.toString()));
                                //widget.game.insertNumsResults(widget.game.resultsPosId, Results("4"));
                                widget.game.letterId++;
                                setState(() {});
                              }
                            } else {
                              setState(() {
                                PaDGame.game_message = "";
                                print(char);
                                widget.game.numberdleBoard[widget.game.rowId][i]
                                    .code = 1;
                                correctNums++;
                                widget.game
                                    .setCorrectPos(correctPos.toString());
                                widget.game
                                    .setCorrectNums(correctNums.toString());
                                if (widget.game.resultsPosId < 2) {
                                  print(widget.game.resultsPosId);
                                  print(widget.game.rowId);
                                  widget.game.insertPosResults(
                                      widget.game.resultsPosId,
                                      Results(correctPos.toString()));
                                  widget.game.insertNumsResults(
                                      widget.game.resultsPosId,
                                      ResultsNums(correctNums.toString()));
                                  widget.game.letterId++;
                                  setState(() {});
                                }

                                print(
                                  "correct Nums: " + correctNums.toString(),
                                );
                                print(
                                  "correct Pos: " + correctPos.toString(),
                                );
                              });
                            }
                          } else {
                            setState(() {
                              PaDGame.game_message = "";
                              print(char);
                              widget.game.numberdleBoard[widget.game.rowId][i]
                                  .code = 1;
                            });
                          }
                        }
                        widget.game.rowId++;
                        widget.game.letterId = 0;
                        // Check if the user has failed and show an alert after 2 seconds
                        if (widget.game.rowId >= 10) {
                          Future.delayed(
                            const Duration(seconds: 2),
                            () {
                              _showAlertDialog(
                                context,
                                'Sorry, you failed to guess the number. Try again!',
                              );
                            },
                          );
                        }
                      }
                    } else {
                      setState(() {
                        PaDGame.game_message =
                            "Input has repeating values. Try again.";
                      });
                    }

                    // Reset correctNums and correctPos after processing the submit action
                    setState(() {
                      correctNums = 0;
                      correctPos = 0;
                    });
                  }
                } else {
                  if (widget.game.letterId < 4) {
                    // change to 4
                    print(widget.game.rowId);
                    widget.game.insertWord(
                      widget.game.letterId,
                      Letter(e, 0),
                    );
                    widget.game.letterId++;
                    setState(() {});
                  }
                }
              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
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
      ],
    );
  }
}

void _showAlertDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'NumeroWhiz Alert',
          style: TextStyle(fontSize: 20.0),
        ),
        content: Text(
          message,
          style: const TextStyle(fontSize: 18.0),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Game3Screen()),
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
              Navigator.pop(context);
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
      );
    },
  );
}
