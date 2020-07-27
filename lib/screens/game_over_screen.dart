import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:simon_memory_game/services/user.dart';

class GameOverScreen extends StatelessWidget {
  final User user;
  GameOverScreen({this.user});

  @override
  Widget build(BuildContext context) {
    void addUser() async {
      await Hive.openBox('scores');
      final hiveDb = Hive.box('scores');
      hiveDb.add(user);
    }

    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Center(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Text(
                  user.username,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 80),
                ),
              ),
              Text(
                user.score.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 80),
              ),
              FlatButton(
                color: Colors.white24,
                splashColor: Colors.white38,
                child: Text(
                  'Go to Home Screen',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 20),
                ),
                onPressed: () {
                  addUser();
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
