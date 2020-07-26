import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simon_memory_game/services/game_logic.dart';
import 'package:simon_memory_game/services/score.dart';
import 'package:simon_memory_game/widgets/game_button.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  var firstColor = Colors.red;
  var secondColor = Colors.blue;
  var thirdColor = Colors.green;
  var fourthColor = Colors.yellow;
  Stream stream;
  var lastElement = -1;

  String _now;
  Timer _everySecond;

  @override
  void initState() {
    super.initState();

    // sets first value
    _now = DateTime.now().second.toString();

    // defines a timer
    _everySecond = Timer.periodic(Duration(milliseconds: 500), (Timer t) {
      if (this.mounted) {
        setState(() {
          _now = DateTime.now().second.toString();
          lastElement = Provider.of<GameLogic>(context, listen: false)
              .generatedRandomNumber;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Column(
            children: <Widget>[
              Text(
                'Score:',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 30),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  Provider.of<Score>(context).score,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 30),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                    height: MediaQuery.of(context).size.height * 0.37,
                    width: MediaQuery.of(context).size.width * 0.47,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Material(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (Provider.of<GameLogic>(context, listen: false)
                                .listEqualLength()) {
                              Provider.of<Score>(context, listen: false)
                                  .incrementScore();
                            }
                            Provider.of<GameLogic>(context, listen: false)
                                .currentMove++;
                            Provider.of<GameLogic>(context, listen: false)
                                .addToUserList(0);
                            if (Provider.of<GameLogic>(context, listen: false)
                                .gameLost) {
                              Navigator.pushNamed(context, '/gameOverScreen');
                              Provider.of<GameLogic>(context, listen: false)
                                  .gameLost = false;
                            }
                          });
                        },
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        splashColor: Colors.white,
                      ),
                      color: (lastElement == 0) ? Colors.black : firstColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                    height: MediaQuery.of(context).size.height * 0.37,
                    width: MediaQuery.of(context).size.width * 0.47,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Material(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (Provider.of<GameLogic>(context, listen: false)
                                .listEqualLength()) {
                              Provider.of<Score>(context, listen: false)
                                  .incrementScore();
                            }
                            Provider.of<GameLogic>(context, listen: false)
                                .currentMove++;
                            Provider.of<GameLogic>(context, listen: false)
                                .addToUserList(1);
                            if (Provider.of<GameLogic>(context, listen: false)
                                .gameLost) {
                              Navigator.pushNamed(context, '/gameOverScreen');
                              Provider.of<GameLogic>(context, listen: false)
                                  .gameLost = false;
                            }
                          });
                        },
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        splashColor: Colors.white,
                      ),
                      color: (lastElement == 1) ? Colors.black : secondColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                    height: MediaQuery.of(context).size.height * 0.37,
                    width: MediaQuery.of(context).size.width * 0.47,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Material(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (Provider.of<GameLogic>(context, listen: false)
                                .listEqualLength()) {
                              Provider.of<Score>(context, listen: false)
                                  .incrementScore();
                            }
                            Provider.of<GameLogic>(context, listen: false)
                                .currentMove++;
                            Provider.of<GameLogic>(context, listen: false)
                                .addToUserList(2);
                            if (Provider.of<GameLogic>(context, listen: false)
                                .gameLost) {
                              Navigator.pushNamed(context, '/gameOverScreen');
                              Provider.of<GameLogic>(context, listen: false)
                                  .gameLost = false;
                            }
                          });
                        },
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        splashColor: Colors.white,
                      ),
                      color: (lastElement == 2) ? Colors.black : thirdColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                    height: MediaQuery.of(context).size.height * 0.37,
                    width: MediaQuery.of(context).size.width * 0.47,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Material(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (Provider.of<GameLogic>(context, listen: false)
                                .listEqualLength()) {
                              Provider.of<Score>(context, listen: false)
                                  .incrementScore();
                            }
                            Provider.of<GameLogic>(context, listen: false)
                                .currentMove++;
                            Provider.of<GameLogic>(context, listen: false)
                                .addToUserList(3);
                            if (Provider.of<GameLogic>(context, listen: false)
                                .gameLost) {
                              Navigator.pushNamed(context, '/gameOverScreen');
                              Provider.of<GameLogic>(context, listen: false)
                                  .gameLost = false;
                            }
                          });
                        },
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        splashColor: Colors.white,
                      ),
                      color: (lastElement == 3) ? Colors.black : fourthColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
