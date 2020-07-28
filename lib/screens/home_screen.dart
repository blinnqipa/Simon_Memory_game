import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simon_memory_game/services/game_logic.dart';
import 'package:simon_memory_game/services/score.dart';
import 'game_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    String username;
    Function continueGameScreen = () {
      Provider.of<Score>(context, listen: false).resetScore();
      Provider.of<GameLogic>(context, listen: false).resetGame();
      Provider.of<GameLogic>(context, listen: false).addToGameList();
      Navigator.of(context).pop();

      if (username == null) {
        var random = Random();
        int anotherRandom = random.nextInt(1000);
        String nullPlayerName = 'Player #' + anotherRandom.toString();
        username = nullPlayerName;
      }
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GameScreen(username: username),
          ));
    };
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 250, right: 30, left: 30),
                  child: TypewriterAnimatedTextKit(
                    text: [
                      'Simon',
                      'Simon says',
                      'Just another game',
                      'meh...',
                      'why not?',
                    ],
                    textStyle: GoogleFonts.pressStart2p(
                        textStyle:
                            TextStyle(fontSize: 30, color: Colors.deepOrange)),
                    repeatForever: true,
                    speed: Duration(milliseconds: 500),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      FlatButton(
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
                              title: Text(
                                'Please enter a username',
                                style: TextStyle(color: Colors.black45),
                              ),
                              content: TextField(
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          color: Colors.orangeAccent,
                                          width: 1.5),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: Colors.orangeAccent,
                                          width: 1.5),
                                    ),
                                    icon: Icon(
                                      Icons.person_add,
                                      color: Colors.deepOrange,
                                    ),
                                    hintText: 'Username'),
                                onChanged: (value) {
                                  username = value;
                                },
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text(
                                    'Continue',
                                    style: TextStyle(color: Colors.deepOrange),
                                  ),
                                  splashColor:
                                      Colors.deepOrange.withOpacity(0.2),
                                  onPressed: continueGameScreen,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      FlatButton(
                        child: Text(
                          'Scores',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/scoresScreen');
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
