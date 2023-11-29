import 'package:NumeroWhiz/screens/game3_screen.dart';
import 'package:flutter/material.dart';
import '../screens/mainmenu_screen.dart';
import '../utils/game3_provider.dart';
import 'game3_board.dart';
import 'package:google_fonts/google_fonts.dart';

class Game3Keyboard extends StatefulWidget {
  Game3Keyboard(this.game, {Key? key}) : super(key: key);
  PaDGame game;

  @override
  State<Game3Keyboard> createState() => _GameKeyboardState();
}

class _GameKeyboardState extends State<Game3Keyboard> {
  List<List<String>> rows = [
    ["0", "1", "2", "3", "4", "5"],
    ["DEL", "6", "7", "8", "9", "SUBMIT"],
  ];
  int correctNums = 0;
  int correctPos = 0;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15.0),
        Text(
            PaDGame.game_message,
            style: GoogleFonts.archivoBlack(
                fontSize: 12,
                color: Color(0xFF9EB5F4),
                letterSpacing: 0.2)
        ),
        //const SizedBox(height: 15.0),
        Game3Board(widget.game),
        const SizedBox(height: 10.0),
        for (List<String> row in rows)
          Container(
            //: EdgeInsets.only(bottom: 8.0),
            margin: const EdgeInsets.symmetric(vertical: 3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: row.map((e) {
                return InkWell(
                  onTap: () {
                    handleKeyboardTap(e);
                  },
                  child: Container(
                    padding: e == "SUBMIT"
                        ? const EdgeInsets.fromLTRB(5, 16, 5, 16)
                        : e == "DEL"
                        ? const EdgeInsets.fromLTRB(12, 16, 12, 16)
                        : const EdgeInsets.fromLTRB(23, 12, 23, 12),
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
          widget.game
              .insertWord(widget.game.letterId - 1, Letter("", 0));
          widget.game.letterId--;
        });
      }
    } else if (value == "SUBMIT") {
      if (widget.game.letterId >= 4) {
        String guess = widget.game.padBoard[widget.game.rowId]
            .map((e) => e.letter)
            .join();
        print("guess : " + guess);
        print("match?");
        print(PaDGame.game_guess == guess);
        if (widget.game.noRepeating(guess)) {
          // checkword
          if (guess == PaDGame.game_guess) {
            setState(() {
              widget.game.padBoard[widget.game.rowId]
                  .forEach((element) {
                element.code = 1;
                widget.game.setCorrectPos("4");
                widget.game.setCorrectNums("4");
                if (widget.game.resultsPosId < 2) {
                  print("resultsPosId");
                  print(widget.game.resultsPosId);
                  //print(widget.game.rowId);
                  widget.game.insertPosResults(
                      widget.game.resultsPosId, Results("4"));
                  widget.game.letterId++;
                  setState(() {});
                }
                if (widget.game.resultNumsId < 2) {
                  print("resultsNumsId");
                  print(widget.game.resultNumsId);
                  //print(widget.game.rowId);
                  widget.game.insertNumsResults(
                      widget.game.resultNumsId, ResultsNums("4"));
                  widget.game.letterId++;
                  setState(() {});
                }
                print("correct Nums: " + correctNums.toString());
                print("correct Pos: " + correctPos.toString());
              });
              // show alert
              // Check if the user has won and show an alert after delay
              Future.delayed(
                const Duration(milliseconds: 500),
                    () {
                  _showAlertDialogWin(
                    context,
                    'Congratulations! You have guessed the number correctly!',
                  );
                },
              );
            });
          } else {
            print("Guess :");
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
                    print("char");
                    print(char);
                    widget.game.padBoard[widget.game.rowId][i]
                        .code = 1;
                    correctNums++;
                    correctPos++;
                    widget.game.setCorrectPos(correctPos.toString());
                    widget.game.setCorrectNums(correctNums.toString());
                  });
                  if (widget.game.resultsPosId < 2) {
                    print("resultsPosId");
                    print(widget.game.resultsPosId);
                    widget.game.insertPosResults(widget.game.resultsPosId,
                        Results(correctPos.toString()));
                    widget.game.letterId++;
                    setState(() {});
                  }
                  if (widget.game.resultNumsId < 2) {
                    print("resultsNumsId");
                    print(widget.game.resultNumsId);
                    widget.game.insertNumsResults(widget.game.resultNumsId,
                        ResultsNums(correctNums.toString()));
                    widget.game.letterId++;
                    setState(() {});
                  }
                  print("correct Nums: " + correctNums.toString(),);
                  print("correct Pos: " + correctPos.toString(),);
                } else {
                  setState(() {
                    PaDGame.game_message = "";
                    print("char");
                    print(char);
                    widget.game.padBoard[widget.game.rowId][i]
                        .code = 1;
                    correctNums++;
                    widget.game.setCorrectPos(correctPos.toString());
                    widget.game.setCorrectNums(correctNums.toString());

                    if (widget.game.resultsPosId < 2) {
                      print("resultsPosId");
                      print(widget.game.resultsPosId);
                      widget.game.insertPosResults(widget.game.resultsPosId,
                          Results(correctPos.toString()));
                      widget.game.letterId++;
                      setState(() {});
                    }
                    if (widget.game.resultNumsId < 2) {
                      print("resultsNumsId");
                      print(widget.game.resultNumsId);
                      //print(widget.game.rowId);
                      //widget.game.insertPosResults(widget.game.resultsPosId, Results(correctPos.toString()));
                      widget.game.insertNumsResults(widget.game.resultsPosId,
                          ResultsNums(correctNums.toString()));
                      widget.game.letterId++;
                      setState(() {});
                    }
                    print("correct Nums: " + correctNums.toString(),);
                    print("correct Pos: " + correctPos.toString(),);
                  });
                }
              } else {
                setState(() {
                  PaDGame.game_message = "";
                  print("char");
                  print(char);
                  widget.game.padBoard[widget.game.rowId][i]
                      .code = 1;
                  widget.game.setCorrectPos(correctPos.toString());
                  widget.game.setCorrectNums(correctNums.toString());

                  if (widget.game.resultsPosId < 2) {
                    print("resultsPosId");
                    print(widget.game.resultsPosId);
                    widget.game.insertPosResults(widget.game.resultsPosId,
                        Results(correctPos.toString()));
                    widget.game.letterId++;
                    setState(() {});
                  }
                  if (widget.game.resultNumsId < 2) {
                    print("resultsNumsId");
                    print(widget.game.resultNumsId);
                    widget.game.insertNumsResults(widget.game.resultsPosId,
                        ResultsNums(correctNums.toString()));
                    widget.game.letterId++;
                    setState(() {});
                  }
                  print("correct Nums: " + correctNums.toString(),);
                  print("correct Pos: " + correctPos.toString(),);
                });
              }
            }
            widget.game.rowId++;
            widget.game.letterId = 0;
            // Check if the user has failed and show an alert after delay
            if (widget.game.rowId >= 10) {
              Future.delayed(const Duration(milliseconds: 500), () {
                _showAlertDialogLose(
                  context, 'Uh oh! You have exceeded the amount of trials! Nice Try!',
                );
              },
              );
            }
          }
        } else {
          setState(() {
            PaDGame.game_message = "Input has repeating values. Try again.";
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
        print(widget.game.rowId);
        widget.game.insertWord(
          widget.game.letterId,
          Letter(value, 0),
        );
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
                    MaterialPageRoute(builder: (context) => const Game3Screen()),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF4E7D26),
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  'Play Again',
                  style: GoogleFonts.archivoNarrow(fontSize: 16.0, letterSpacing: 1.0),
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
                  style: GoogleFonts.archivoNarrow(fontSize: 16.0, letterSpacing: 1.0),
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



class CustomGradientDialogLose extends StatelessWidget {
  final String title;
  final String message;

  const CustomGradientDialogLose({required this.title, required this.message});

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
          colors: [Color(0xFFE68B8B), Color(0xFFB12626)],
        ),
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Color(0xFFA00707), width: 2.0),
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
                        letterSpacing: 1.0
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
                    MaterialPageRoute(builder: (context) => const Game3Screen()),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF7F0C0C),
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  'Play Again',
                  style: GoogleFonts.archivoNarrow(fontSize: 16.0, letterSpacing: 1.0),
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
                  backgroundColor: Color(0xFF7F0C0C),
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  'Main Menu',
                  style: GoogleFonts.archivoNarrow(fontSize: 16.0, letterSpacing: 1.0),
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

void _showAlertDialogLose(BuildContext context, String message) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return CustomGradientDialogLose(
        title: 'NumeroWhiz Alert',
        message: message,
      );
    },
  );
}





