import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simon_memory_game/services/game_logic.dart';
import 'package:simon_memory_game/services/score.dart';
import 'package:simon_memory_game/services/user.dart';

import 'game_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Simon',
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60, bottom: 30),
              child: Icon(
                Icons.add,
                size: 100,
                color: Colors.deepOrange,
              ),
            ),
            Text(
              'Welcome to Simon Says',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: FlatButton(
                child: Text(
                  'Start',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            title: Text('Please enter username'),
                            content: TextField(
                              decoration: InputDecoration(
                                  icon: Icon(Icons.person_add),
                                  hintText: 'Username'),
                              onChanged: (value) {
                                username = value;
                                print(value);
                              },
                            ),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('Continue'),
                                onPressed: () {
                                  Provider.of<Score>(context, listen: false)
                                      .resetScore();
                                  Provider.of<GameLogic>(context, listen: false)
                                      .resetGame();
                                  Provider.of<GameLogic>(context, listen: false)
                                      .addToGameList();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GameScreen(
                                              username: this.username)));
                                },
                              ),
                            ],
                          ));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: FlatButton(
                child: Text(
                  'Scores',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange),
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
