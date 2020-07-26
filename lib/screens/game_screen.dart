import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simon_memory_game/services/game_logic.dart';
import 'package:simon_memory_game/services/score.dart';
import 'package:simon_memory_game/widgets/game_button.dart';

class GameScreen extends StatefulWidget {
  final String username;

  GameScreen({@required this.username});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  var firstColor = Colors.red;
  var secondColor = Colors.blue;
  var thirdColor = Colors.green;
  var fourthColor = Colors.yellow;
  var lastElement = -1;

  String _now;
  Timer _everySecond;

  @override
  void initState() {
    super.initState();
    print(widget.username);
    // sets first value
    _now = DateTime.now().second.toString();

    // defines a timer
    _everySecond = Timer.periodic(Duration(milliseconds: 100), (Timer t) {
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
                  GameButton(
                    buttonIndex: 0,
                    buttonColor: Colors.red,
                    selected: (lastElement == 0) ? true : false,
                  ),
                  GameButton(
                    buttonIndex: 1,
                    buttonColor: Colors.blue,
                    selected: (lastElement == 1) ? true : false,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GameButton(
                    buttonIndex: 2,
                    buttonColor: Colors.green,
                    selected: (lastElement == 2) ? true : false,
                  ),
                  GameButton(
                    buttonIndex: 3,
                    buttonColor: Colors.yellow,
                    selected: (lastElement == 3) ? true : false,
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
