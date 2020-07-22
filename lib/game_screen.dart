import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simon_memory_game/services/score.dart';
import 'package:simon_memory_game/widgets/game_button.dart';

class GameScreen extends StatelessWidget {
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
                'Score: ',
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
                    buttonColor: Colors.red,
                    buttonIndex: 0,
                  ),
                  GameButton(
                    buttonColor: Colors.blue,
                    buttonIndex: 1,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GameButton(
                    buttonColor: Colors.green,
                    buttonIndex: 2,
                  ),
                  GameButton(
                    buttonColor: Colors.yellow,
                    buttonIndex: 3,
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
