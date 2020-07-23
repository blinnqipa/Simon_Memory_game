import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Center(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Text(
                'U Lost lol',
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
